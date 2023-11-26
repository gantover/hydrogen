<script>
  import { onMount } from "svelte";
  import { createScene } from "./lib/graphics";
  import { resize } from "./lib/graphics";
  import { initDefaultLayer } from "./lib/graphics";
  import { addLayer } from "./lib/graphics";
  import { removeLayer } from "./lib/graphics";
  import { changeLayerVisibility } from "./lib/graphics";
  import { createPlot } from "./lib/plots";
  import Console from "./menu/Console.svelte";
  import GuiSelection from "./menu/GuiSelection.svelte";
  import Docs from "./menu/Docs.svelte";
  import QuantumNumbers from "./menu/QuantumNumbers.svelte";
  import IsoValues from "./menu/IsoValues.svelte";
  import DisplayBox from "./display/DisplayBox.svelte";

  export let bindings;

  let draw_box;
  let draw_container;
  let plots_container;
  let plot_radial;
  let plot_angular;

  let radial_res;
  let angular_res;
  let default_iso_values;
  let default_iso_value = 0;
  let marching_cubes;
  let error = "";
  let gui_option = "3dwave";

  let done_3d = false; // keeps track on if the calculation has already been done

  var resizeTimer;

  onMount(() => {
    createScene(draw_box, bindings);
    window.addEventListener("resize", () => handleResize(50));
  });

  function handleResize(time) {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(() => {
      switch (gui_option) {
        case "3dwave":
          resize(draw_container);
          break;
        case "2dwave":
          generatePlots();
          break;
      }
    }, time);
  }

  function handleQuantumNumbers(e) {
    done_3d = false;
    let qn = e.detail.qn;
    let wave;
    try {
      wave = new bindings.Wave(qn.n, qn.l, qn.m, 1, e.detail.wave_type);
      radial_res = wave.radial.eval_range_values();
      angular_res = wave.angulaire.eval_range_values();
      default_iso_value = radial_res.avr * angular_res.avr;
      marching_cubes = new bindings.MarchingCubes(
        wave,
        radial_res.dist * 1.8,
        e.detail.precision,
        default_iso_value
      );
      default_iso_values = [{ visible: true, val: default_iso_value }];
      switch (gui_option) {
        case "3dwave":
          initDefaultLayer(
            marching_cubes,
            default_iso_value,
            radial_res.dist * 1.5
          );
          done_3d = true;
          break;
        case "2dwave":
          generatePlots();
      }
      error = "no error occured";
    } catch (ex) {
      error = ex.toString();
    } finally {
    }
  }

  function handleGuiSelectionChange() {
    switch (gui_option) {
      case "3dwave":
        if (!done_3d) {
          initDefaultLayer(
            marching_cubes,
            default_iso_value,
            radial_res.dist * 1.5
          );
          done_3d = true;
          handleResize(50);
        } else {
          handleResize(50);
        }
        break;
      case "2dwave":
        generatePlots();
        break;
    }
  }

  function generatePlots() {
    let size = {
      w: plots_container.clientWidth,
      h: plots_container.clientHeight / 2,
    };
    createPlot(plot_radial, radial_res, size);
    createPlot(plot_angular, angular_res, size);
  }
</script>

<div class="title">
  <h1 class="rainbow">Ψ</h1>
  <h1>Hydrogen Wave Function</h1>
</div>

<div id="flex-container">
  <div id="parameters">
    <Console bind:error />

    <QuantumNumbers
      on:send_quantum_numbers={(e) => {
        handleQuantumNumbers(e), handleResize(50);
      }}
    />

    <IsoValues
      bind:new_iso_value={default_iso_value}
      bind:iso_values={default_iso_values}
      on:send_iso_value={(e) => {
        addLayer(e.detail);
        handleResize(50);
      }}
      on:send_rm_iso_value={(e) => {
        removeLayer(e.detail.index);
        handleResize(50);
      }}
      on:send_visibility_layer={(e) =>
        changeLayerVisibility(e.detail.index, e.detail.state)}
    />

    <GuiSelection
      bind:gui_option
      on:change={() => handleGuiSelectionChange()}
    />

    <Docs />
  </div>

  <DisplayBox
    bind:draw_container
    bind:draw_box
    bind:plots_container
    bind:plot_radial
    bind:plot_angular
    bind:gui_option
  />
</div>
