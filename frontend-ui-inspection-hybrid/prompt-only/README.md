# Frontend UI Inspection — versão prompt-only (sem MCP)

Esta versão não depende de Playwright MCP. Funciona em qualquer agente de IA que aceite contexto/prompt, usando prints fornecidos pelo usuário.

## Como usar
1. Copie `SYSTEM_PROMPT.txt` como system prompt/contexto do agente.
2. (Opcional) Anexe `SKILL.md` se o agente suportar mais contexto.
3. Peça a edição: "Edite o botão Entrar na home" e anexe o print (Modo B) ou use ferramentas do agente, se existirem.

## Modo B (prints)
- Salve prints em `/tmp/opencode/ui-<label>.png`.
- Marque o alvo (seta/retângulo) antes de salvar.
- O agente descreve o print e localiza o código por texto/classes.

## Limitações
- Sem navegador automatizado (sem DOM/estilos/console/rede).
- Depende da qualidade do recorte/marcação.

## Conteudo
- `SYSTEM_PROMPT.txt` — prompt curto
- `SKILL.md` — instrução completa (referência)
- `README.skill.md` — explicação simples da skill

## Integração por agente
Veja `agents/agent-integration.md` (Claude Code, Cursor, Codex, chat generico).

## Quando usar esta versão
- Agentes sem suporte a MCP ou sem Playwright.
- Chat web (ChatGPT/Claude.ai/Gemini).
- Qualquer ambiente onde você prefira enviar prints.
