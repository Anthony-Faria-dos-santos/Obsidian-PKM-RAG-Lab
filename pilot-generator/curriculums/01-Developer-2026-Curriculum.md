---
titre: "Développeur 2026 — Curriculum et clusters Obsidian"
type: curriculum-détaillé
domaine: Développement
statut: proposition-initiale
créé: 2026-04-22
version: 1.0
companion_de: "00-Architecture-Vault-Second-Brain.md"
---

# Track Développeur 2026 — Curriculum complet et clusters Obsidian

> Expansion détaillée du Domaine 2 de l'architecture maître. Objectif : couvrir ce qu'un développeur doit maîtriser en 2026 pour rester au top, dans le bon ordre de progression, avec les clusters Obsidian prêts à être lancés via le protocole `PROMPT-PILOT.md`.

---

## 1. Ce qui a changé en 2026 (et pourquoi il faut repenser le curriculum)

Le métier de développeur 2026 n'est plus celui de 2022. Quatre ruptures majeures structurent ce curriculum :

**Rupture 1 — L'IA devient une primitive du développement**, au même titre que la base de données ou le cache. Les agents de codage (Claude Code, Cursor, Aider, Zed AI) transforment le workflow quotidien. Un dev qui ne maîtrise pas l'orchestration d'agents en 2026 est dans la position d'un dev qui refusait d'apprendre Git en 2015.

**Rupture 2 — Le contexte devient la ressource critique.** Ce n'est plus le code qu'on écrit qui est rare, c'est la capacité à construire des contextes précis pour un LLM (context engineering, memory systems, RAG, MCP). La discipline « prompt engineering » s'élargit en « context engineering » au sens large.

**Rupture 3 — Les stacks convergent vers la performance native.** Python 3.13 free-threaded (sans GIL), Java 21 avec virtual threads (Loom), JavaScript avec Bun/Deno, Rust qui s'infiltre partout où la perf compte. Le dev 2026 est polyglotte, avec au moins un langage système (Rust ou Go) dans sa ceinture.

**Rupture 4 — L'edge, le serverless et le WebAssembly redistribuent l'architecture.** Le client n'est plus le browser, c'est un graphe de fonctions distribuées entre edge (Cloudflare Workers, Vercel Edge), backend classique et LLM hébergés. Les architectures monolithiques modulaires reprennent du terrain contre les microservices qui ont déçu.

Ce curriculum intègre ces quatre ruptures. Il est ordonné pour une progression linéaire, mais chaque section est indépendante si tu as déjà les prérequis.

---

## 2. La progression « bon ordre » en un coup d'œil

```
┌─────────────────────────────────────────────────────────────┐
│  TIER 0 — MÉTA-COMPÉTENCES (transverses, continu)           │
│  Git avancé • CLI/Shell • Debugging • Lecture de code       │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│  TIER 1 — FONDAMENTAUX CS (3–4 mois)                        │
│  Algo • Structures de données • OS • Networking • Concurrence│
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│  TIER 2 — INGÉNIERIE LOGICIELLE (3–4 mois)                  │
│  Clean Code • SOLID • Tests • Design patterns • Refactoring │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│  TIER 3 — UN LANGAGE MAÎTRISÉ EN PROFONDEUR (4–6 mois)      │
│  Python OU JS/TS OU Java au choix                           │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│  TIER 4 — ARCHITECTURE LOGICIELLE (3–4 mois)                │
│  DDD • Hexagonal • CQRS • Event-driven • Modular monolith   │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│  TIER 5 — AI APPLICATION ENGINEERING (4–6 mois) ★           │
│  Prompting • RAG • Agents • MCP • Orchestration • LLMOps    │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│  TIER 6 — DEVOPS, SRE, PLATFORM ENGINEERING (2–3 mois)      │
│  CI/CD • Observability • IaC • Kubernetes • Edge            │
└─────────────────────────────────────────────────────────────┘
                             ↓
┌─────────────────────────────────────────────────────────────┐
│  TIER 7 — SPÉCIALISATIONS (à la carte)                      │
│  2ème langage • AppSec • Data Eng • Perf Eng • Leadership   │
└─────────────────────────────────────────────────────────────┘
```

**Durée estimée** : 18–24 mois en intensif, 3–4 ans en parallèle d'études/alternance. Tu ne finiras jamais vraiment — le but n'est pas de tout compléter, c'est d'avoir un référentiel vivant qui grossit avec ton expérience.

**Choix critique à Tier 3** : en 2026, pour un dev orienté cybersec + alternance, l'ordre recommandé de langages est :

1. **Python** d'abord (AI, scripting, data, exploits, automation — ROI immédiat)
2. **TypeScript** ensuite (web, CLI, Node/Deno/Bun, interop IA universelle)
3. **Java** en troisième (systèmes d'entreprise — Spring domine encore les banques/assurances, énorme bassin d'emploi alternance)
4. **Rust** en spécialisation Tier 7 (cyber, perf, WebAssembly)

