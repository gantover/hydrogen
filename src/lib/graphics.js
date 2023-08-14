import * as THREE from 'three';
import { OrbitControls } from 'three/addons/controls/OrbitControls.js';

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 2000);
let controls;
let canvas;

let marching_cubes;
let renderer;
let bindings;
let layers = [];

camera.position.z = 100;
camera.lookAt(new THREE.Vector3(0, 0, 0));

const animate = () => {
  requestAnimationFrame(animate);
  renderer.render(scene, camera);
};

export const resize = (c) => { // c stands for container (the div in which the canvas sits)
  let w = c.clientWidth - 3;
  let h = c.clientHeight - 3;
  renderer.setSize(w, h)
  camera.aspect = w / h;
  camera.updateProjectionMatrix();
};

export const createScene = (el, wasm) => {
  bindings = wasm;
  canvas = el;
  renderer = new THREE.WebGLRenderer({ antialias: true, canvas: el });
  controls = new OrbitControls(camera, renderer.domElement);
  animate();
}

export const initDefaultLayer = (mc, isovalue, camera_dist) => {
  scene.clear();
  marching_cubes = mc;
  let material = getMaterial();
  let geometry = getGeometry(isovalue, "cut_see_through");
  let mesh = new THREE.Mesh(geometry, material)
  getLighting(mesh);
  layers = [mesh];
  scene.add(mesh);
  camera.position.z = camera_dist;
  camera.lookAt(new THREE.Vector3(0, 0, 0));
}

export const addLayer = (input) => {
  let material = getMaterial();
  switch (input.material_type) {
    case 'full': material.transparent = false;
      break;
    case 'cut_full': material.transparent = true;
      break;
    case 'see_through': material.transparent = true;
      break;
    case 'cut_see_through': material.transparent = true;
      break;
  }
  if (input.wireframe === true) {
    material.wireframe = true;
  }
  let geometry = getGeometry(input.iso_value, input.material_type);
  let mesh = new THREE.Mesh(geometry, material);
  layers.push(mesh);
  console.log(layers)
  scene.add(mesh);
};

export const removeLayer = (index) => {
  scene.remove(layers[index]);
  layers.splice(index, 1);
};

export const changeLayerVisibility = (index, state) => {
  layers[index].visible = state;
}

const getMaterial = () => {
  const material = new THREE.MeshPhongMaterial({
    onBeforeCompile: (shader) => {
      material.vertexColors = true
      material.userData.shader = shader
      shader.fragmentShader = shader.fragmentShader.replace(`#include <color_fragment>`,
        `#include <color_fragment>
          diffuseColor = vColor;`)
    },
  })
  material.transparent = true;
  material.vertexColors = true;
  material.side = THREE.DoubleSide;

  return material;
}

const getGeometry = (iso_value, material_type) => {
  let marching_cubes_res = marching_cubes.get_res(iso_value, material_type);
  const vertices = marching_cubes_res.vertices;
  const indices = Array.from(marching_cubes_res.indices);
  const normals = marching_cubes_res.normals;
  const colors = marching_cubes_res.colors;
  const geometry = new THREE.BufferGeometry();
  geometry.setIndex(indices);
  geometry.setAttribute('position', new THREE.BufferAttribute(vertices, 3));
  geometry.setAttribute('normal', new THREE.BufferAttribute(normals, 3));
  geometry.setAttribute('color', new THREE.BufferAttribute(colors, 4, true));
  return geometry;
}

const getLighting = (mesh) => {
  const light = new THREE.AmbientLight(0xffffff, 1.0);
  scene.add(light);
  var light2 = new THREE.SpotLight(0xffffff, 2.0, 1000);
  light2.position.set(0, 0, 200);
  light2.target = mesh;
  scene.add(light2);
  var point_light = new THREE.PointLight(0xff0000, 1, 200);
  point_light.position.set(0, 0, 150);
  scene.add(point_light);
}


