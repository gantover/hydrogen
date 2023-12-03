<script>
  export let gui_option;
</script>

<h2>Gui Selection</h2>

<select name="gui" id="gui_select" bind:value={gui_option} on:change>
  <option value="3dwave">3D Orbitals</option>
  <option value="2dwave">Radial & Angular Functions</option>
  <option value="3d2dwave">Both</option>
</select>
