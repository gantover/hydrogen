<script>
  export let gui_option;
</script>

<h2>Gui Selection</h2>

<select name="gui" id="gui_select" bind:value={gui_option} on:change>
  <option value="3dwave">Orbitales 3D</option>
  <option value="2dwave">Fonctions</option>
</select>
