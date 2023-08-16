use hsl::HSL;
use itertools_num::linspace;
use num::{self, signum, Float};
use std::{
    collections::HashMap,
    f64::consts::{E, PI},
    process,
    rc::Rc,
};
use transvoxel::generic_mesh::GenericMeshBuilder;
use transvoxel::prelude::*;
use wasm_bindgen::prelude::*;

const A0: f64 = 1.0;
const RYD: f64 = 13.6;
const PRECISION: usize = 50;
const RAD2DEG: f64 = 180f64 / PI;

// factorielle recursive
fn facto(n: u64) -> u64 {
    if n == 0 {
        return 1;
    }
    if n == 1 {
        return 1;
    } else {
        n * facto(n - 1)
    }
}

// aproximation de factorielle
fn stirling(n: u64) -> u64 {
    let val = (2f64 * PI * n as f64).sqrt()
        * (n as f64 / E).powi(n as i32)
        * (1f64 + 1f64 / (12f64 * n as f64));
    if val.is_finite() {
        return val.ceil() as u64;
    } else {
        panic!("val is infinite")
    }
}

// coefficients binomiaux
fn cobi(n: u64, k: u64) -> f64 {
    facto(n) as f64 / (facto(k) * facto(n - k)) as f64
}

fn parity(n: i64) -> i64 {
    // (-1)^n
    if n % 2 == 0 {
        return 1;
    } else if n % 2 == 1 {
        return -1;
    } else {
        panic!("parity error")
    }
}

#[derive(Clone)]
#[wasm_bindgen]
pub struct PolyLegendre {
    coefs: HashMap<u64, f64>,
    mult: f64, // se place devant le polynome, multiplie tous les termes ex : mult * (ax +b)
}

#[wasm_bindgen]
impl PolyLegendre {
    #[wasm_bindgen(constructor)]
    pub fn new(l: u64) -> Self {
        let mut coefs: HashMap<u64, f64> = HashMap::new();

        for k in 0..=l {
            let signe = parity((l - k) as i64);
            let coef = cobi(l, k) * signe as f64;
            coefs.insert(2 * k, coef);
        }
        let terme_mult = 1 as f64 / ((2u64).pow(l as u32) * facto(l)) as f64;

        let mut polynom = PolyLegendre {
            coefs,
            mult: terme_mult,
        };
        polynom.apply_derivatives(l);
        return polynom;
    }
    pub fn apply_derivative(&mut self) {
        let mut new_coefs: HashMap<u64, f64> = HashMap::new();
        for power in self.coefs.keys() {
            let coef = match self.coefs.get(power) {
                Some(v) => v,
                None => panic!("failed to retrieve coef"),
            };
            let new_coef = coef * *power as f64;
            if *power >= 1u64 {
                new_coefs.insert(*power - 1, new_coef);
            }
        }
        self.coefs = new_coefs;
    }
    pub fn apply_derivatives(&mut self, order: u64) {
        for _ in 0..order {
            self.apply_derivative();
        }
    }
    pub fn eval_poly_old(&self, u: f64) -> f64 {
        let mut result: f64 = 0.;
        for (power, coef) in &self.coefs {
            result += *coef as f64 * u.powi(*power as i32);
        }
        result
    }
    pub fn eval_poly(&self, u: f64) -> f64 {
        let mut result: f64 = 0.;
        for (power, coef) in &self.coefs {
            result += *coef as f64 * u.powi(*power as i32);
        }
        result
    }
    pub fn eval(&self, u: f64) -> f64 {
        self.eval_poly(u) * self.mult
    }
    pub fn eval_sign(&self, u: f64) -> f64 {
        signum(self.eval_poly(u))
    }
}

#[derive(Clone)]
#[wasm_bindgen(getter_with_clone)]
pub struct FunctionLegendre {
    m: i64,
    pub poly: PolyLegendre,
}

#[wasm_bindgen]
impl FunctionLegendre {
    #[wasm_bindgen(constructor)]
    pub fn new(l: u64, m: i64) -> Self {
        let mut poly = PolyLegendre::new(l);
        poly.apply_derivatives(m.abs() as u64);
        FunctionLegendre { m, poly }
    }
    pub fn eval(&self, theta: f64) -> f64 {
        (theta.sin()).powi(self.m.abs() as i32) * self.poly.eval(theta.cos())
    }
    pub fn eval_sign(&self, theta: f64) -> f64 {
        self.poly.eval_sign(theta.cos())
    }
}

