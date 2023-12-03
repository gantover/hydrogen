<script>
  import { onMount } from "svelte";
  import { createScene } from "./lib/graphics";
  import { resize } from "./lib/graphics";
  import { initDefaultLayer } from "./lib/graphics";
  import { addLayer } from "./lib/graphics";
  import { removeLayer } from "./lib/graphics";
  import { changeLayerVisibility } from "./lib/graphics";
  import { createPlot } from "./lib/plots";
  import { firstPresetLayer } from "./lib/graphics";
  import { addPresetLayer } from "./lib/graphics";
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
  let default_materials;
  let marching_cubes;
  let error = "";
  let gui_option = "3d2dwave";

  let quantum_numbers;
  let exported_wave_type;
  let exported_precision;

  let done_3d = false; // keeps track on if the calculation has already been done

  let updateNewIsoValue;

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
        case "3d2dwave":
          resize(draw_container);
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
      default_materials = ["cut_see_through"];
      handleGuiSelectionChange()
      error = "no error occured";
    } catch (ex) {
      error = ex.toString();
    } finally {
    }
  }

  function inputPreset(qn, isovalues, materials, wave_type, precision) {
    quantum_numbers = qn 
    exported_wave_type = wave_type
    exported_precision = precision
    handlingPreset(isovalues, materials, qn.n, qn.l, qn.m, wave_type, precision);
  }

  function handlingPreset(isovalues, materials, n, l, m, wave_type, precision) {
      // no need to verify anything since those numbers are either preset or
      default_materials = materials;
      let wave;
      try {
        wave = new bindings.Wave(n,l,m, 1, wave_type);
        radial_res = wave.radial.eval_range_values();
        angular_res = wave.angulaire.eval_range_values();
        default_iso_value = radial_res.avr * angular_res.avr;
        marching_cubes = new bindings.MarchingCubes(
          wave,
          radial_res.dist * 1.8,
          precision,
          default_iso_value
        );
        error = "no error occured";
      } catch (ex) {
        error = ex.toString();
      } finally {}
      firstPresetLayer(marching_cubes, isovalues[0], materials[0], radial_res.dist * 1.5)
      default_iso_values = [{ visible: true, val: isovalues[0]}];
      done_3d = true;
      handleGuiSelectionChange()
      for (let index = 1; index < isovalues.length; index++) {
        addPresetLayer(isovalues[index], materials[index]);
        default_iso_values = [...default_iso_values, { visible: true, val: isovalues[index]}];
      }
  }

  function handleUpdate(e) {
    done_3d = false;
    let iso_values_copy = [];
    for (let index = 0; index < default_iso_values.length; index++) {
      iso_values_copy = [...iso_values_copy, default_iso_values[index].val]
    }
    let materials_copy = default_materials
    let qn = e.detail.qn
    handlingPreset(iso_values_copy, materials_copy, qn.n, qn.l, qn.m, e.detail.wave_type, e.detail.precision)
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
      case "3d2dwave":
        if (!done_3d) {
          initDefaultLayer(
            marching_cubes,
            default_iso_value,
            radial_res.dist * 1.5
          );
          done_3d = true;
          handleResize(50);
          generatePlots();
          handleResize(50);
        } else {
          handleResize(50);
          generatePlots();
          handleResize(50);
        }
        break;
    }
  }

  function generatePlots(width_factor = 1) {
    let size = {
      w: plots_container.clientWidth / width_factor,
      h: plots_container.clientHeight / 2,
    };
    createPlot(plot_radial, radial_res, size);
    createPlot(plot_angular, angular_res, size);
  }
</script>

<div class="container">
    <div id="parameters" class="column">
    <h1 class="rainbow">Ψ</h1>
    <h1>Hydrogen Wave Function</h1>
      <Console bind:error />

      <button on:click={
      () => inputPreset({n:4, l:2, m:-1}, [0.0013966284126119062, 4.00e-3], ["cut_see_through", "full"], "modulus", 100)
      }>
      preset |4,2,-1>
      </button>

      <button on:click={
      () => inputPreset({n:11, l:5, m:1}, [1.13e-4, 1.76e-4], ["cut_see_through", "full"], "modulus", 135)
      }>
      preset |11,5,1>
      </button>

      <QuantumNumbers
        bind:quantum_numbers={quantum_numbers}
        bind:wave_type={exported_wave_type}
        on:send_quantum_numbers={(e) => {
        handleQuantumNumbers(e), handleResize(50);
        }}
        on:update_quantum_numbers={(e) => {handleUpdate(e), handleResize(50);}}
      />

      <IsoValues
        bind:new_iso_value={default_iso_value}
        bind:iso_values={default_iso_values}
        bind:materials={default_materials}
        bind:updateNewIsoValue={updateNewIsoValue}
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

