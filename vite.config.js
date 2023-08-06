import { defineConfig } from 'vite'
import { svelte } from '@sveltejs/vite-plugin-svelte'
import rust from '@wasm-tool/rollup-plugin-rust'

// https://vitejs.dev/config/
export default defineConfig({
  base: "/my-app/",
  plugins: [
    rust({
      verbose: true,
      serverPath: "build/"
    }),
    svelte()],
});