#[derive(Clone)]
#[wasm_bindgen(getter_with_clone)]
pub struct Angulaire {
    pub poly: FunctionLegendre,
    eval: Rc<dyn Fn(f64) -> f64>,
    wave_type: String,
}

#[wasm_bindgen]
impl Angulaire {
    #[wasm_bindgen(constructor)]
    pub fn new(l: u64, m: i64, wave_type: &str) -> Self {
        if m.abs() as u64 > l {
            println!("m > l");
            process::exit(1);
        }
        let mult = ((2 * l + 1) * facto(l - m.abs() as u64) as u64) as f64
            / (4f64 * PI * facto(l + m.abs() as u64) as f64);
        let poly = FunctionLegendre::new(l, m);

        let eval: Rc<dyn Fn(f64) -> f64> = match wave_type {
            "modulus" => {
                let poly = poly.clone();
                Rc::new(move |theta: f64| mult.sqrt() * poly.eval(theta).abs())
            }
            "density" => {
                let poly = poly.clone();
                Rc::new(move |theta: f64| theta.sin() * mult * poly.eval(theta).powi(2))
            }
            _ => {
                panic!("non existing wave type")
            }
        };
        Angulaire {
            poly,
            eval,
            wave_type: wave_type.to_string(),
        }
    }
    pub fn eval_range_values(&self) -> EvalRes {
        let range: Vec<f64> = linspace(0f64, PI, PRECISION * 10).collect();
        let values: Vec<f64> = range
            .iter()
            .map(|item| self.eval.to_owned()(*item))
            .collect();
        let avr = get_averrage(&values);
        let legend = match &*self.wave_type {
            "density" => r#"$\sin(\theta)|Y_{l}^{m}(\theta)^2|$"#,
            "modulus" => r#"$|Y_{l}^{m}(\theta)|$"#,
            _ => {
                panic!("non existing wave type")
            }
        }
        .to_string();
        EvalRes {
            range,
            values,
            avr,
            dist: 2f64 * PI,
            legend,
        }
    }
    pub fn eval_sign(&self, theta: f64) -> f64 {
        self.poly.eval_sign(theta)
    }
}

#[wasm_bindgen]
#[derive(Clone)]
pub struct PolyLaguerreGen {
    coefs: HashMap<i64, f64>,
}

#[wasm_bindgen]
impl PolyLaguerreGen {
    #[wasm_bindgen(constructor)]
    pub fn new(nr: u64, l: u64) -> Self {
        let alpha = 2 * l + 1;
        let mut coefs: HashMap<i64, f64> = HashMap::new();
        for i in 0..=nr {
            let coef = (parity(i as i64) as f64 * cobi(alpha + nr, nr - i)) / facto(i) as f64;
            coefs.insert(i as i64, coef);
        }
        PolyLaguerreGen { coefs }
    }
    pub fn eval(&self, u: f64) -> f64 {
        let mut result = 0f64;
        for (power, coef) in &self.coefs {
            result += coef * u.powi(*power as i32);
        }
        result
    }
}

#[wasm_bindgen(getter_with_clone)]
#[derive(Clone)]
pub struct Radial {
    pub poly: PolyLaguerreGen,
    p: f64,
    eval: Rc<dyn Fn(f64) -> f64>,
    wave_type: String,
}

