<script>
  import { createEventDispatcher } from "svelte";
  const dispatcher = createEventDispatcher();
  let material_type;
  export let iso_values = [];
  let new_iso_value;
  let wireframe_toggle = false;
  function addIsoValue() {
    iso_values = [...iso_values, { visible: true, val: new_iso_value }];
    dispatcher("send_iso_value", {
      iso_value: new_iso_value,
      material_type: material_type,
      wireframe: wireframe_toggle,
    });
  }
  function removeIsoValue(index) {
    iso_values.splice(index, 1);
    iso_values = iso_values;
    dispatcher("send_rm_iso_value", { index: index });
  }
  function handleVisibilityChange(e, index) {
    iso_values[index].visible = e.target.checked;
    // the visible attribute is only used inside this file, to keep track of the state of each isovalue item checkbox
    // if it was not being stored alongside the isovalue item, when we remove an isovalue item, the next remaining isovalue
    // item checkbox would inherit the state of the removed one;
    // https://learn.svelte.dev/tutorial/keyed-each-blocks : the problem is better explained here
    dispatcher("send_visibility_layer", {
      index: index,
      state: e.target.checked,
    });
  }
</script>

<h2>Isovalues</h2>
<input type="number" bind:value={new_iso_value} />
<select
  name="material_type"
  id="select_material_type"
  bind:value={material_type}
>
  <option value="full">full</option>
  <option value="see_through">see-through</option>
</select>
<label>
  <input type="checkbox" bind:checked={wireframe_toggle} />
  Wireframe
</label>
<button on:click={addIsoValue}>Add</button>

<table>
  {#each iso_values as val, index}
    <tr>
      <th>
        <input
          type="checkbox"
          on:click={(e) => handleVisibilityChange(e, index)}
          bind:checked={val.visible}
        />
      </th>
      <th>
        <p class="iso_value">
          {val.val}
        </p>
      </th>
      <th>
        <button class="remove_iso_value" on:click={() => removeIsoValue(index)}
          >x</button
        >
      </th>
    </tr>
  {/each}
</table>
