/** @type {import('vite').UserConfig} */
export default {
  root: './web',
  publicDir: './public',
  build: {
    target: 'es2020',
    outDir: '../_build/dist',
    emptyOutDir: true,
    lib: {
      entry: './js/index.js',
      name: 'index',
      fileName: (_format) => `index.js`,
      formats: ['es']
    }
  },
  resolve: {
    alias: {
      '@': './web'
    }
  }
}