#[wasm_bindgen]
impl Radial {
    #[wasm_bindgen(constructor)]
    pub fn new(n: u64, l: u64, z: u64, wave_type: &str) -> Self {
        let nr = n - 1 - l;
        let mult2 = (4 * z.pow(3) * facto(nr)) as f64
            / (n.pow(4) as f64 * A0.powi(3) * facto(n + l) as f64);
        let p = (2 * z) as f64 / (n as f64 * A0);
        let poly = PolyLaguerreGen::new(nr, l);
        let eval: Rc<dyn Fn(f64) -> f64> = match wave_type {
            "modulus" => {
                let mult = mult2.clone();
                let poly = poly.clone();
                Rc::new(move |r: f64| {
                    let u = p * r;
                    (mult * u.powi(2 * l as i32) * poly.eval(u).powi(2) * E.powf(-u)).sqrt()
                })
            }
            "density" => {
                let mult = mult2.clone();
                let poly = poly.clone();
                Rc::new(move |r: f64| {
                    let u = p * r;
                    r.powi(2) * mult * u.powi(2 * l as i32) * poly.eval(u).powi(2) * E.powf(-u)
                })
            }
            _ => {
                panic!("non existing wave type")
            }
        };
        Radial {
            poly,
            p,
            eval,
            wave_type: wave_type.to_string(),
        }
    }
    pub fn eval_range_values(&self) -> EvalRes {
        let mut d = 0f64; // distance parcourue
        let mut total_eval: Vec<f64> = Vec::new();
        let mut total_range: Vec<f64> = Vec::new();
        let mut total_avr = 0f64;
        let mut current_max = 0f64;
        let mut counter = 0;
        loop {
            counter += 1;
            let mut current_range: Vec<f64> = linspace(d, d + 10f64, PRECISION).collect();
            let mut current_eval: Vec<f64> = current_range
                .iter()
                .map(|item| self.eval.to_owned()(*item))
                .collect();
            let possible_new_max = current_eval.iter().copied().fold(f64::NAN, f64::max);
            if possible_new_max > current_max {
                current_max = possible_new_max;
            }
            let current_avr = get_averrage(&current_eval);
            if current_avr < current_max / 1000f64 {
                break;
            } else {
                total_avr += current_avr;
                total_range.append(&mut current_range);
                total_eval.append(&mut current_eval);
                d += 10f64;
            }
        }
        let legend = match &*self.wave_type {
            "density" => r#"$r^2|R_{n_{r}l}(r)|^2$"#,
            "modulus" => r#"$|R_{n_{r}l}(r)|$"#,
            _ => panic!("non existring wave type"),
        }
        .to_string();
        EvalRes {
            range: total_range,
            values: total_eval,
            avr: (total_avr / counter as f64),
            dist: d,
            legend,
        }
    }
    pub fn eval_sign(&self, r: f64) -> f64 {
        signum(self.poly.eval(self.p * r))
    }
}

pub fn get_averrage(values: &Vec<f64>) -> f64 {
    let mut res = 0f64;
    for val in values.clone() {
        res += val;
    }
    res / values.len() as f64
}

#[wasm_bindgen(getter_with_clone)]
pub struct EvalRes {
    pub range: Vec<f64>,
    pub values: Vec<f64>,
    pub avr: f64,
    pub dist: f64,
    pub legend: String,
}

#[derive(Clone)]
#[wasm_bindgen(getter_with_clone)]
pub struct Wave {
    pub angulaire: Angulaire,
    pub radial: Radial,
}

#[wasm_bindgen]
impl Wave {
    #[wasm_bindgen(constructor)]
    // the input comes from javascript which does not use 64bit integers (except for BigInt)
    pub fn new(n: i32, l: i32, m: i32, z: i32, wave_type: &str) -> Result<Wave, String> {
        let mut errors = Vec::new();
        if n < 1 {
            errors.push("wrong N value".to_string());
        }
        if l < 0 {
            errors.push("L should be > 0".to_string());
        }
        if l >= n {
            errors.push("L should be < N".to_string());
        }
        if m.abs() > l {
            errors.push("M should be contained within [-L, L]".to_string());
        }
        if !errors.is_empty() {
            return Err(format!("{}", errors.join("; ")));
        } else {
            let angulaire = Angulaire::new(l as u64, m as i64, wave_type);
            let radial = Radial::new(n as u64, l as u64, z as u64, wave_type);
            Ok(Wave { angulaire, radial })
        }
    }
    pub fn eval(&self, x: f32, y: f32, z: f32) -> f32 {
        let r = (x * x + y * y + z * z).sqrt();
        let theta = (y / r).acos();
        return (self.radial.eval.to_owned()(r as f64)
            * self.angulaire.eval.to_owned()(theta as f64)) as f32;
    }
    pub fn eval_sign(&self, theta: f64, r: f64) -> f64 {
        self.angulaire.eval_sign(theta) * self.radial.eval_sign(r)
    }
}

#[wasm_bindgen]
pub struct MarchingCubes {
    wave: Wave,
    block: Block<f32>,
    avr: f32,
}

