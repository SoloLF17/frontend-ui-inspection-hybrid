# Frontend UI Inspection — pacote hibrido (Completo + Prompt-only)

Escolha uma das duas versoes:

## 1) complete/ (recomendado para OpenCode)
- Instaladores (sh/ps1/bat) + MCP Playwright + skill.
- Permite Modo A (navegador automatizado) e Modo B.
- Use se o agente suporta MCP/skills.

## 2) prompt-only/ (qualquer agente)
- Sem instalacao e sem MCP.
- Funciona por Modo B (prints) em qualquer chat/agente.
- Ideal para Claude/ChatGPT/Gemini web, Cursor, VS Code sem Node.

## Como decidir
- Tem OpenCode e quer iteracao rapida? -> complete/
- Quer portabilidade maxima e zero setup? -> prompt-only/

## Integracao por agente
Veja `complete/agents/agent-integration.md` (mesmo arquivo vale para prompt-only).

## Conteudo
- `complete/` — pacote completo com instaladores
- `prompt-only/` — pacote sem MCP
