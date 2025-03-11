#!/usr/bin/env bash
set -e  # Exit script immediately on error

echo "-----> Generating Cloudflare config.yml dynamically..."

# Ensure the cloudflared directory exists
mkdir -p /app/.cloudflared

# Write Cloudflare tunnel credentials to file
echo "${CLOUDFLARE_TUNNEL_CREDENTIALS}" > /app/.cloudflared/tunnel.json

# Generate config.yml with runtime values
cat <<EOF > /app/.cloudflared/config.yml
tunnel: ${CLOUDFLARE_TUNNEL_ID}
credentials-file: /app/.cloudflared/tunnel.json
ingress:
  - hostname: api.combinepensions.com
    path: /${HEROKU_APP_NAME}/*
    service: http://localhost:${PORT}
  - service: http_status:404
EOF

echo "-----> Cloudflare config.yml generated:"
cat /app/.cloudflared/config.yml
