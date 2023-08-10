# Hydrogen Wave Function Visualisation Program

> Credits : this visualisation of hydrogen is largely inspired by [Dr. Bernd Thaller](https://vqm.uni-graz.at/pages/thaller.html)'s [*quantum graphics gallery*](https://vqm.uni-graz.at/pages/qm_gallery/index.html)
> Technology used :
> - Svelte
> - Rust -> Wasm
> - Threejs, Mathjax, Plotly

### First Input

- 3 quantum numbers describe the electron state (omitting the spin):
	- N : main
	- L : orbital
	- M : magnetic
- You can either display the modulus of the wave function $|\Psi(r,\theta)|$ or its density of probability $r^2 \sin(\theta) |\Psi(r,\theta)|^2$
- The precision slider will change the density of sampled points in the 3d space.
- When ready, press apply. The values entered needs to be validated against a set of rules, if an error occur, it will be displayed on top.

### Adding Iso Values

In this visualisation, we first evaluate the wave function (modulus or density) in a subset of the 3D space, then we choose a value (*iso value*) that will retain the positions where the function evaluates to that value and make surfaces out of those positions.

On apply, a first iso value is inputed corresponding to the multiplication of the average of both the radial and the angular function.

To add new iso values, input a value not too far from the initial values (like 5x, 10x), then choose the type of material (full or see-through), wireframe is an option that shows the vertexes. We done, press *add*.
