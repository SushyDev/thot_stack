import { defineConfig } from 'vite'
import tailwindcss from '@tailwindcss/vite'
import { resolve } from 'path'
import { glob } from 'glob'

const inputs = glob.sync('./web/js/**/*.js').reduce((acc, path) => {
	const name = path.replace('web/js/', '').replace('.js', '')
	acc[name] = resolve(__dirname, path)
	return acc
}, {})

export default defineConfig({
	root: '.',
	publicDir: './web/public',
	plugins: [tailwindcss()],
	base: '/dist/',
	build: {
		target: 'es2022',
		outDir: './_build/dist',
		emptyOutDir: true,
		cssCodeSplit: false,
		rollupOptions: {
			input: inputs,
			output: {
				entryFileNames: 'assets/[name].js',
				chunkFileNames: 'assets/[name].js',
				assetFileNames: 'assets/[name].[ext]'
			}
		}
	},
	resolve: {
		alias: {
			'@': resolve(__dirname, 'web/js')
		}
	}
})
