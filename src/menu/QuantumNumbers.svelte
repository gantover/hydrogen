<script>
  import { createEventDispatcher } from "svelte";
  const dispatcher = createEventDispatcher();
  export let wave_type = "modulus";
  export let quantum_numbers = { n: 3, l: 2, m: -1 };
  export let precision = 100;
</script>

<h2>Quantum Parameters</h2>
<table>
  {#each Object.keys(quantum_numbers) as qn}
    <tr>
      <th>{qn.toUpperCase()}</th>
      <th>
        <input type="number" bind:value={quantum_numbers[qn]} />
      </th>
    </tr>
  {/each}
</table>

<select name="wave_type" id="select_wave_type" bind:value={wave_type}>
  <option value="modulus">modulus & colored phase</option>
  <option value="density">density & colored phase</option>
</select>

<div>
  <input
    type="range"
    step="5"
    min="50"
    max="200"
    bind:value={precision}
    name="precision"
  />
  <label for="precision">Precision: {precision}</label>
</div>

<button
  on:click={() => {
    dispatcher("send_quantum_numbers", {
      qn: quantum_numbers,
      wave_type: wave_type,
      precision: precision,
    });
  }}>Apply</button
>

<button
  on:click={() => {
    dispatcher("update_quantum_numbers", {
      qn: quantum_numbers,
      wave_type: wave_type,
      precision: precision,
    });
  }}>Update</button
>
