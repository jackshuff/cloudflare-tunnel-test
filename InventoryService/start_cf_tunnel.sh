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

# Check if the cloudflared binary exists
if [[ ! -x "$CLOUDFLARE_BINARY" ]]; then
    echo "❌ Error: Cloudflare Tunnel binary not found or not executable: $CLOUDFLARE_BINARY"
    exit 1
fi

# Start Cloudflare Tunnel
"$CLOUDFLARE_BINARY" tunnel --config "$CLOUDFLARE_CONFIG" run

echo "✅ Cloudflare Tunnel started successfully."