---

## 3. Cartographie complète des clusters (Domaine 2 étendu)

### Tier 0 — Méta-compétences transverses

| # | Cluster | Pages | Priorité | Notes 2026 |
|---|---|---|---|---|
| C2.0.1 | Git avancé (rebase, bisect, reflog, submodules, worktrees, hooks) | 50–80 | Pilier | Worktrees deviennent central pour les agents IA |
| C2.0.2 | Shell et CLI modernes (bash/zsh/fish, awk, jq, fzf, ripgrep, fd) | 50–80 | Pilier | Base incompressible |
| C2.0.3 | Terminaux 2026 (Warp, Ghostty, Wezterm, multiplexers tmux/zellij) | 30–50 | Standard | Warp intégration IA native |
| C2.0.4 | Debugging systématique (méthodes, gdb/lldb, browser devtools, tracing) | 60–100 | Pilier | Compétence signature du senior |
| C2.0.5 | Lecture de code et onboarding rapide sur codebase inconnue | 40–60 | Pilier | Catalyseur pour travailler avec IA |
| C2.0.6 | Collaboration IA-augmentée (Claude Code, Cursor, Aider, rules, MCP) | 80–120 | Pilier | Pratique centrale 2026 |
| C2.0.7 | Dotfiles, environnements reproductibles (Nix, chezmoi, devcontainers) | 40–60 | Standard | — |

**Total Tier 0 : ~350–550 pages.**

### Tier 1 — Fondamentaux Computer Science

| # | Cluster | Pages | Priorité | Notes |
|---|---|---|---|---|
| C2.1.1 | Algorithmique (tri, recherche, récursion, DP, backtracking, greedy) | 80–120 | Pilier | Base entretiens + certifs |
| C2.1.2 | Structures de données (arrays, listes, arbres, graphes, heaps, tries, bloom) | 80–120 | Pilier | — |
| C2.1.3 | Complexité et analyse (Big-O, amortized, space-time tradeoffs) | 40–60 | Pilier | — |
| C2.1.4 | Systèmes d'exploitation (processus, threads, scheduling, mémoire virtuelle, syscalls) | 80–120 | Pilier | Pont massif vers cybersec |
| C2.1.5 | Réseaux appliqués au dev (TCP/IP, HTTP/1.1/2/3, QUIC, TLS, WebSockets) | 60–100 | Pilier | Pont vers D5 Réseaux |
| C2.1.6 | Concurrence et parallélisme (threads, coroutines, actors, lock-free, memory models) | 60–100 | Pilier | Python free-threaded, Java Loom, Go goroutines |
| C2.1.7 | Bases de données — théorie (ACID, BASE, CAP, isolation levels, indexing, B-tree, LSM) | 60–100 | Pilier | — |
| C2.1.8 | Compilation et runtime (interpréteurs, JIT, AOT, GC, VM) | 40–60 | Standard | Utile pour optimiser Java/JS/Python |

**Total Tier 1 : ~500–780 pages.**

### Tier 2 — Ingénierie logicielle

| # | Cluster | Pages | Priorité | Notes |
|---|---|---|---|---|
| C2.2.1 | Clean code et idiomes (Martin, Hickey, Fowler) | 50–80 | Pilier | — |
| C2.2.2 | Principes SOLID, DRY, KISS, YAGNI, Law of Demeter | 40–60 | Pilier | Cluster court, dense |
| C2.2.3 | Design patterns GoF (création, structure, comportement) | 60–100 | Pilier | À relier au langage |
| C2.2.4 | Anti-patterns et code smells | 40–60 | Standard | — |
| C2.2.5 | Refactoring (catalogue Fowler, safe refactorings, tests first) | 50–80 | Pilier | — |
| C2.2.6 | Testing stratégique (pyramide, trophée, tests de propriété, mutation) | 60–100 | Pilier | Critère senior |
| C2.2.7 | TDD, BDD, contract testing | 40–60 | Standard | — |
| C2.2.8 | Code review efficace (pull requests, trunk-based, DORA metrics) | 40–60 | Pilier | — |
| C2.2.9 | Documentation technique (ADR, C4, README, docstrings, diataxis) | 40–60 | Pilier | ADR = référentiel obligatoire |
| C2.2.10 | Versioning sémantique et gestion de dépendances | 30–50 | Standard | — |
| C2.2.11 | Logging et traçabilité (structured logs, correlation IDs) | 30–50 | Standard | Pont vers observability |
| C2.2.12 | Gestion des erreurs (exceptions, Result/Either, fail fast, retries) | 40–60 | Pilier | — |

**Total Tier 2 : ~520–820 pages.**

### Tier 3A — Stack Python 2026 (deep dive)

