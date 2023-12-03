<script>
  export let error = "";
</script>

<div id="console">
{#each error.split(";") as err }
<div>
|Ψ> {err}
</div>
{/each}
</div>

<style>
  #console {
    background-color: black;
    color: #fab387;
    margin: 5px;
    padding: 5px;
    border-radius: 5px;
    overflow: auto;
  }
</style>

