import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  // Use relative base path or your exact repository name: '/<repository-name>/'
  base: './', 

});
