#!/bin/bash
# Update the encrypted dashboard from the source
# Usage: ./update.sh

set -e
cd "$(dirname "$0")"

# Copy latest dashboard from clearsar
cp ../clearsar/dashboard.html dashboard_source.html

# Re-encrypt
npx staticrypt dashboard_source.html -p "ClearSAR2026!" -o index.html --short

# Commit and push
git add index.html .staticrypt.json
git commit -m "Dashboard update $(date -u +%Y-%m-%dT%H:%M)" || echo "No changes"
git push origin main

echo "✅ Dashboard updated: https://noah-breaks.github.io/clearsar-tracker/"
