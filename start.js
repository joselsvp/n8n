#!/usr/bin/env node

/**
 * Start script for n8n on Render
 * This script ensures n8n starts properly in the Render environment
 */

const { spawn } = require('child_process');
const path = require('path');

console.log('🚀 Starting n8n on Render...');

// Set environment variables for Render
process.env.N8N_HOST = process.env.N8N_HOST || '0.0.0.0';
process.env.N8N_PORT = process.env.N8N_PORT || process.env.PORT || '5678';
process.env.N8N_PROTOCOL = process.env.N8N_PROTOCOL || 'https';

// Ensure webhook URL is set correctly
if (!process.env.WEBHOOK_URL && process.env.RENDER_EXTERNAL_URL) {
  process.env.WEBHOOK_URL = process.env.RENDER_EXTERNAL_URL;
}

console.log('📋 Environment Configuration:');
console.log(`   Host: ${process.env.N8N_HOST}`);
console.log(`   Port: ${process.env.N8N_PORT}`);
console.log(`   Protocol: ${process.env.N8N_PROTOCOL}`);
console.log(`   Webhook URL: ${process.env.WEBHOOK_URL}`);

// Start n8n
const n8nProcess = spawn('n8n', ['start'], {
  stdio: 'inherit',
  env: process.env
});

n8nProcess.on('error', (error) => {
  console.error('❌ Error starting n8n:', error);
  process.exit(1);
});

n8nProcess.on('exit', (code) => {
  console.log(`n8n process exited with code ${code}`);
  process.exit(code);
});

// Handle graceful shutdown
process.on('SIGTERM', () => {
  console.log('🛑 Received SIGTERM, shutting down gracefully...');
  n8nProcess.kill('SIGTERM');
});

process.on('SIGINT', () => {
  console.log('🛑 Received SIGINT, shutting down gracefully...');
  n8nProcess.kill('SIGINT');
});