| # | Cluster | Pages | Priorité | Notes 2026 |
|---|---|---|---|---|
| C2.3A.1 | Python core et idiomes (data model, protocols, iterators, generators, descriptors) | 60–100 | Pilier | — |
| C2.3A.2 | Python typing moderne (PEP 695 syntaxe, generics, Protocols, Pyright/Pylance) | 50–80 | Pilier | Typing devient quasi-obligatoire |
| C2.3A.3 | Async (asyncio, anyio, Trio, structured concurrency) | 50–80 | Pilier | — |
| C2.3A.4 | Python 3.13 free-threaded (sans GIL) — patterns et pièges | 40–60 | Standard | Actualité 2026 |
| C2.3A.5 | Packaging et tooling moderne (uv, ruff, poetry, pyproject.toml) | 40–60 | Pilier | uv remplace pip/pip-tools |
| C2.3A.6 | Tests Python (pytest, hypothesis, tox, nox, pytest-asyncio) | 40–60 | Pilier | — |
| C2.3A.7 | FastAPI + Pydantic v2 (validation, serialization, schema OpenAPI) | 60–100 | Pilier | Standard web Python 2026 |
| C2.3A.8 | Data stack Python 2026 (Polars, DuckDB, Arrow, NumPy 2.x) | 60–100 | Pilier | Polars > pandas pour perf |
| C2.3A.9 | ORM et DB (SQLAlchemy 2, SQLModel, Prisma Python, Psycopg 3) | 50–80 | Standard | — |
| C2.3A.10 | CLI Python (Typer, Click, Rich, Textual) | 30–50 | Standard | — |
| C2.3A.11 | Performance Python (profiling, Cython, PyO3/Maturin Rust, mypyc) | 40–60 | Deep-cut | — |
| C2.3A.12 | Python pour cybersec (Impacket, Scapy, pwntools, volatility) | 60–100 | Pilier | Pont massif vers D1 |

**Total Python : ~580–930 pages.**

### Tier 3B — Stack JavaScript/TypeScript 2026 (deep dive)

| # | Cluster | Pages | Priorité | Notes 2026 |
|---|---|---|---|---|
| C2.3B.1 | JavaScript moderne (ES2024/2025, closures, this, event loop, WeakRef) | 60–100 | Pilier | — |
| C2.3B.2 | TypeScript avancé (generics, conditional types, template literal types, branded types) | 60–100 | Pilier | Critère senior |
| C2.3B.3 | Runtimes Node / Deno / Bun — différences, choix, interop | 50–80 | Pilier | Bun ≥ Node en perf 2026 |
| C2.3B.4 | Tooling (Vite, Turbopack, Rspack, esbuild, tsup, Biome, oxlint) | 50–80 | Pilier | Biome consolide eslint+prettier |
| C2.3B.5 | React 19 (Server Components, Actions, `use`, Suspense avancé, concurrent) | 80–120 | Pilier | RSC = paradigme clé 2026 |
| C2.3B.6 | Frameworks fullstack (Next.js 15, React Router v7/Remix, TanStack Start) | 80–120 | Pilier | — |
| C2.3B.7 | Alternatives (Svelte 5 runes, SolidJS, Qwik, Astro) | 60–100 | Standard | — |
| C2.3B.8 | State management moderne (Zustand, Jotai, TanStack Query, Redux Toolkit) | 40–60 | Pilier | — |
| C2.3B.9 | CSS 2026 (Tailwind v4, CSS-in-JS déclin, container queries, cascade layers) | 50–80 | Standard | Tailwind v4 = CSS-first |
| C2.3B.10 | Tests JS/TS (Vitest, Playwright, Testing Library, MSW) | 40–60 | Pilier | Vitest remplace Jest |
| C2.3B.11 | Edge runtime et déploiement (Cloudflare Workers, Vercel Edge, Deno Deploy) | 40–60 | Standard | — |
| C2.3B.12 | Backend Node / API (Fastify, Hono, Elysia, tRPC, GraphQL Yoga) | 50–80 | Pilier | Hono/Elysia dominent edge |
| C2.3B.13 | ORM JS/TS (Drizzle, Prisma, Kysely) | 40–60 | Standard | Drizzle prend l'avantage |
| C2.3B.14 | Monorepo (pnpm workspaces, Turborepo, Nx, Moon) | 40–60 | Standard | — |

**Total JS/TS : ~740–1160 pages.**

### Tier 3C — Stack Java 2026 (deep dive)