#[wasm_bindgen]
impl MarchingCubes {
    #[wasm_bindgen(constructor)]
    pub fn new(wave: Wave, size: f32, subdivisions: usize, avr: f32) -> Self {
        let block = Block::from(
            [-size / 2f32, -size / 2f32, -size / 2f32],
            size,
            subdivisions,
        );
        MarchingCubes { wave, block, avr }
    }
    pub fn get_res(&mut self, threshold: f32, material_type: &str) -> MarchingCubesResult {
        let wave = |x: f32, y: f32, z: f32| self.wave.eval(x, y, z);
        let transition_sides = transition_sides::no_side();
        let builder = GenericMeshBuilder::new();
        let builder = extract_from_field(&wave, &self.block, threshold, transition_sides, builder);
        let mesh = builder.build();
        let coord2color = self.generate_coord2color(material_type, threshold);
        let chunks: Vec<f32> = mesh
            .positions
            .clone()
            .chunks(3)
            .map(|pos| {
                let pos = pos.to_vec();
                if pos.len() != 3 {
                    panic!("wrong lenght")
                }
                Pos {
                    x: pos[0],
                    y: pos[1],
                    z: pos[2],
                }
            })
            .map(|pos| coord2color(pos))
            .flatten()
            .collect();
        MarchingCubesResult {
            vertices: mesh.positions,
            indices: mesh.triangle_indices,
            normals: mesh.normals,
            colors: chunks,
        }
    }
    fn generate_coord2color(
        &self,
        material_type: &str,
        threshold: f32,
    ) -> Box<dyn Fn(Pos<f32>) -> Vec<f32>> {
        let wave = self.wave.clone();
        let cut: Box<dyn Fn(f64) -> f32>;
        let luminosity =
            (1f32 / (E.powf(-((threshold - self.avr) * 100f32) as f64) as f32 + 1f32) as f32) * 0.8;
        match material_type {
            "full" => {
                cut = Box::new(|_: f64| 1.0);
            }
            "see_through" => {
                cut = Box::new(|_: f64| 0.8);
            }
            "cut_see_through" => {
                cut = Box::new(|phi: f64| if phi > 0.0 && phi < 90.0 { 0.1 } else { 0.8 });
            }
            "cut_full" => {
                cut = Box::new(|phi: f64| if phi > 0.0 && phi < 90.0 { 0.1 } else { 1.0 });
            }
            _ => {
                panic!("non-existing material type")
            }
        }
        Box::new(move |pos: Pos<f32>| {
            let x = pos.x as f64;
            let y = pos.y as f64;
            let z = pos.z as f64;
            let mut signe = signum(x);
            if signe.is_nan() {
                signe = 1f64;
            }
            let mut phi: f64 = (signe * (z / (z.powi(2) + x.powi(2)).sqrt()).acos()) * RAD2DEG;
            let r = (x.powi(2) + y.powi(2) + z.powi(2)).sqrt();
            let theta: f64 = (y / r).acos();
            let mod_sign = wave.eval_sign(theta, r);
            let opacity = cut(phi);
            phi = phi * wave.angulaire.poly.m as f64;
            if mod_sign as i64 == -1 {
                phi += 180f64;
            }
            phi = bound360(phi);
            let hsl_val = HSL {
                h: phi,
                s: 1_f64,
                l: luminosity as f64,
            };
            let rgb_val = hsl_val.to_rgb();
            vec![
                rgb_val.0 as f32 / 255f32,
                rgb_val.1 as f32 / 255f32,
                rgb_val.2 as f32 / 255f32,
                opacity,
            ]
        })
    }
}

fn bound360(phi: f64) -> f64 {
    let sign = signum(phi);
    let a = (phi / 360.0).abs().floor() as u64;
    if a > 0 {
        return phi - sign * (a * 360) as f64;
    } else {
        return phi
    }
}

struct Pos<T>
where
    T: Float,
{
    x: T,
    y: T,
    z: T,
}

#[wasm_bindgen(getter_with_clone)]
pub struct MarchingCubesResult {
    pub vertices: Vec<f32>,
    pub indices: Vec<usize>,
    pub normals: Vec<f32>,
    pub colors: Vec<f32>,
}
