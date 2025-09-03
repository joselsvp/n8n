#!/usr/bin/env node

/**
 * Start script for n8n on Render
 * This script ensures n8n starts properly in the Render environment
 */

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

// Start n8n directly
require('n8n/bin/n8n');
