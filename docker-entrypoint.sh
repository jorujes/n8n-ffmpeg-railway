#!/bin/sh
set -eu

DATA_ROOT="${N8N_BINARY_DATA_STORAGE_PATH:-/home/node/data/binary}"
DATA_BASE="$(dirname "$DATA_ROOT")"
WORK_DIR="${DATA_BASE}/work"

mkdir -p "$DATA_ROOT" "$WORK_DIR" || true
chown -R 1000:1000 "$DATA_BASE" || true
chmod -R u+rwX "$DATA_BASE" || true

exec n8n start
