#!/usr/bin/env bash
# install/install-prompt-only.sh
# Instala a versao PROMPT-ONLY (sem MCP) baixando APENAS os arquivos da skill.
set -euo pipefail

REPO="${REPO:-SoloLF17/frontend-ui-inspection-hybrid}"
BRANCH="${BRANCH:-main}"
SKILL_SUBPATH="${SKILL_SUBPATH:-frontend-ui-inspection-hybrid/prompt-only}"
SKILL_NAME="${SKILL_NAME:-frontend-ui-inspection-prompt-only}"
TARGET_BASE="${TARGET_BASE:-$HOME/.config/opencode/skills}"
TARGET="$TARGET_BASE/$SKILL_NAME"

FILES=(
  "SKILL.md"
  "README.skill.md"
  "SYSTEM_PROMPT.txt"
  "agents/agent-integration.md"
)

if ! command -v curl >/dev/null 2>&1; then
  echo "Erro: 'curl' nao encontrado." >&2
  exit 1
fi

BASE_URL="${BASE_URL:-https://raw.githubusercontent.com/${REPO}/${BRANCH}/${SKILL_SUBPATH}}"
echo "Baixando skill (prompt-only) '${SKILL_NAME}'..."
echo "Fonte: ${BASE_URL}"
echo "Destino: ${TARGET}"

mkdir -p "$TARGET/agents"
for f in "${FILES[@]}"; do
  out="$TARGET/$f"
  mkdir -p "$(dirname "$out")"
  url="${BASE_URL}/${f}"
  echo "  -> $f"
  if ! curl -fsSL "$url" -o "$out"; then
    echo "Erro ao baixar ${url}" >&2
    exit 1
  fi
done

cat <<EOF

Instalacao concluida em: ${TARGET}

Modo prompt-only: use prints em /tmp/opencode/ui-*.png.
EOF
