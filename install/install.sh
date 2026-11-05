#!/usr/bin/env bash
# install/install.sh
# Instala a versao COMPLETA (MCP/Playwright) da skill, baixando APENAS os
# arquivos necessarios do GitHub, SEM clonar o repositorio inteiro.
set -euo pipefail

REPO="${REPO:-SoloLF17/frontend-ui-inspection-hybrid}"
BRANCH="${BRANCH:-main}"
SKILL_SUBPATH="${SKILL_SUBPATH:-frontend-ui-inspection-hybrid/complete}"
SKILL_NAME="${SKILL_NAME:-frontend-ui-inspection}"
TARGET_BASE="${TARGET_BASE:-$HOME/.config/opencode/skills}"
TARGET="$TARGET_BASE/$SKILL_NAME"

FILES=(
  "skill/frontend-ui-inspection/SKILL.md"
  "skill/frontend-ui-inspection/README.md"
  "agents/agent-integration.md"
  "config/opencode.config.snippet.json"
)

if ! command -v curl >/dev/null 2>&1; then
  echo "Erro: 'curl' nao encontrado." >&2
  exit 1
fi

BASE_URL="${BASE_URL:-https://raw.githubusercontent.com/${REPO}/${BRANCH}/${SKILL_SUBPATH}}"
echo "Baixando skill (complete) '${SKILL_NAME}'..."
echo "Fonte: ${BASE_URL}"
echo "Destino: ${TARGET}"

for f in "${FILES[@]}"; do
  rel="${f#skill/frontend-ui-inspection/}"
  [ "$rel" = "$f" ] && rel="$f"
  out="${TARGET}/${rel}"
  mkdir -p "$(dirname "$out")"
  url="${BASE_URL}/${f}"
  echo "  -> ${rel}"
  if ! curl -fsSL "$url" -o "$out"; then
    echo "Erro ao baixar ${url}" >&2
    exit 1
  fi
done

cat <<EOF

Instalacao concluida em: ${TARGET}

Proximos passos:
  1. (OpenCode) Configure o MCP 'browser' (Playwright) via ~/.config/opencode/opencode.json.
  2. Reinicie o OpenCode.
EOF
