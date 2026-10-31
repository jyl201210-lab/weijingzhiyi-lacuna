#!/usr/bin/env sh
# Lacuna (未竟之意) macOS / Linux One-Line Installer
set -eu
if ! command -v node >/dev/null 2>&1; then
  echo "[Lacuna] Node.js (>=20) is required. Install from https://nodejs.org first." >&2
  exit 1
fi
NODE_MAJOR="$(node -p "process.versions.node.split('.')[0]" 2>/dev/null || echo 0)"
if [ "$NODE_MAJOR" -lt 20 ]; then
  echo "[Lacuna] Node.js (>=20) is required. Please upgrade Node.js first." >&2
  exit 1
fi
BIN_DIR="$HOME/.lacuna/bin"
LOCAL_BIN="$HOME/.local/bin"
mkdir -p "$BIN_DIR" "$LOCAL_BIN"
TMP_MJS="$BIN_DIR/lacuna.tmp.$$.mjs"
trap 'rm -f "$TMP_MJS"' EXIT
trap 'rm -f "$TMP_MJS"; exit 1' INT TERM
curl -fsSL "https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/dist/lacuna.mjs" -o "$TMP_MJS"
node "$TMP_MJS" presets list >/dev/null
chmod +x "$TMP_MJS"
mv -f "$TMP_MJS" "$BIN_DIR/lacuna.mjs"
ln -sf "$BIN_DIR/lacuna.mjs" "$LOCAL_BIN/lacuna"
node "$BIN_DIR/lacuna.mjs" install --quiet
echo "[Lacuna] Installed to $LOCAL_BIN/lacuna. Try: lacuna help"
