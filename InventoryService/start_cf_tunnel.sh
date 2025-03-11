#!/usr/bin/env bash
set -e  # Exit immediately if a command fails

echo "-----> Starting Cloudflare Tunnel..."

# Ensure the Cloudflare directory exists
mkdir -p /app/.cloudflared

# Set Cloudflare Tunnel parameters as variables
CLOUDFLARE_CONFIG="/app/.cloudflared/config.yml"
CLOUDFLARE_CREDENTIALS="/app/.cloudflared/tunnel.json"
CLOUDFLARE_LABEL="app-name=${HEROKU_APP_NAME}"
CLOUDFLARE_BINARY="/app/cloudflared/cloudflared"

# Start Cloudflare Tunnel
$CLOUDFLARE_BINARY tunnel --config $CLOUDFLARE_CONFIG run

echo "✅ Cloudflare Tunnel started successfully."
