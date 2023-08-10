<script>
  import QuantumNumbers from "./menu/QuantumNumbers.svelte";
  import IsoValues from "./menu/IsoValues.svelte";
  export let iso_values;
  export let handle_draw_resize;
</script>

<QuantumNumbers on:send_quantum_numbers/>

<IsoValues
  bind:iso_values
  on:send_iso_value
  on:send_rm_iso_value
  on:send_visibility_layer
/>

<style>
</style>

