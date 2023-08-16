# Hydrogen Wave Function Visualisation Program

*example : n:4, l:2, m:-1*

<img src='docs_attachements/421layer2.png' style="width: 50%; margin-left: auto; margin-right: auto;" alt="example : n:4, l:2, m:-1"/>

> Credits : this visualisation of hydrogen is largely inspired by [Dr. Bernd Thaller](https://vqm.uni-graz.at/pages/thaller.html)'s [*quantum graphics gallery*](https://vqm.uni-graz.at/pages/qm_gallery/index.html)

> Objective : partially reproducing Dr. Bernd Thaller's hydrogen visualisation program for the web for easier acces ( and for fun :) )

## User-side documentation

### First Input (Quantum Parameters)

- 3 quantum numbers describe the electron state (omitting the spin):
	- N : main
	- L : orbital
	- M : magnetic
- You can either display the modulus of the wave function $|\Psi(r,\theta)|$ or its density of probability $r^2 \sin(\theta) |\Psi(r,\theta)|^2$
- The precision slider will change the density of sampled points in the 3d space.
- When ready, press **apply**. The values entered needs to be validated against a set of rules, if an error occur, it will be displayed on top.

### Input : Iso values

In this visualisation, we first evaluate the wave function (modulus or density) in a subset of the 3D space, then we choose a value (*iso value*) that will be used to decide what positions will be retained (where the function evaluates to that value). The surfaces is then generated out of those positions.

On apply, a first iso value is inputed corresponding to the multiplication of the average of both the radial and the angular function.

To add new iso values:
1. Input a value not too far from the initial values (like 5x, 10x)
2. Then, choose the type of material (full, cut-see-through), wireframe is an option that shows the vertexes. 
3. When done, press **add**.

Once its added : 
- the visibility can be toggled on and off by the checkbox on the left side
- the iso surface can be removed with **x**

### Output : Gui Selection

You can either show: 
- the isosurfaces (3d visualisation), (**default option**)
- the two functions (radial and angular) forming the hydrogen wave function : $\Psi = Y_l^m(\theta, \phi) R_{n_r,l} (r)$

### Output : color interpretation

The wave function is complex, a trick to reprensent both part in a reel space is to assign the shape to its modulus (or to a density function), and then assign the remainign complex phase to colors (their hue).

The color is represented using HSL values (hue, saturation, luminosity)

- the saturation is always set to 1.0
- the luminosity is follows the modulus. Higher iso value gets brighter colors.
- the hue represent the phase : $e^{i m \phi}$ and the sign of the wave function. example : -1 = $e^{i\pi}$ and the final result would be $e^{i m \phi + \pi}$

[link for more info (Dr. Bernd Thaller)](https://vqm.uni-graz.at/pages/colormap.html )

# Technical-side docs

### Technologies used :
- *Svelte* : front end framework
- *Rust -> Wasm* : data structures and methodes defined in a better suited language for intensive calculation. The methods and object creation gets called in javascript, the calculation is made in the wasm program, then a pointer to the final data is sent to javascript for display on the web)
- *Js librairies*
	- *Threejs* (to easily use webgl and display 3d shapes)
	- *Mathjax* (to display latex formulas)
	- *Plotly* (to plot functions)

*Work In Progress...* for now its better to ask me directly for user-side issues or new functionnality request (damian.hubert@ulb.be)