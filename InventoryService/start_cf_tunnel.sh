#!/usr/bin/env bash
set -e  # Exit immediately if a command fails

echo "-----> Starting Cloudflare Tunnel..."

# Ensure the Cloudflare directory exists
mkdir -p /app/.cloudflared

# Decode Cloudflare Tunnel credentials from Heroku environment variable (if stored as Base64)
if [ -n "$CLOUDFLARE_TUNNEL_CREDENTIALS" ]; then
    echo "Decoding Cloudflare Tunnel credentials from environment variable..."
    echo $CLOUDFLARE_TUNNEL_CREDENTIALS | base64 -d > /app/.cloudflared/tunnel.json
fi

# Start Cloudflare Tunnel
/app/cloudflared/cloudflared tunnel run \
    --config /app/.cloudflared/config.yml \
    --credentials-file /app/.cloudflared/tunnel.json &
    --label $HEROKU_APP_NAME
    
echo "✅ Cloudflare Tunnel started successfully."
