# CLAUDE.md — Autocaravanas PT (Website Público)

Ler em: C:\Users\marcu\Desktop\TOOLS\CLAUDE_DESKTOP_DIRECTIVES.md
Ler em: C:\Users\marcu\Desktop\TOOLS\VERSIONING-AND-WORKFLOW.md

---

## Projecto

Website público de compra e venda de autocaravanas usadas em Portugal.
Stack: HTML + CSS + JS puro (sem frameworks). Dois ficheiros principais.
Sem build step. Sem package.json. Sem node_modules.

---

## Pasta e ficheiros

```
C:\Users\marcu\Desktop\autocaravanas-pt\
├── index.html        — site público (homepage, stock, retomas, alertas, FAQ)
├── backoffice.html   — painel interno (stock, leads, gerador IA, Facebook, config)
├── bg-caravan.jpg    — imagem de fundo do hero
└── CLAUDE.md         — este ficheiro
```

---

## Acesso ao backoffice

- URL: abrir `backoffice.html` directamente no browser
- Entrada secreta: clicar duas vezes no ponto laranja no header do site público (nav-dot)
- Password: caravan2026
- Dados persistidos em: localStorage do browser

---

## API Backend (Caravan Hunter)

- URL: http://178.104.200.214:8002
- Uso: stock automático via Caravan Hunter (scraper)
- Porta reservada só para este projecto no VPS Hetzner
- Fallback: se API offline → mostra stock manual do localStorage (backoffice)

---

## Design system

| Token | Valor |
|-------|-------|
| --rust | #c4521a |
| --forest | #1a3a2a |
| --gold | #b8952a |
| --paper | #f5f0e8 |
| --cream | #ede8dc |
| --ink | #0e0f0c |
| --muted | #7a7265 |

Fontes: Playfair Display (títulos) + DM Sans (corpo) + DM Mono (labels/mono)

---

## Contacto no site

- WhatsApp: +351 927 402 278
- Todas as CTAs apontam para este número

---

## Estado actual — v0.2.0 (2026-05-12)

### Feito
- Homepage completa: hero, stock, tipologias, retomas, alertas, FAQ, CTA, footer
- Stock lê da API do Caravan Hunter com fallback para stock manual do backoffice
- Modal de detalhe ao clicar em viatura (foto, specs, WhatsApp directo)
- Backoffice: login, dashboard, gestão de stock, leads, gerador IA, Facebook preview, configurações
- Gerador IA com Anthropic API (requer API key nas Configurações do backoffice)
- Stock manual do backoffice aparece no site público via localStorage

### Pendente
- Conectar formulários do site ao backoffice (leads reais, não só demo data)
- Importar viaturas do Caravan Hunter directamente para stock público do backoffice
- Facebook API real (publicação automática)
- Deploy no Vercel (subdomínio gratuito)
- bg-caravan.jpg (foto de fundo do hero — usar foto de autocaravana)

---

## Regras deste projecto

- Sem frameworks — HTML/CSS/JS puro
- Sem build step — editar os ficheiros directamente
- Não usar git add -A — este projecto ainda não tem git init
- Para versionar: fazer git init primeiro, depois seguir TOOLS/GIT-FIRST-PUSH.bat
- Não criar ficheiros .md extra sem o Marcus pedir
- Não alterar a password do backoffice sem confirmar

---

## Workflow de sessão

1. Ler este CLAUDE.md
2. Ler TOOLS/CLAUDE_DESKTOP_DIRECTIVES.md e TOOLS/VERSIONING-AND-WORKFLOW.md
3. Implementar o que o Marcus pede
4. Entregar só os ficheiros alterados
5. Não versionar sem aprovação explícita
6. Quando Marcus disser "FULL PACKAGE RELEASE": fazer git init (se ainda não feito) + GIT-FIRST-PUSH.bat