| # | Cluster | Pages | Priorité | Notes 2026 |
|---|---|---|---|---|
| C2.3C.1 | Java moderne (Java 17, 21 LTS, 25 LTS — records, sealed, pattern matching, switch expressions) | 60–100 | Pilier | Java 21 = nouveau baseline |
| C2.3C.2 | Virtual Threads (Project Loom) et Structured Concurrency | 50–80 | Pilier | Révolution concurrence Java |
| C2.3C.3 | Java streams, functional interfaces, Optional | 40–60 | Pilier | — |
| C2.3C.4 | JVM interne (GC modernes ZGC/Shenandoah, JIT, class loading) | 50–80 | Standard | — |
| C2.3C.5 | Build tools (Maven, Gradle Kotlin DSL, JBang) | 40–60 | Pilier | — |
| C2.3C.6 | Tests Java (JUnit 5, Mockito, AssertJ, Testcontainers, ArchUnit) | 40–60 | Pilier | — |
| C2.3C.7 | Spring Boot 3.x (DI, MVC, WebFlux, Data, Security, Actuator) | 100–150 | Pilier | Toujours dominant 2026 |
| C2.3C.8 | Jakarta EE 10+ / MicroProfile | 40–60 | Standard | — |
| C2.3C.9 | Quarkus, Micronaut, Helidon (cloud-native natif GraalVM) | 50–80 | Standard | Quarkus monte en alternance banque |
| C2.3C.10 | GraalVM native image (AOT compilation, startup < 100ms) | 40–60 | Standard | — |
| C2.3C.11 | Persistence (JPA/Hibernate, Spring Data, jOOQ, MyBatis) | 50–80 | Pilier | — |
| C2.3C.12 | Messaging (Kafka, RabbitMQ, Spring Cloud Stream) | 50–80 | Standard | — |
| C2.3C.13 | Kotlin pour dev Java (interop, coroutines, DSL) | 40–60 | Standard | Kotlin = Java 2.0 dans certaines boîtes |

**Total Java : ~650–1000 pages.**

### Tier 4 — Architecture logicielle moderne

