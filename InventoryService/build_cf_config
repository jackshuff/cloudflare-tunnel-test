#!/usr/bin/env bash
set -e  # Exit script immediately on error

echo "-----> Generating Cloudflare config.yml dynamically..."

# Ensure the cloudflared directory exists
mkdir -p /app/.cloudflared

# Generate config.yml with runtime values
cat <<EOF > /app/.cloudflared/config.yml
ingress:
  - hostname: ${HEROKU_APP_NAME}.${CLOUDFLARE_TUNNEL_DOMAIN}
    service: http://localhost:${PORT}
  - service: http_status:404
EOF

echo "-----> Cloudflare config.yml generated:"
cat /app/.cloudflared/config.yml
