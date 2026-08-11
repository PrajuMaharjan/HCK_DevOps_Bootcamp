import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173,
    host: true,
  },
  // Use relative base path or your exact repository name: '/<repository-name>/'
  base: './', 
  
});
