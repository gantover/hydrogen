<script>
  export let draw_container;
  export let draw_box;
  export let plots_container;
  export let plot_radial;
  export let plot_angular;
  export let gui_option;
</script>

<div
  id="draw_box"
  bind:this={draw_container}
  class={gui_option !== "3dwave" ? "none" : ""}
>
  <canvas bind:this={draw_box} />
</div>

<div
  id="plots_box"
  bind:this={plots_container}
  class={gui_option !== "2dwave" ? "none" : ""}
>
  <div id="plot_radial" bind:this={plot_radial} />
  <div id="plot_angular" bind:this={plot_angular} />
</div>

<style>
  .none {
    display: none;
  }
</style>
