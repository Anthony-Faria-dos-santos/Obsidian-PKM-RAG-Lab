# STATUS, tableau de bord pilot-generator

Derniere mise a jour : 2026-04-22

Ce fichier est la source de verite unique pour l'etat d'avancement. Les slash commands `/etat`, `/next`, `/liste-restants` le consomment. Les slash commands `/nouveau-pilote` et `/qc` l'ecrivent.

## Legende des statuts

- `todo` : cluster catalogue, pas encore de prompt pilote
- `wip` : prompt pilote en cours de generation (lock temporaire)
- `generated` : prompt pilote ecrit dans `generated/`, en attente de QC
- `qc-ok` : QC passe, pret a etre execute dans le vault
- `qc-fail` : QC echoue, a corriger (revient a `todo` apres fix)
- `deployed` : execute dans le vault, pages produites

## Synthese

- Total clusters catalogues : **179**
- Statut `todo` : 177
- Statut `generated` : 1
- Statut `qc-ok` : 1

## D1 Cybersecurite (10-Cybersecurite) (17 clusters)

| ID | Titre | Importance | Statut | Date | Note |
|---|---|---|---|---|---|
| C1.1 | Fondamentaux cybersec (CIA, AAA, threat modeling, surface d'attaque... | pilier | qc-ok | 2026-04-22 | QC 27/27 OK, 1er pilote D1 |
| C1.2 | Cryptographie théorique et appliquée | pilier | todo |  |  |
| C1.3 | Réseaux et sécurité réseau (pare-feu, IDS/IPS, VPN, NAC, Zero Trust) | pilier | todo |  |  |
| C1.4 | MITRE ATT&CK — tactiques et techniques (framework complet) | pilier | todo |  |  |
| C1.5 | Active Directory offensif (Kerberos, NTLM, ACL abuse, trusts, ADCS ... | pilier | todo |  |  |
| C1.7 | Exploitation et dev d'exploits (buffer overflow, ROP, heap, kernel ... | pilier | todo |  |  |
| C1.8 | Reverse engineering et malware analysis | standard | todo |  |  |
| C1.9 | Blue Team opérations (SOC, SIEM, SOAR, detection engineering, Sigma) | pilier | todo |  |  |
| C1.10 | Digital Forensics et Incident Response (DFIR) | pilier | todo |  |  |
| C1.11 | Threat Intelligence et OSINT | standard | todo |  |  |
| C1.12 | Cloud Security (AWS/Azure/GCP, CSPM, CNAPP, IAM, Kubernetes sec) | pilier | todo |  |  |
| C1.13 | Hardening et conformité (CIS, ANSSI, NIST 800, ISO 27001/27002, NIS... | pilier | todo |  |  |
| C1.14 | Social engineering et sécurité humaine | standard | todo |  |  |
| C1.16 | Tooling défensif (Splunk, Elastic, Wazuh, YARA, Velociraptor, Zeek) | pilier | todo |  |  |
| C1.17 | Ransomware, APT et threat actors (profils, TTP, campagnes historiques) | standard | todo |  |  |
| C1.18 | Physical security, IoT/OT, ICS/SCADA, radio, RFID | deep-cut | todo |  |  |
| C1.19 | Roadmap certifications cyber (document vivant — ta propre planifica... | pilier | todo |  |  |

## D2 Developpement (20-Developpement) (129 clusters)

| ID | Titre | Importance | Statut | Date | Note |
|---|---|---|---|---|---|
| C2.0.1 | Git avancé (rebase, bisect, reflog, submodules, worktrees, hooks) | pilier | todo |  |  |
| C2.0.2 | Shell et CLI modernes (bash/zsh/fish, awk, jq, fzf, ripgrep, fd) | pilier | todo |  |  |
| C2.0.3 | Terminaux 2026 (Warp, Ghostty, Wezterm, multiplexers tmux/zellij) | standard | todo |  |  |
| C2.0.4 | Debugging systématique (méthodes, gdb/lldb, browser devtools, tracing) | pilier | todo |  |  |
| C2.0.5 | Lecture de code et onboarding rapide sur codebase inconnue | pilier | todo |  |  |
| C2.0.6 | Collaboration IA-augmentée (Claude Code, Cursor, Aider, rules, MCP) | pilier | generated | 2026-04-22 | pilote de reference |
| C2.0.7 | Dotfiles, environnements reproductibles (Nix, chezmoi, devcontainers) | standard | todo |  |  |
| C2.1.1 | Algorithmique (tri, recherche, récursion, DP, backtracking, greedy) | pilier | todo |  |  |
| C2.1.2 | Structures de données (arrays, listes, arbres, graphes, heaps, trie... | pilier | todo |  |  |
| C2.1.3 | Complexité et analyse (Big-O, amortized, space-time tradeoffs) | pilier | todo |  |  |
| C2.1.4 | Systèmes d'exploitation (processus, threads, scheduling, mémoire vi... | pilier | todo |  |  |
| C2.1.5 | Réseaux appliqués au dev (TCP/IP, HTTP/1.1/2/3, QUIC, TLS, WebSockets) | pilier | todo |  |  |
| C2.1.6 | Concurrence et parallélisme (threads, coroutines, actors, lock-free... | pilier | todo |  |  |
| C2.1.7 | Bases de données — théorie (ACID, BASE, CAP, isolation levels, inde... | pilier | todo |  |  |
| C2.1.8 | Compilation et runtime (interpréteurs, JIT, AOT, GC, VM) | standard | todo |  |  |
| C2.2.1 | Clean code et idiomes (Martin, Hickey, Fowler) | pilier | todo |  |  |
| C2.2.2 | Principes SOLID, DRY, KISS, YAGNI, Law of Demeter | pilier | todo |  |  |
| C2.2.3 | Design patterns GoF (création, structure, comportement) | pilier | todo |  |  |
| C2.2.4 | Anti-patterns et code smells | standard | todo |  |  |
| C2.2.5 | Refactoring (catalogue Fowler, safe refactorings, tests first) | pilier | todo |  |  |
| C2.2.6 | Testing stratégique (pyramide, trophée, tests de propriété, mutation) | pilier | todo |  |  |
| C2.2.7 | TDD, BDD, contract testing | standard | todo |  |  |
| C2.2.8 | Code review efficace (pull requests, trunk-based, DORA metrics) | pilier | todo |  |  |
| C2.2.9 | Documentation technique (ADR, C4, README, docstrings, diataxis) | pilier | todo |  |  |
| C2.2.10 | Versioning sémantique et gestion de dépendances | standard | todo |  |  |
| C2.2.11 | Logging et traçabilité (structured logs, correlation IDs) | standard | todo |  |  |
| C2.2.12 | Gestion des erreurs (exceptions, Result/Either, fail fast, retries) | pilier | todo |  |  |
| C2.3A.1 | Python core et idiomes (data model, protocols, iterators, generator... | pilier | todo |  |  |
| C2.3A.2 | Python typing moderne (PEP 695 syntaxe, generics, Protocols, Pyrigh... | pilier | todo |  |  |
| C2.3A.3 | Async (asyncio, anyio, Trio, structured concurrency) | pilier | todo |  |  |
| C2.3A.4 | Python 3.13 free-threaded (sans GIL) — patterns et pièges | standard | todo |  |  |
| C2.3A.5 | Packaging et tooling moderne (uv, ruff, poetry, pyproject.toml) | pilier | todo |  |  |
| C2.3A.6 | Tests Python (pytest, hypothesis, tox, nox, pytest-asyncio) | pilier | todo |  |  |
| C2.3A.7 | FastAPI + Pydantic v2 (validation, serialization, schema OpenAPI) | pilier | todo |  |  |
| C2.3A.8 | Data stack Python 2026 (Polars, DuckDB, Arrow, NumPy 2.x) | pilier | todo |  |  |
| C2.3A.9 | ORM et DB (SQLAlchemy 2, SQLModel, Prisma Python, Psycopg 3) | standard | todo |  |  |
| C2.3A.10 | CLI Python (Typer, Click, Rich, Textual) | standard | todo |  |  |
| C2.3A.11 | Performance Python (profiling, Cython, PyO3/Maturin Rust, mypyc) | deep-cut | todo |  |  |
| C2.3A.12 | Python pour cybersec (Impacket, Scapy, pwntools, volatility) | pilier | todo |  |  |
| C2.3B.1 | JavaScript moderne (ES2024/2025, closures, this, event loop, WeakRef) | pilier | todo |  |  |
| C2.3B.2 | TypeScript avancé (generics, conditional types, template literal ty... | pilier | todo |  |  |
| C2.3B.3 | Runtimes Node / Deno / Bun — différences, choix, interop | pilier | todo |  |  |
| C2.3B.4 | Tooling (Vite, Turbopack, Rspack, esbuild, tsup, Biome, oxlint) | pilier | todo |  |  |
| C2.3B.5 | React 19 (Server Components, Actions, `use`, Suspense avancé, concu... | pilier | todo |  |  |
| C2.3B.6 | Frameworks fullstack (Next.js 15, React Router v7/Remix, TanStack S... | pilier | todo |  |  |
| C2.3B.7 | Alternatives (Svelte 5 runes, SolidJS, Qwik, Astro) | standard | todo |  |  |
| C2.3B.8 | State management moderne (Zustand, Jotai, TanStack Query, Redux Too... | pilier | todo |  |  |
| C2.3B.9 | CSS 2026 (Tailwind v4, CSS-in-JS déclin, container queries, cascade... | standard | todo |  |  |
| C2.3B.10 | Tests JS/TS (Vitest, Playwright, Testing Library, MSW) | pilier | todo |  |  |
| C2.3B.11 | Edge runtime et déploiement (Cloudflare Workers, Vercel Edge, Deno ... | standard | todo |  |  |
| C2.3B.12 | Backend Node / API (Fastify, Hono, Elysia, tRPC, GraphQL Yoga) | pilier | todo |  |  |
| C2.3B.13 | ORM JS/TS (Drizzle, Prisma, Kysely) | standard | todo |  |  |
| C2.3B.14 | Monorepo (pnpm workspaces, Turborepo, Nx, Moon) | standard | todo |  |  |
| C2.3C.1 | Java moderne (Java 17, 21 LTS, 25 LTS — records, sealed, pattern ma... | pilier | todo |  |  |
| C2.3C.2 | Virtual Threads (Project Loom) et Structured Concurrency | pilier | todo |  |  |
| C2.3C.3 | Java streams, functional interfaces, Optional | pilier | todo |  |  |
| C2.3C.4 | JVM interne (GC modernes ZGC/Shenandoah, JIT, class loading) | standard | todo |  |  |
| C2.3C.5 | Build tools (Maven, Gradle Kotlin DSL, JBang) | pilier | todo |  |  |
| C2.3C.6 | Tests Java (JUnit 5, Mockito, AssertJ, Testcontainers, ArchUnit) | pilier | todo |  |  |
| C2.3C.7 | Spring Boot 3.x (DI, MVC, WebFlux, Data, Security, Actuator) | pilier | todo |  |  |
| C2.3C.8 | Jakarta EE 10+ / MicroProfile | standard | todo |  |  |
| C2.3C.9 | Quarkus, Micronaut, Helidon (cloud-native natif GraalVM) | standard | todo |  |  |
| C2.3C.10 | GraalVM native image (AOT compilation, startup < 100ms) | standard | todo |  |  |
| C2.3C.11 | Persistence (JPA/Hibernate, Spring Data, jOOQ, MyBatis) | pilier | todo |  |  |
| C2.3C.12 | Messaging (Kafka, RabbitMQ, Spring Cloud Stream) | standard | todo |  |  |
| C2.3C.13 | Kotlin pour dev Java (interop, coroutines, DSL) | standard | todo |  |  |
| C2.4.1 | Architectures classiques (layered, hexagonal/ports-adapters, clean,... | pilier | todo |  |  |
| C2.4.2 | Domain-Driven Design (bounded contexts, aggregates, domain events, ... | pilier | todo |  |  |
| C2.4.3 | CQRS et Event Sourcing (décision, tradeoffs, implémentations) | standard | todo |  |  |
| C2.4.4 | Architecture événementielle (EDA, choreography vs orchestration, sa... | pilier | todo |  |  |
| C2.4.5 | Microservices (patterns, anti-patterns, quand dire non, Conway's law) | pilier | todo |  |  |
| C2.4.6 | Modular monolith (le grand retour) — techniques de modularisation | pilier | todo |  |  |
| C2.4.7 | Serverless patterns (FaaS, event-driven, stateless, cold start) | standard | todo |  |  |
| C2.4.8 | Edge computing et distribution géographique | standard | todo |  |  |
| C2.4.9 | API design avancé (REST, GraphQL, gRPC, tRPC, OpenAPI, AsyncAPI) | pilier | todo |  |  |
| C2.4.10 | Idempotence, consistency, resilience (circuit breaker, bulkhead, re... | pilier | todo |  |  |
| C2.4.11 | Caching strategies (L1/L2, invalidation, CDN, HTTP caching, Redis p... | pilier | todo |  |  |
| C2.4.12 | Scalabilité (vertical/horizontal, sharding, read replicas, caching) | pilier | todo |  |  |
| C2.4.13 | Data architecture (OLTP vs OLAP, data mesh, lakehouse, streaming) | standard | todo |  |  |
| C2.4.14 | Architecture Decision Records (ADR) — méthode et catalogue | pilier | todo |  |  |
| C2.4.15 | Architecture d'applications IA (le nouveau) | pilier | todo |  |  |
| C2.5.1 | Fondamentaux LLM côté dev (tokenisation, contexte, température, top... | pilier | todo |  |  |
| C2.5.2 | Providers et API (Anthropic, OpenAI, Google, Mistral, local via Oll... | pilier | todo |  |  |
| C2.5.3 | Prompt engineering fondamental (few-shot, CoT, ToT, ReAct, self-con... | pilier | todo |  |  |
| C2.5.4 | Prompt engineering avancé (prompt chaining, decomposition, reflecti... | pilier | todo |  |  |
| C2.5.5 | Context engineering (memory, window management, summarization, retr... | pilier | todo |  |  |
| C2.5.6 | Structured output (JSON Schema, Pydantic, Zod, function calling, co... | pilier | todo |  |  |
| C2.5.7 | RAG (vector stores, embeddings, chunking strategies, re-ranking, hy... | pilier | todo |  |  |
| C2.5.8 | Vector databases (pgvector, Qdrant, Weaviate, Chroma, LanceDB, Pine... | pilier | todo |  |  |
| C2.5.9 | Embeddings (modèles, dimensions, fine-tuning, matryoshka, multimodal) | standard | todo |  |  |
| C2.5.10 | MCP (Model Context Protocol) — serveurs, clients, resources, tools,... | pilier | todo |  |  |
| C2.5.11 | Frameworks d'orchestration LLM (LangGraph, Pydantic AI, DSPy, Seman... | pilier | todo |  |  |
| C2.5.12 | Claude Agent SDK et Claude Code programmable | pilier | todo |  |  |
| C2.5.13 | Vercel AI SDK et AI SDK RSC (streaming UI, generative UI) | standard | todo |  |  |
| C2.5.14 | Agent design patterns (ReAct, Plan-and-Execute, Reflexion, multi-ag... | pilier | todo |  |  |
| C2.5.15 | Tool use et function calling (design de tools, permissions, safety) | pilier | todo |  |  |
| C2.5.16 | Multi-agent systems (handoff, routing, supervisor, consensus) | pilier | todo |  |  |
| C2.5.17 | LLM evaluation (golden sets, LLM-as-judge, Braintrust, LangSmith, L... | pilier | todo |  |  |
| C2.5.18 | LLMOps / AgentOps (observability LLM, tracing, cost tracking, promp... | pilier | todo |  |  |
| C2.5.19 | Guardrails et safety applicative (prompt injection defense, PII red... | pilier | todo |  |  |
| C2.5.20 | Fine-tuning et alternatives (LoRA, PEFT, distillation, RAG vs FT tr... | standard | todo |  |  |
| C2.5.21 | Local LLMs et inference (Ollama, vLLM, llama.cpp, quantization, GGUF) | standard | todo |  |  |
| C2.5.22 | Multimodalité (vision, audio, OCR, speech, génération image/vidéo i... | standard | todo |  |  |
| C2.5.23 | IA dans le workflow dev (Copilot, Cursor, Aider, Claude Code, Zed A... | pilier | todo |  |  |
| C2.5.24 | Coût, latence, streaming (batch APIs, prompt caching, budget manage... | pilier | todo |  |  |
| C2.5.25 | Architecture des applications IA (patterns : compound AI systems, C... | pilier | todo |  |  |
| C2.6.1 | CI/CD (GitHub Actions, GitLab CI, Dagger, pipelines as code) | pilier | todo |  |  |
| C2.6.2 | Containers (Docker, OCI, BuildKit, distroless, multi-stage, rootless) | pilier | todo |  |  |
| C2.6.3 | Kubernetes dev-focus (Deployments, Services, Helm, Kustomize, ArgoCD) | pilier | todo |  |  |
| C2.6.4 | Infrastructure as Code (Terraform, OpenTofu, Pulumi) | pilier | todo |  |  |
| C2.6.5 | Observability (logs, metrics, traces, OpenTelemetry, Grafana stack) | pilier | todo |  |  |
| C2.6.6 | SRE (SLI/SLO/SLA, error budgets, incident response, postmortems) | standard | todo |  |  |
| C2.6.7 | Secrets management (Vault, SOPS, age, sealed-secrets, 1Password ops) | pilier | todo |  |  |
| C2.6.8 | Deployment strategies (blue-green, canary, feature flags, trunk-based) | standard | todo |  |  |
| C2.6.9 | Platform engineering et developer experience (Backstage, internal p... | deep-cut | todo |  |  |
| C2.7.1 | Rust pour devs (ownership, borrow, async, WASM, interop Python/JS) | standard | todo |  |  |
| C2.7.2 | Go pour devs (goroutines, channels, context, interfaces, CLI tools) | standard | todo |  |  |
| C2.7.3 | WebAssembly côté serveur (WASI, component model, Wasmtime) | standard | todo |  |  |
| C2.7.4 | AppSec pour devs (threat modeling, SAST/DAST/SCA, SSDLC) | pilier | todo |  |  |
| C2.7.5 | Secure coding par langage (Python/JS/Java — top vulns et mitigations) | pilier | todo |  |  |
| C2.7.6 | Supply chain security (SBOM, sigstore, SLSA, dependency confusion) | standard | todo |  |  |
| C2.7.7 | Data engineering (ETL/ELT, dbt, Airflow/Dagster/Prefect, streaming ... | standard | todo |  |  |
| C2.7.8 | Performance engineering (profiling, perf tuning, memory, flame graphs) | standard | todo |  |  |
| C2.7.9 | Distributed systems theory (consensus Raft/Paxos, CRDTs, eventual c... | standard | todo |  |  |
| C2.7.10 | Game dev / graphics / XR (si passion) | standard | todo |  |  |
| C2.7.11 | Mobile natif ou cross (Kotlin+Swift, React Native, Flutter, Expo, C... | standard | todo |  |  |
| C2.7.12 | Leadership technique (tech lead, mentoring, code stewardship, staff... | pilier | todo |  |  |
| C2.7.13 | Carrière dev (niveaux, interviews, négociation, open source, person... | pilier | todo |  |  |
| C2.7.14 | Veille dev (sources, rythme, filtrage, capture) | pilier | todo |  |  |

## D3 Cloud (30-Cloud) (13 clusters)

| ID | Titre | Importance | Statut | Date | Note |
|---|---|---|---|---|---|
| C3.1 | Cloud concepts généraux et souveraineté | standard | todo |  |  |
| C3.2 | Azure fundamentals et écosystème Microsoft | standard | todo |  |  |
| C3.3 | AWS fundamentals | standard | todo |  |  |
| C3.4 | IAM cloud avancé et identité fédérée | standard | todo |  |  |
| C3.5 | Réseau cloud | standard | todo |  |  |
| C3.6 | Stockage et bases managées | standard | todo |  |  |
| C3.7 | Conteneurs, Docker et OCI | standard | todo |  |  |
| C3.8 | Kubernetes | standard | todo |  |  |
| C3.9 | IaC avec Terraform, OpenTofu, Pulumi, Bicep, Crossplane | standard | todo |  |  |
| C3.10 | CI/CD et GitOps | standard | todo |  |  |
| C3.11 | Observabilité | standard | todo |  |  |
| C3.12 | Sécurité cloud (CSPM / CNAPP / CWPP / DSPM) | standard | todo |  |  |
| C3.13 | FinOps | standard | todo |  |  |

## D4 IA ML Data (40-IA-ML-Data) (10 clusters)

| ID | Titre | Importance | Statut | Date | Note |
|---|---|---|---|---|---|
| C4.1 | Fondamentaux mathématiques et statistiques pour l'IA | standard | todo |  |  |
| C4.2 | Machine Learning classique (supervisé et non supervisé) | standard | todo |  |  |
| C4.3 | Deep Learning et PyTorch | standard | todo |  |  |
| C4.4 | LLMs théoriques | standard | todo |  |  |
| C4.5 | Computer Vision | standard | todo |  |  |
| C4.6 | NLP et audio | standard | todo |  |  |
| C4.7 | ML pour cybersécurité (transverse D1) | standard | todo |  |  |
| C4.8 | Données et data engineering léger | standard | todo |  |  |
| C4.9 | MLOps et LLMOps | standard | todo |  |  |
| C4.10 | Éthique, sécurité et régulation IA | standard | todo |  |  |

## D5 Reseaux (50-Reseaux) (10 clusters)

| ID | Titre | Importance | Statut | Date | Note |
|---|---|---|---|---|---|
| C5.1 | Modèles OSI et TCP/IP | standard | todo |  |  |
| C5.2 | IPv4, IPv6, subnetting | standard | todo |  |  |
| C5.3 | Switching et Ethernet | standard | todo |  |  |
| C5.4 | Routing fondamentaux | standard | todo |  |  |
| C5.5 | BGP et Internet | standard | todo |  |  |
| C5.6 | Services réseau | standard | todo |  |  |
| C5.7 | WAN, VPN, SD-WAN | standard | todo |  |  |
| C5.8 | Wireless (WiFi) | standard | todo |  |  |
| C5.9 | Sécurité réseau | standard | todo |  |  |
| C5.10 | Automation et NetDevOps | standard | todo |  |  |

## Conventions de mise a jour

Les slash commands mettent ce fichier a jour automatiquement. En cas d'edition manuelle, respecter :

- Une seule ligne par cluster
- Colonne `Date` au format YYYY-MM-JJ (date du dernier changement de statut)
- Colonne `Note` libre, max 80 caracteres (ex: verdict QC, commit hash, blocage)
- Ne JAMAIS supprimer de ligne, seulement changer le statut