| # | Cluster | Pages | Priorité | Notes |
|---|---|---|---|---|
| C2.4.1 | Architectures classiques (layered, hexagonal/ports-adapters, clean, onion) | 60–100 | Pilier | Hexagonal = standard |
| C2.4.2 | Domain-Driven Design (bounded contexts, aggregates, domain events, ubiquitous language) | 80–120 | Pilier | — |
| C2.4.3 | CQRS et Event Sourcing (décision, tradeoffs, implémentations) | 50–80 | Standard | Éviter sauf justifié |
| C2.4.4 | Architecture événementielle (EDA, choreography vs orchestration, sagas) | 60–100 | Pilier | — |
| C2.4.5 | Microservices (patterns, anti-patterns, quand dire non, Conway's law) | 60–100 | Pilier | Prudence 2026, retour monolithe |
| C2.4.6 | Modular monolith (le grand retour) — techniques de modularisation | 40–60 | Pilier | Tendance 2026 chez DHH, Shopify |
| C2.4.7 | Serverless patterns (FaaS, event-driven, stateless, cold start) | 40–60 | Standard | — |
| C2.4.8 | Edge computing et distribution géographique | 30–50 | Standard | — |
| C2.4.9 | API design avancé (REST, GraphQL, gRPC, tRPC, OpenAPI, AsyncAPI) | 60–100 | Pilier | — |
| C2.4.10 | Idempotence, consistency, resilience (circuit breaker, bulkhead, retry) | 50–80 | Pilier | — |
| C2.4.11 | Caching strategies (L1/L2, invalidation, CDN, HTTP caching, Redis patterns) | 50–80 | Pilier | — |
| C2.4.12 | Scalabilité (vertical/horizontal, sharding, read replicas, caching) | 50–80 | Pilier | — |
| C2.4.13 | Data architecture (OLTP vs OLAP, data mesh, lakehouse, streaming) | 50–80 | Standard | — |
| C2.4.14 | Architecture Decision Records (ADR) — méthode et catalogue | 30–50 | Pilier | Document obligatoire en vault |
| C2.4.15 | Architecture d'applications IA (le nouveau) | 60–100 | Pilier | Voir Tier 5 |

**Total Tier 4 : ~790–1240 pages.**

### Tier 5 — AI Application Engineering ★ (le gros morceau 2026)

C'est **le** domaine qui différencie le dev 2026. Long, dense, à rafraîchir tous les 6 mois car le paysage bouge vite.

| # | Cluster | Pages | Priorité | Notes 2026 |
|---|---|---|---|---|
| C2.5.1 | Fondamentaux LLM côté dev (tokenisation, contexte, température, top-p, structured output) | 60–100 | Pilier | Pas de maths ML, focus API |
| C2.5.2 | Providers et API (Anthropic, OpenAI, Google, Mistral, local via Ollama/LM Studio) | 50–80 | Pilier | Comparaison pragmatique |
| C2.5.3 | Prompt engineering fondamental (few-shot, CoT, ToT, ReAct, self-consistency) | 80–120 | Pilier | Meta-compétence |
| C2.5.4 | Prompt engineering avancé (prompt chaining, decomposition, reflection, self-refine) | 60–100 | Pilier | — |
| C2.5.5 | Context engineering (memory, window management, summarization, retrieval-augmented context) | 60–100 | Pilier | Nouveau terme 2025-2026 |
| C2.5.6 | Structured output (JSON Schema, Pydantic, Zod, function calling, constrained decoding) | 50–80 | Pilier | — |
| C2.5.7 | RAG (vector stores, embeddings, chunking strategies, re-ranking, hybrid search) | 80–120 | Pilier | Toujours pertinent mais nuancé |
| C2.5.8 | Vector databases (pgvector, Qdrant, Weaviate, Chroma, LanceDB, Pinecone) | 50–80 | Pilier | pgvector = défaut raisonnable |
| C2.5.9 | Embeddings (modèles, dimensions, fine-tuning, matryoshka, multimodal) | 50–80 | Standard | — |
| C2.5.10 | MCP (Model Context Protocol) — serveurs, clients, resources, tools, prompts | 60–100 | Pilier | Standard Anthropic 2025 |
| C2.5.11 | Frameworks d'orchestration LLM (LangGraph, Pydantic AI, DSPy, Semantic Kernel) | 60–100 | Pilier | LangChain en déclin, LangGraph monte |
| C2.5.12 | Claude Agent SDK et Claude Code programmable | 40–60 | Pilier | Très rentable pour ton profil |
| C2.5.13 | Vercel AI SDK et AI SDK RSC (streaming UI, generative UI) | 40–60 | Standard | Pour stack JS/TS |
| C2.5.14 | Agent design patterns (ReAct, Plan-and-Execute, Reflexion, multi-agent) | 80–120 | Pilier | — |
| C2.5.15 | Tool use et function calling (design de tools, permissions, safety) | 50–80 | Pilier | — |
| C2.5.16 | Multi-agent systems (handoff, routing, supervisor, consensus) | 60–100 | Pilier | — |
| C2.5.17 | LLM evaluation (golden sets, LLM-as-judge, Braintrust, LangSmith, Langfuse) | 60–100 | Pilier | Critique pour production |
| C2.5.18 | LLMOps / AgentOps (observability LLM, tracing, cost tracking, prompt versioning) | 50–80 | Pilier | — |
| C2.5.19 | Guardrails et safety applicative (prompt injection defense, PII redaction, moderation) | 50–80 | Pilier | Pont fort vers D1 |
| C2.5.20 | Fine-tuning et alternatives (LoRA, PEFT, distillation, RAG vs FT tradeoff) | 50–80 | Standard | Souvent inutile vs bon prompt |
| C2.5.21 | Local LLMs et inference (Ollama, vLLM, llama.cpp, quantization, GGUF) | 50–80 | Standard | Souveraineté des données |
| C2.5.22 | Multimodalité (vision, audio, OCR, speech, génération image/vidéo intégrée) | 60–100 | Standard | — |
| C2.5.23 | IA dans le workflow dev (Copilot, Cursor, Aider, Claude Code, Zed AI, Windsurf) | 50–80 | Pilier | Meta-compétence |
| C2.5.24 | Coût, latence, streaming (batch APIs, prompt caching, budget management) | 40–60 | Pilier | Bouffe des €€€ vite |
| C2.5.25 | Architecture des applications IA (patterns : compound AI systems, CAIS, orchestration layers) | 60–100 | Pilier | Émergent, peu documenté, edge important |

**Total Tier 5 AI Engineering : ~1440–2260 pages.** C'est un vault à lui tout seul — à construire par vagues.

### Tier 6 — DevOps, SRE, Platform Engineering

| # | Cluster | Pages | Priorité | Notes |
|---|---|---|---|---|
| C2.6.1 | CI/CD (GitHub Actions, GitLab CI, Dagger, pipelines as code) | 60–100 | Pilier | — |
| C2.6.2 | Containers (Docker, OCI, BuildKit, distroless, multi-stage, rootless) | 50–80 | Pilier | — |
| C2.6.3 | Kubernetes dev-focus (Deployments, Services, Helm, Kustomize, ArgoCD) | 80–120 | Pilier | Pont avec C3.4 Cloud |
| C2.6.4 | Infrastructure as Code (Terraform, OpenTofu, Pulumi) | 60–100 | Pilier | OpenTofu = fork libre Terraform |
| C2.6.5 | Observability (logs, metrics, traces, OpenTelemetry, Grafana stack) | 60–100 | Pilier | Discipline clé |
| C2.6.6 | SRE (SLI/SLO/SLA, error budgets, incident response, postmortems) | 50–80 | Standard | — |
| C2.6.7 | Secrets management (Vault, SOPS, age, sealed-secrets, 1Password ops) | 40–60 | Pilier | — |
| C2.6.8 | Deployment strategies (blue-green, canary, feature flags, trunk-based) | 40–60 | Standard | — |
| C2.6.9 | Platform engineering et developer experience (Backstage, internal platforms) | 40–60 | Deep-cut | — |

**Total Tier 6 : ~480–760 pages.**

### Tier 7 — Spécialisations (à la carte, selon trajectoire)

| # | Cluster | Pages | Priorité | Pour qui |
|---|---|---|---|---|
| C2.7.1 | Rust pour devs (ownership, borrow, async, WASM, interop Python/JS) | 80–120 | Spé | Systèmes, cyber, perf |
| C2.7.2 | Go pour devs (goroutines, channels, context, interfaces, CLI tools) | 60–100 | Spé | DevOps, infra, cloud-native |
| C2.7.3 | WebAssembly côté serveur (WASI, component model, Wasmtime) | 40–60 | Spé | Edge, plugins, sandboxing |
| C2.7.4 | AppSec pour devs (threat modeling, SAST/DAST/SCA, SSDLC) | 80–120 | Pilier | Pont fort D1 |
| C2.7.5 | Secure coding par langage (Python/JS/Java — top vulns et mitigations) | 60–100 | Pilier | — |
| C2.7.6 | Supply chain security (SBOM, sigstore, SLSA, dependency confusion) | 40–60 | Standard | — |
| C2.7.7 | Data engineering (ETL/ELT, dbt, Airflow/Dagster/Prefect, streaming Kafka/Flink) | 80–120 | Spé | Pont C4 |
| C2.7.8 | Performance engineering (profiling, perf tuning, memory, flame graphs) | 60–100 | Spé | — |
| C2.7.9 | Distributed systems theory (consensus Raft/Paxos, CRDTs, eventual consistency) | 60–100 | Spé | Pour archi senior |
| C2.7.10 | Game dev / graphics / XR (si passion) | 50–80 | Spé | Hors scope prioritaire |
| C2.7.11 | Mobile natif ou cross (Kotlin+Swift, React Native, Flutter, Expo, Capacitor) | 60–100 | Spé | Selon besoin |
| C2.7.12 | Leadership technique (tech lead, mentoring, code stewardship, staff engineering) | 40–60 | Pilier long terme | — |
| C2.7.13 | Carrière dev (niveaux, interviews, négociation, open source, personal branding) | 40–60 | Pilier | — |
| C2.7.14 | Veille dev (sources, rythme, filtrage, capture) | 30–50 | Pilier | — |

**Total Tier 7 : ~780–1240 pages selon les spés retenues.**

---

## 4. Stack outillée 2026 par domaine (Edu → OSS → Commercial)

### Éditeurs et IDE avec IA intégrée

| Outil | Type | Fiabilité | Note |
|---|---|---|---|
| **VS Code** + extensions | Commercial gratuit | ★★★★★ | Baseline incontournable |
| **JetBrains (IntelliJ, PyCharm, WebStorm)** | **Plan étudiant gratuit** avec adresse étudiante | ★★★★★ | All Products Pack gratuit si tu es éligible |
| **Zed** | Open Source (partial) | ★★★★ | Perfs exceptionnelles, IA native |
| **Neovim** + LazyVim/AstroNvim | Open Source | ★★★★★ | Pour les power users |
| **Cursor** | Commercial | ★★★★ | IDE IA-first, fork VS Code |
| **Windsurf** (Codeium) | Commercial, plan gratuit | ★★★★ | Alternative Cursor |

### Agents de codage

| Outil | Type | Fiabilité | Note |
|---|---|---|---|
| **Claude Code** | Commercial (abonnement Max) | ★★★★★ | Le plus puissant en 2026, MCP natif |
| **Aider** | Open Source | ★★★★★ | CLI agent OSS, multi-provider |
| **OpenCode** | Open Source | ★★★★ | Alternative OSS émergente |
| **Cursor Agent / Windsurf Cascade** | Commercial | ★★★★ | — |
| GitHub Copilot + Copilot Workspace | Commercial, **gratuit via GitHub Student Pack** | ★★★★ | Gratuit étudiant |

### Gestionnaires de paquets modernes par langage

| Langage | Outil 2026 | Remplace | Pourquoi |
|---|---|---|---|
| Python | **uv** (Astral) | pip, pip-tools, poetry, virtualenv | 10–100× plus rapide, écrit en Rust |
| Python | **ruff** (Astral) | flake8, black, isort, pylint | Linter+formatter tout-en-un |
| Python | **Pyright** / Pylance | mypy | Plus rapide, meilleur inference |
| JS/TS | **pnpm** | npm, yarn | Disk-efficient, strict |
| JS/TS | **Biome** | ESLint + Prettier | All-in-one, Rust |
| JS/TS | **Bun** | Node | Runtime + toolkit complet |
| Java | **Gradle Kotlin DSL** | Maven | Selon projet |
| Java | **JBang** | — | Scripts Java sans build |

### Bases de données recommandées 2026

| Besoin | Outil | Type | Note |
|---|---|---|---|
| SQL général | **PostgreSQL 17+** | OSS | Défaut 2026, même pour vectoriel (pgvector) |
| SQL embedded/analytique | **DuckDB** | OSS | Révolutionnaire pour data locale |
| SQLite moderne | **Turso/libSQL** | Commercial OSS | SQLite distribué edge |
| Cache | **Redis** / **DragonflyDB** | OSS | Dragonfly = drop-in plus rapide |
| Queue | **PostgreSQL + pg_cron/river** ou **Redis** | OSS | Souvent suffisant avant Kafka |
| Vector | **pgvector** ou **Qdrant** | OSS | — |

### Observability stack

| Besoin | OSS recommandé | Commercial |
|---|---|---|
| Logs | Loki, Vector | Datadog, New Relic |
| Métriques | Prometheus, Mimir | — |
| Traces | Tempo, Jaeger | — |
| Instrumentation | **OpenTelemetry** | — |
| Stack complète | **SigNoz**, **Uptrace** (OSS), Grafana LGTM | — |
| LLM spécifique | **Langfuse** (OSS), **Helicone** | LangSmith, Braintrust |

### CI/CD

| Outil | Type | Note |
|---|---|---|
| **GitHub Actions** | Commercial, **gratuit étendu via Student Pack** | Défaut en 2026 |
| **GitLab CI** | OSS self-host | Si vault Git sur GitLab |
| **Dagger** | OSS | Pipelines as code en Go/Python/TS, portables |
| **Woodpecker CI** | OSS | Fork Drone, minimaliste |

---

## 5. Ressources d'apprentissage de référence (ordonnées par Tier)

### Tier 0–1 (fondamentaux)

- *Designing Data-Intensive Applications* — Martin Kleppmann (Tier 1 avancé, référence absolue)
- *Operating Systems: Three Easy Pieces* — OSTEP (gratuit, OSS) ★
- *Computer Networks: A Systems Approach* — Peterson & Davie (gratuit, OSS) ★
- **Harvard CS50** — gratuit, excellent pour démarrer
- **MIT 6.006 et 6.824** — YouTube gratuit, algo et systèmes distribués

### Tier 2 (ingénierie)

- *Clean Code* — Robert Martin (attention dogmatique, prendre avec nuance)
- *The Pragmatic Programmer* — Hunt & Thomas
- *A Philosophy of Software Design* — John Ousterhout (court, dense, excellent)
- *Refactoring* — Martin Fowler (2nd ed, JS)
- *Working Effectively with Legacy Code* — Michael Feathers

### Tier 3 (langages)

**Python** : *Fluent Python* (Ramalho, 2nd ed 2022) • *Robust Python* (Viafore) • docs officielles Python 3.13

**JS/TS** : *You Don't Know JS Yet* (Simpson, gratuit GitHub) • *Effective TypeScript* (Vanderkam) • docs MDN

**Java** : *Effective Java* (Bloch, 3rd) • *Java Concurrency in Practice* (Goetz) • *Modern Java in Action*

### Tier 4 (architecture)

- *Domain-Driven Design* — Eric Evans (le « Blue Book »)
- *Implementing Domain-Driven Design* — Vaughn Vernon
- *Building Microservices* — Sam Newman (2nd ed)
- *Fundamentals of Software Architecture* — Richards & Ford
- *Software Architecture: The Hard Parts* — Richards & Ford

### Tier 5 (AI engineering) — le domaine où les ressources vieillissent vite

- *AI Engineering* — Chip Huyen (2025, référence)
- *Designing Machine Learning Systems* — Chip Huyen (2022, fondamentaux MLOps toujours valides)
- *Hands-On Large Language Models* — Alammar & Grootendorst (2024)
- **Docs Anthropic** (docs.claude.com) — référence MCP, prompt caching, tool use
- **Anthropic cookbook** (GitHub) — exemples appliqués
- **DeepLearning.AI short courses** (Ng) — gratuits, très bon ratio temps/densité
- **Pydantic AI docs**, **LangGraph docs**, **DSPy docs**

### Tier 6 (DevOps/SRE)

- *Site Reliability Engineering* — Google (gratuit en ligne) ★
- *The SRE Workbook* — Google (gratuit)
- *Kubernetes: Up and Running* — Hightower et al.
- *Learning Kubernetes* + CNCF Landscape

### Chaînes YouTube / newsletters à suivre

- **ThePrimeagen**, **Fireship**, **TechWorld with Nana** — bases
- **ArjanCodes** — Python architecture
- **Theo (t3.gg)** — écosystème JS/TS
- **Matt Pocock** — TypeScript avancé
- **LangChain**, **Anthropic**, **OpenAI DevDay** — officiels IA

Newsletters : *Bytes* (JS), *Python Weekly*, *Pragmatic Engineer* (Orosz), *Platform Weekly*, *Latent Space* (AI eng).

---

## 6. Phasing d'apprentissage concret pour Anthony

Compte tenu de ton profil (Bac+3 cyber, alternance, déjà une expérience de dev, priorité ROI carrière) :

### 6 prochains mois (Phase A — pendant alternance)

1. **C2.0.6 Collaboration IA-augmentée** — pilote immédiat, amortit tous les autres runs
2. **C2.5.3 + C2.5.4 Prompting** — maîtrise du meta-outil
3. **C2.3A.1 + C2.3A.7 Python core + FastAPI** — stack alternance + IA
4. **C2.2.1 + C2.2.2 Clean code + SOLID** — hygiène senior
5. **C2.2.6 Testing stratégique** — critère recrutement
6. **C2.4.1 + C2.4.2 Hexagonal + DDD** — archi alternance

Budget estimé : ~400 € tokens. Livrable : ~1500 pages de vault dev de qualité.

### Mois 7–12 (Phase B — AI deep dive)

1. Tout le Tier 5 par vagues — priorité C2.5.7 RAG, C2.5.10 MCP, C2.5.14 Agents, C2.5.17 Evaluation
2. C2.3B TypeScript/React 19 en parallèle (si tu touches du front en alternance)
3. C2.2.9 Documentation ADR (tu commences à écrire les tiennes)

### Mois 13–24 (Phase C — élargissement)

- Java Spring Boot si trajectoire banque/assurance
- Rust Tier 7.1 si pivot cyber fort (exploits, tooling)
- Architecture avancée (C2.4.3 à C2.4.15)
- Tier 6 DevOps complet

---

## 7. Recommandations tactiques spécifiques IA

Trois règles qui t'éviteront les pièges 2026 :

**Règle 1 — Le prompt coûte moins que la formation.** Avant d'apprendre une librairie LLM, teste si un bon prompt direct à l'API Anthropic suffit. La plupart du temps, oui. LangChain, LlamaIndex et consorts sont utiles à une échelle où tu n'es probablement pas encore.

**Règle 2 — Écris tes propres evals avant toute optimisation.** Un ensemble de 50 cas de test vaut dix tutoriels LangSmith. Langfuse (OSS) suffit pour démarrer.

**Règle 3 — MCP est le nouveau standard.** Apprendre à écrire un serveur MCP aujourd'hui, c'est comme apprendre REST en 2010. Tu en construiras des dizaines dans ta carrière.

---

## 8. Intégration dans le vault maître

Dans ton vault, ce track se matérialise sous `/20-Développement/` avec la structure :

```
20-Développement/
├── _MOC-Développement.md                  # index navigable
├── _Learning-Path-2026.md                 # ce document référencé
├── C2.0-Meta-Competences/
├── C2.1-Fondamentaux-CS/
├── C2.2-Ingenierie-Logicielle/
├── C2.3A-Python-2026/
├── C2.3B-JavaScript-TypeScript-2026/
├── C2.3C-Java-2026/
├── C2.4-Architecture/
├── C2.5-AI-Engineering/                   # le gros volume
│   ├── C2.5.1-Fondamentaux-LLM/
│   ├── C2.5.3-Prompt-Engineering/
│   ├── C2.5.10-MCP/
│   ├── C2.5.14-Agent-Patterns/
│   └── ...
├── C2.6-DevOps-SRE/
└── C2.7-Specialisations/
```

Wikilinks transverses prévus depuis ce domaine :

- C2.5.19 Guardrails ↔ D1 Cybersécurité (injection, PII)
- C2.7.4 AppSec ↔ C1.6 Offensive Web
- C2.3A.12 Python cybersec ↔ C1.15 Tooling offensif
- C2.4.14 ADR ↔ C7.1 PKM (discipline doc)
- C2.5.23 IA workflow dev ↔ C7.6 Automatisation perso

---

## 9. Prochaine action recommandée

Je te suggère de démarrer par un **pilote sur C2.0.6 « Collaboration IA-augmentée »** (40 pages).

Raisons :

1. Couvre Claude Code, Cursor, Aider, MCP, rules, workflows — tu l'utilises déjà, tu jugeras bien la qualité.
2. Les pages pilote serviront de playbook pour tous les autres runs (méta-ROI maximal).
3. Cluster cadré, faible controverse, peu de fact-check lourd — conditions idéales pour calibrer la méthode.

Dis-moi si tu valides ce choix, et je te prépare le `PROMPT-PILOT.md` pré-rempli avec `DESCRIPTION_CLUSTER` calibrée pour ce cluster précis.
