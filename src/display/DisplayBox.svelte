<script>
  export let draw_container;
  export let draw_box;
  export let plots_container;
  export let plot_radial;
  export let plot_angular;
  export let gui_option;
  // class={(gui_option !== "3dwave" && gui_option !== "3d2dwave") ? "none" : ""}
  // class={(gui_option !== "2dwave" && gui_option !== "3d2dwave") ? "none" : ""}
  //class={(gui_option !== "3dwave" && gui_option !== "3d2dwave") ? "column none" : "column"}
  const drawBoxHandle = (gui_option, opt1, opt2) => {
    switch (gui_option) {
      case opt1:
        return "none"
      case opt2:
        return "single-column"
      case "3d2dwave":
        return "column"
    }
  }
</script>

<div
  id="draw_box"
  bind:this={draw_container}
  class={drawBoxHandle(gui_option, "2dwave", "3dwave")}
>
  <canvas bind:this={draw_box} />
</div>

<div
  id="plots_box"
  bind:this={plots_container}
  class={drawBoxHandle(gui_option, "3dwave", "2dwave")}
>
  <div id="plot_radial" bind:this={plot_radial} />
  <div id="plot_angular" bind:this={plot_angular} />
</div>

<style>
  .none {
    display: none;
  }
</style>
