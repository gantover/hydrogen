<script>
  import { createEventDispatcher } from "svelte";
  const dispatcher = createEventDispatcher();
  let material_type;
  export let iso_values = [];
  export let materials = [];
  export let new_iso_value;
  $: {
    getExpFormat()
  }
  function getExpFormat() {
    new_iso_value = parseFloat(new_iso_value).toExponential(2);
  }
  export function updateNewIsoValue() {
    getExpFormat()
  }
  let wireframe_toggle = false;
  function addIsoValue() {
    materials = [...materials, material_type];
    iso_values = [...iso_values, { visible: true, val: parseFloat(new_iso_value) }];
    dispatcher("send_iso_value", {
      iso_value: new_iso_value,
      material_type: material_type,
      wireframe: wireframe_toggle,
    });
  }
  function removeIsoValue(index) {
    iso_values.splice(index, 1);
    iso_values = iso_values;
    materials.splice(index, 1);
    materials = materials;
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
<input type="number" bind:value={new_iso_value} step={new_iso_value/10} 
  on:blur={() => getExpFormat()} 
  on:change={()=> getExpFormat()}
  on:mouseover={()=> getExpFormat()}
  on:focus={()=> getExpFormat()}/>
<select
  name="material_type"
  id="select_material_type"
  bind:value={material_type}
>
  <option value="full">full</option>
  <option value="cut_full">cut-full</option>
  <option value="see_through">see-through</option>
  <option value="cut_see_through">cut-see-through</option>
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
          {val.val.toExponential(2)}
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
