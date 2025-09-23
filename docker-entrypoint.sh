#!/usr/bin/env bash
set -euo pipefail

# Caminho onde você montou o volume no Railway
DATA_ROOT="${N8N_BINARY_DATA_STORAGE_PATH:-/home/node/data/binary}"
DATA_BASE="$(dirname "$DATA_ROOT")"          # /home/node/data
WORK_DIR="${DATA_BASE}/work"                 # /home/node/data/work

# Garante que existem e são graváveis
mkdir -p "$DATA_ROOT" "$WORK_DIR" || true
# 1000:1000 = usuário 'node' na imagem oficial do n8n
chown -R 1000:1000 "$DATA_BASE" || true
chmod -R u+rwX "$DATA_BASE" || true

# Se quiser rodar o n8n como 'node', descomente a linha abaixo e comente a de baixo:
# exec su -s /bin/bash -c "n8n start" node

# Simples: rode como root mesmo (funciona também)
exec n8n start
