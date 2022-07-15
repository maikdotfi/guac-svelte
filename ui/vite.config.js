import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite'

/** @type {import('vite').UserConfig} */
//const config = {
//	plugins: [sveltekit()],
//            server: {
//              proxy: {
//                      '/tunnel': {
//                        target: 'http://localhost:4567',
//                        changeOrigin: true,
//                      },
//              },
//            },
//};
//const config = {
//	plugins: [sveltekit()],
//        kit: {
//          vite: {
//            server: {
//              proxy: {
//                      '/tunnel': {
//                        target: 'http://localhost:4567',
//                        changeOrigin: true,
//                      },
//              },
//            },
//          },
//        },
//};

//export default config;

export default defineConfig({
  plugins: [
    sveltekit()
  ],
  server: {
    proxy:{
      '/tunnel': {
        target: 'http://localhost:4567',
        changeOrigin: true
      }
    }
  }
})
