import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
	root: '.',
	publicDir: './web/public',
	plugins: [tailwindcss()],
	build: {
		target: 'es2022',
		outDir: './_build/dist',
		emptyOutDir: true,
		cssCodeSplit: false,
		lib: {
			entry: './web/js/index.js',
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
})
