#!/data/data/com.termux/files/usr/bin/bash
set -e
cd "$(dirname "$0")"
if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is missing. Installing it through Termux..."
  pkg update
  pkg install -y nodejs
fi
NODE_MAJOR="$(node -p 'Number(process.versions.node.split(".")[0])')"
if [ "$NODE_MAJOR" -lt 18 ]; then
  echo "LinkCharts requires Node.js 18 or newer. Installed: $(node -v)"
  echo "Run: pkg upgrade && pkg install nodejs"
  exit 1
fi
echo "Starting LinkCharts on this phone..."
echo "Keep Termux open while using LinkCharts."
echo "In Chrome, open: http://127.0.0.1:5174"
echo "Stop LinkCharts with CTRL+C in Termux."
exec node server.mjs 5174
