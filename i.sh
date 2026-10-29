#!/usr/bin/env sh
# Lacuna (未竟之意) macOS / Linux One-Line Installer
set -eu
if ! command -v node >/dev/null 2>&1; then
  echo "[Lacuna] Node.js (>=20) is required. Install from https://nodejs.org first." >&2
  exit 1
fi
BIN_DIR="$HOME/.lacuna/bin"
LOCAL_BIN="$HOME/.local/bin"
mkdir -p "$BIN_DIR" "$LOCAL_BIN"
curl -fsSL "https://jyl201210-lab.github.io/weijingzhiyi-lacuna/dist/lacuna.mjs" -o "$BIN_DIR/lacuna.mjs"
chmod +x "$BIN_DIR/lacuna.mjs"
ln -sf "$BIN_DIR/lacuna.mjs" "$LOCAL_BIN/lacuna"
node "$BIN_DIR/lacuna.mjs" install --quiet
echo "[Lacuna] Installed to $LOCAL_BIN/lacuna. Try: lacuna help"
