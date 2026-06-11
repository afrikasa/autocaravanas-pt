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
├── index.html          — site público (homepage, stock, retomas, alertas, FAQ)
├── backoffice.html     — painel interno (stock, leads, gerador IA, Facebook, config)
├── bg-caravan.jpg      — imagem de fundo do hero
├── CLAUDE.md           — este ficheiro
├── CHANGELOG.md        — histórico técnico de versões
├── RELEASE_NOTES.md    — notas para utilizadores
├── ROADMAP.md          — features planeadas
├── FULL-RELEASE.bat    — script de deploy (git + tag + GitHub Release)
└── .gitignore
```

---

## Acesso ao backoffice

- URL: https://autocaravanas-pt.vercel.app/backoffice.html
- Entrada secreta: clicar duas vezes no ponto laranja no header do site público (nav-dot)
- Password: caravan2026
- Dados persistidos em: localStorage do browser

---

## API Backend (Caravan Hunter)

- URL: http://178.104.200.214:8003
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
- Botão escondido: duplo clique no nav-dot → abre backoffice
- Deploy no Vercel: https://autocaravanas-pt.vercel.app (deploy automático a cada push)
- GitHub: https://github.com/afrikasa/autocaravanas-pt

### Pendente
- Conectar formulários do site ao backoffice (leads reais, não só demo data)
- Importar viaturas do Caravan Hunter directamente para stock público do backoffice
- Facebook API real (publicação automática)
- bg-caravan.jpg (foto de fundo do hero — usar foto de autocaravana)

---

## SEQUENCIA OBRIGATORIA DE AGENTES

**O Claude principal NAO escreve codigo, NAO edita ficheiros, NAO faz commits, NAO faz deploy.**
**O Claude principal pensa, coordena e anuncia resultados. Toda a execucao e feita por agentes.**

Para qualquer pedido de implementacao, alteracao, fix ou deploy, a sequencia e SEMPRE:

```
1. feature-dev:code-architect   → ler o ficheiro + desenhar blueprint completo (SEMPRE PRIMEIRO)
2. feature-developer            → implementar o que o arquitecto definiu
3. code-reviewer                → rever o codigo produzido (OBRIGATORIO antes de qualquer commit)
4. devops-deployer              → commit + push (NUNCA sem aprovacao do code-reviewer)
```

### Regras de disparo

| Se o pedido for... | Spawnar primeiro |
|--------------------|-----------------|
| Nova feature / alteracao / adicionar campo | `feature-dev:code-architect` |
| Bug / erro / nao funciona | `bug-hunter` |
| Migracao DB / nova tabela / nova coluna | `feature-dev:code-architect` + migracao SSH dentro do plano |
| Deploy / commit / push | `code-reviewer` primeiro, depois `devops-deployer` |
| Pergunta sobre o codigo | Responder directamente (nao precisa de agente) |

### Nunca saltar passos

- Nunca fazer Edit/Write directamente — spawnar `feature-developer`
- Nunca fazer git commit/push directamente — spawnar `devops-deployer`
- Nunca deployar sem `code-reviewer` ter emitido APROVADO
- O arquitecto le sempre o ficheiro completo antes de planear

---

## Regras deste projecto

- Sem frameworks — HTML/CSS/JS puro
- Sem build step — editar os ficheiros directamente
- Nao usar git add -A — adicionar ficheiros especificos
- Nao criar ficheiros .md extra sem o Marcus pedir
- Nao alterar a password do backoffice sem confirmar
- Nao substituir imagens sem confirmar

---

## Git e Deploy

- Repositório: https://github.com/afrikasa/autocaravanas-pt
- Branch principal: main
- Vercel: https://autocaravanas-pt.vercel.app — deploy automático a cada push para main
- Para releases: correr FULL-RELEASE.bat na pasta do projecto
- Quando Marcus disser "FULL PACKAGE RELEASE": commit + push + tag + GitHub Release + actualizar CHANGELOG/RELEASE_NOTES

---

## Workflow de sessão

1. Ler este CLAUDE.md
2. Ler TOOLS/CLAUDE_DESKTOP_DIRECTIVES.md e TOOLS/VERSIONING-AND-WORKFLOW.md
3. Para qualquer pedido de implementacao: spawnar `feature-dev:code-architect` PRIMEIRO
4. Seguir a sequencia de agentes acima (arquitecto → implementacao → code-review → deploy)
5. Só criar tag/release com aprovação explícita
