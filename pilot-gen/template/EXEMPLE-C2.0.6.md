# KNOWLEDGE VAULT GENERATOR, PILOT — Cluster C2.0.6 Collaboration IA-augmentée

> Version pilote pré-remplie pour le premier run du vault « Second Brain Anthony ». Objectif : calibrer la méthode sur le cluster méta-ROI « collaboration IA-augmentée » (Claude Code, Cursor, Aider, MCP, workflows agent-assisté). Budget cible : 1-2h de run, 15-30€ en tokens. Résultat : un pilote opérationnel + un prompt de production validé empiriquement pour les 60+ clusters suivants.

---

## VARIABLES REMPLIES

```
SUJET              : "Développement logiciel 2026"
CLUSTER_CHOISI     : "C2.0.6 — Collaboration IA-augmentée"
DESCRIPTION_CLUSTER: "Pratiques et outillage de développement assisté par agents IA en 2026. Couvre les éditeurs/agents (Claude Code, Cursor, Aider, Windsurf, Zed AI, Copilot Workspace), les workflows multi-fichier et multi-session (worktrees Git pour parallélisation d'agents, checkpointing, plan mode, autonomie contrôlée), le Model Context Protocol (MCP) côté client et serveur, les fichiers de règles et conventions (CLAUDE.md, AGENTS.md, .cursorrules, .aider.conf.yml), le prompting pour le code (patterns de requête, décomposition de tâche, spec-first, test-first), la gestion du contexte (curation, compaction, memory files, skills), les méthodes d'évaluation de la qualité d'agent (evals de tâches dev, regression suite, golden PRs), et les anti-patterns (over-trust, cascade d'erreurs, contexte pollué). Inclure les débats en cours (agent autonomy vs human-in-the-loop, capabilities vs safety, coût perçu vs productivité réelle). Exclure le prompt engineering généraliste non lié au code (→ cluster dédié C2.5.3) et l'ingénierie d'applications LLM côté produit (→ Tier 5 entier). Niveau : praticien dev intermédiaire à avancé. Français, tranché, avec exemples concrets de workflows réels."
CHEMIN_VAULT       : "C:\Users\madko\Sandbox-lite\SecondBrain-Anthony"
NB_PAGES_CIBLE     : 40
```

> Ajuste `CHEMIN_VAULT` si ton arborescence Obsidian est différente. Le dossier doit être **vide ou inexistant**.

---

## MISSION

Tu es l'agent principal chargé de construire un **vault pilote** sur un seul cluster du sujet **Développement logiciel 2026** : le cluster **C2.0.6 Collaboration IA-augmentée**. Objectif : 30 à 50 pages denses, interconnectées, en français, avec wikilinks et graphe Obsidian navigable.

Ce run est le **premier pilote** d'un vault plus large (~60 clusters sur 10 domaines). Ta qualité et ton respect des conventions déterminent la suite. Ce pilote servira de **playbook méthodologique** pour tous les clusters à venir — d'où l'importance particulière de la rigueur.

**Mode d'opération** : tu travailles en autonomie sur les phases techniques, mais tu **t'arrêtes et demandes validation humaine à 3 checkpoints précis**. Pas d'autonomie totale. Pas de spawn multi-agent complexe : tu peux utiliser le Task tool pour des subagents focalisés (1 subagent à la fois max) uniquement quand c'est nécessaire (exploration parallèle d'un sous-thème, fact-check groupé). Sinon tu travailles en direct.

Langue : **français intégral** (contenu, titres, YAML, tags). Terminologie consacrée en anglais conservée dans le corps du texte uniquement quand c'est le nom propre d'un concept (ex : « worktree » dans le texte mais titre « Git worktrees pour agents IA »).

**Règle personnelle Anthony** : zéro tiret cadratin (—). Utilise deux-points, virgules, ou parenthèses. Accents complets. Pas de « il convient de noter », « il est important de souligner », « en conclusion ».

---

## ARCHITECTURE DU VAULT PILOTE

```
{CHEMIN_VAULT}/
├── CLAUDE.md                   # Schéma du vault (à enrichir depuis le template racine si présent)
├── README.md                   # Vue d'ensemble
├── _MOC.md                     # Map of Content du cluster
├── pages/                      # Toutes les pages du cluster
│   └── [pages .md]
├── 99-Meta/
│   ├── Schema.md              # Conventions YAML
│   ├── Plan.md                # Plan des pages (Phase 1)
│   ├── Fact-Check-Log.md      # Traces WebSearch
│   ├── Audit.md               # Rapport qualité final
│   └── Debrief.md             # Retour d'expérience pour scaling
└── .obsidian/
    └── graph.json             # Config graph view colorisée par type
```

Si un fichier `CLAUDE.md` pré-existe à la racine (template perso Anthony), **lis-le en premier** et intègre ses conventions sans les écraser : complète-le seulement avec la partie schéma technique du vault.

Structure plate volontairement : sur 40 pages, pas besoin de sous-clusters.

---

## PHASES AVEC CHECKPOINTS HUMAINS

### PHASE 0, BOOTSTRAP (5 min)

1. Créer la structure de dossiers.
2. Lire `CLAUDE.md` racine si existant ; sinon le créer en respectant les conventions de ce prompt.
3. Enrichir/rédiger `CLAUDE.md` avec :
   - Sujet général, cluster ciblé, périmètre
   - Conventions YAML et wikilinks
   - Règles d'édition future
   - Rappel des règles personnelles Anthony (français, anti-cadratin, ordre Edu→OSS→Commercial pour toute recommandation d'outil)
4. Rédiger `99-Meta/Schema.md` avec le schéma YAML détaillé (voir section « Conventions »).
5. Configurer `.obsidian/graph.json` : couleurs par type YAML (concept=bleu, personne=vert, outil=orange, pratique=rose, controverse=rouge, terme=gris, débat=violet, pattern=cyan).
6. Rédiger un `README.md` minimal (sera enrichi en Phase 6).

Puis continue directement vers Phase 1.

### PHASE 1, CARTOGRAPHIE DU CLUSTER (15-20 min)

Génère dans `99-Meta/Plan.md` une liste de **35 à 50 pages à créer** couvrant le cluster sous tous ses angles.

Axes de couverture obligatoires pour ce cluster :

- **Outils et éditeurs** : Claude Code, Cursor, Aider, Windsurf, Zed AI, Copilot Workspace, OpenCode, Continue.dev (pages type `outil`)
- **Protocoles et standards** : MCP (pages dédiées — overview, serveurs, clients, resources/tools/prompts, SDK, écosystème)
- **Fichiers de configuration** : CLAUDE.md, AGENTS.md, .cursorrules, .aider.conf.yml, MCP settings (pages type `pattern`)
- **Workflows** : plan mode, auto-mode, worktrees Git pour parallélisation, session management, handoff inter-conversations, spec-first, test-first agent-assisté (pages type `pratique`)
- **Techniques de prompting code** : décomposition de tâche, référencement de fichiers, contexte minimal, diff-first vs rewrite, grounded prompting (pages type `pratique`)
- **Évaluation** : evals de tâches dev, regression suite pour agent, golden PRs, coût par tâche, productivité mesurée (pages type `pratique` et `concept`)
- **Anti-patterns** : over-trust, contexte pollué, cascade d'erreurs, shadow changes, verification failure (pages type `controverse` ou `débat`)
- **Débats en cours** : autonomy vs human-in-the-loop, MCP fragmentation, coût réel vs productivité perçue (pages type `débat`)
- **Personnes-clés** : figures publiques du domaine 2025-2026 (Andrej Karpathy sur « software 3.0 », DHH sur agents, Simon Willison, etc.) (pages type `personne` — fact-check obligatoire)
- **Pages-ponts** : liens vers C2.5 (AI engineering), C1 (cybersec — prompt injection dev tooling), C2.0.1 (Git avancé — worktrees), C7.1 (PKM — CLAUDE.md comme mémoire structurée)

Pour chaque page, fournir :

```markdown
### N. Titre exact de la page
- **Type** : concept | pratique | outil | pattern | controverse | débat | personne | terme | protocole
- **Priorité** : 1 (pilier) | 2 (standard) | 3 (deep cut)
- **Résumé** : 2 phrases
- **Wikilinks pressentis** : [[Page A]], [[Page B]], [[Page C]]
- **Niveau controverse** : low | medium | high
- **Fact-check requis** : oui/non (oui si type = personne OU chiffres précis OU affirmations sur outils commerciaux)
```

Exigences sur le plan :

- **Équilibre des types** : au moins 5 types différents représentés ; aucun type qui domine à plus de 40%.
- **Spectre consensus-controverse** : au moins 4 pages type `controverse` ou `débat`.
- **Pages-ponts** : 4 à 6 pages qui connectent ce cluster à d'autres domaines.
- **Piliers incontournables** présents : MCP overview, CLAUDE.md pattern, Claude Code, Cursor, Aider, worktrees-agent-workflow, context engineering for code, evals for coding agents.
- **Anti-redondance** : deux pages quasi-synonymes = fusionner ou différencier explicitement.
- **Ancrage 2026** : mentionner la date dans le YAML (`valide_jusqu_a: 2026-12-31` par défaut sur les pages outils et pratiques).

Une fois le plan rédigé, **avocat du diable interne** : relis-le toi-même et challenge :
- Quels angles morts ? (exemple à vérifier : sécurité / prompt injection dans fichiers de règles, souveraineté des données, modèles locaux pour code)
- Quels chevauchements avec le futur C2.5 AI engineering à éviter ?
- L'équilibre des types est-il tenu ?
- Les outils commerciaux sont-ils présentés de façon équitable vs OSS ?

Corrige directement sans m'en parler. Puis :

**CHECKPOINT 1, VALIDATION HUMAINE**

```
─────────────────────────────────────────
CHECKPOINT 1 : Plan du cluster terminé
─────────────────────────────────────────
Fichier : 99-Meta/Plan.md
Nombre de pages planifiées : N
Répartition par type : [liste]
Répartition par priorité : [liste]
Pages à fact-checker : N
Pages-ponts vers autres clusters : [liste]

Merci de relire 99-Meta/Plan.md et de répondre :
  "GO" pour lancer la rédaction
  "CORRIGE : [instructions]" pour itérer
```

**Tu t'arrêtes et tu attends ma réponse.** Pas de Phase 2 avant validation.

### PHASE 2, RÉDACTION LOT PILOTE (20-30 min)

Une fois GO reçu, rédige **uniquement les 8 premières pages priorité 1** (pas tout le cluster).

Sélection recommandée pour ce cluster précis (à ajuster si Checkpoint 1 a bougé le plan) :

1. MCP (Model Context Protocol) — overview
2. Claude Code — outil
3. Cursor — outil
4. Aider — outil
5. CLAUDE.md — pattern de configuration
6. Worktrees Git pour agents parallèles — pratique
7. Context engineering pour le code — pratique
8. Evaluation des agents de codage — pratique

Pour chaque page :

1. **Si fact-check requis** :
   - WebSearch ciblé (2 requêtes max par page)
   - Consigner dans `99-Meta/Fact-Check-Log.md` : question, sources trouvées, statut (confirmé / douteux / introuvable)
   - Si introuvable après 2 recherches : marquer `statut: to-verify` dans YAML et mentionner dans le corps « information à confirmer »
   - **Pour les outils commerciaux** : fact-check obligatoire sur le modèle de pricing, les features différenciantes, la date de release de la dernière version majeure

2. **Rédaction** selon STRUCTURE IMPOSÉE :

```markdown
---
[YAML complet, voir section Conventions]
---

# Titre

> [!info] Résumé
> 1 à 2 phrases de pitch clair et précis.

## Définition
2 à 4 paragraphes denses. Pas de listing à puces gratuit.

## Contexte et origine
Qui, quand, où, dans quel cadre. Paragraphes.

## Fonctionnement / caractéristiques / mécanismes
Le cœur. 3 à 6 paragraphes. Exemples concrets de workflow, de commandes, de configs.

## Nuances, critiques, limites
OBLIGATOIRE. Coût réel, courbe d'apprentissage, cas où l'outil est mauvais choix, dépendances problématiques, enjeux de souveraineté.

## Liens et implications
Wikilinks sortants contextualisés dans des phrases complètes.

## Sources
[^1]: Référence 1
[^2]: Référence 2
```

**Standards qualité** :

- Longueur : **800 à 1500 mots** par page
- Minimum **7 wikilinks sortants** par page, bien contextualisés
- Minimum **2 sources externes** pour pages sensibles (personne/outil commercial/controverse/chiffres)
- Français clair, précis, zéro verbosité
- Pas de tiret cadratin
- Pas de « il est important de noter que », « cependant il faut garder à l'esprit », « en conclusion »
- Ton neutre mais tranché : si un outil est surévalué, dis-le et pourquoi
- **Pour les recommandations d'outils** : respecter l'ordre Edu → Open Source → Commercial (préférence Anthony) quand la comparaison s'y prête

**CHECKPOINT 2, VALIDATION HUMAINE QUALITÉ**

```
─────────────────────────────────────────
CHECKPOINT 2 : 8 pages pilotes rédigées
─────────────────────────────────────────
Pages créées : [liste des 8 titres]
Moyenne wikilinks sortants : X
Moyenne longueur : X mots
Pages avec statut to-verify : N
WebSearch effectués : N

Merci de relire 2-3 pages au hasard et répondre :
  "GO" pour rédiger les 25-35 pages restantes selon le même standard
  "AJUSTE : [instructions]" pour corriger et re-rédiger les 8 pages
  "STOP" pour abandonner le pilote
```

**Tu t'arrêtes. Tu attends. Pas de rédaction massive avant feu vert.**

### PHASE 3, RÉDACTION COMPLÈTE DU CLUSTER (45-60 min)

Une fois GO, rédige les pages restantes en **batches de 8-10 pages**. Entre chaque batch, message console court :

```
Batch N terminé : X pages. Total à ce stade : X/Y. Poursuite automatique.
```

Pas de nouveau checkpoint humain entre les batches. Tu enchaînes.

Règle stricte : **si tu n'as pas fini le cluster complet en 2h de wall time total depuis le début**, arrête-toi et fais un rapport d'avancement. Mieux vaut un pilote de 35 pages excellentes qu'un pilote de 50 pages mal finies.

### PHASE 4, LINKING ET MOC (15 min)

1. Générer le `_MOC.md` du cluster :
   - Introduction de 3 paragraphes situant le cluster dans le track Développeur 2026
   - Liste des pages groupées par type, avec 1 phrase descriptive chacune
   - Section « Pages-ponts » identifiant les connexions vers D1 Cybersec, D2 autres clusters dev, D7 productivité
   - Section « Pages à approfondir » listant les to-verify et à-sourcer

2. Densifier les wikilinks :
   - Parcourir chaque page, vérifier qu'elle est backlinkée depuis les pages pertinentes
   - Cible : ratio moyen 8-12 wikilinks par page
   - Wikilinks fantômes : si moins de 5 fantômes, les laisser (deep cuts futurs). Si plus de 5, lister dans `99-Meta/Pages-Fantomes.md`

3. Mettre à jour `README.md` avec stats du vault.

### PHASE 5, AUDIT QUALITÉ (10-15 min)

Produire `99-Meta/Audit.md` avec :

1. **Conformité YAML** : tous les champs obligatoires, énumérations respectées.
2. **Doublons** : pages à fusionner (0 si Phase 1 propre).
3. **Contradictions** : page A dit X, page B dit non-X.
4. **Pages orphelines** : 0 backlink entrant.
5. **Pages anémiques** : moins de 600 mots.
6. **Pages survoltées** : plus de 2000 mots (à découper ?).
7. **Sources manquantes** : pages sensibles sans footnote.
8. **Tags cohérents** : variantes orthographiques.
9. **Total wikilinks** : compte et ratio.
10. **Balance Edu/OSS/Commercial** : sur les pages outils, la pondération est-elle équilibrée ?

Pour chaque problème : action (corrigé automatiquement / nécessite arbitrage humain).

### PHASE 6, DEBRIEF POUR SCALING (10 min)

**Livrable critique.** Produire `99-Meta/Debrief.md` :

```markdown
# Debrief du run pilote — C2.0.6 Collaboration IA-augmentée

## Stats finales
- Pages créées : X
- Temps total : Xh
- Tokens consommés estimés : X
- WebSearch effectués : X
- Wikilinks totaux : X
- Pages marquées to-verify : X

## Ce qui a bien marché
- [Liste honnête]

## Ce qui a mal marché
- [Liste honnête, avec exemples précis]

## Hallucinations détectées
- [Liste exhaustive des faits inventés auto-corrigés ou à vérifier par l'humain]

## Ajustements recommandés pour le prompt de production (scaling vers les 60+ clusters du vault)
- Format YAML : [à garder / modifier]
- Structure de page : [à garder / modifier]
- Règles wikilinks : [à garder / modifier]
- Règles fact-check : [à renforcer / alléger / cibler différemment]
- Règles multi-agent : [retour d'expérience]
- Rythme : [temps réel par page sensible vs conceptuelle]
- Règles spécifiques aux clusters cyber (D1), réseau (D5), finance (D9) à anticiper

## Estimation pour scaling complet du vault Anthony
- Temps estimé pour 5000-6000 pages total : Xh
- Coût tokens estimé : X€ (ou X mois d'abonnement Max)
- Points de vigilance spécifiques par domaine

## Playbook pour les prochains clusters
- [3-5 règles apprises de ce pilote, applicables universellement]
```

**RAPPORT FINAL AU USER**

```
─────────────────────────────────────────
RUN PILOTE TERMINÉ — C2.0.6
─────────────────────────────────────────
Pages créées : X
Wikilinks : X
Graph Obsidian : prêt à visualiser
Pages à vérifier manuellement : X (voir 99-Meta/Audit.md)
Debrief pour scaling : 99-Meta/Debrief.md

Pour visualiser : ouvre {CHEMIN_VAULT} dans Obsidian puis Graph view.
Prochaine étape : relis Debrief.md puis décide du prochain cluster à lancer
(recommandés : C2.5.3 Prompt Engineering, ou C1.1 Fondamentaux cybersec).
```

---

## CONVENTIONS STRICTES

### YAML frontmatter obligatoire

```yaml
---
titre: "Nom exact de la page"
type: concept | pratique | outil | pattern | protocole | controverse | débat | personne | terme | œuvre | institution | événement
cluster: "C2.0.6 - Collaboration IA-augmentée"
domaine: "Développement"
statut: verified | to-verify | débattu | déprécié | hypothétique | stub | à-sourcer
controverse: low | medium | high
importance: pilier | standard | deep-cut
source_knowledge: internal | web-checked | mixed
sources_count: N
tags: [#dev/ia, #outil/claude-code, #pratique/worktree]
créé: 2026-04-22
révisé: 2026-04-22
valide_jusqu_a: "2026-12-31"
certif_liee: []
liens_forts: ["[[Page1]]", "[[Page2]]"]
liens_opposition: []
---
```

### Nommage fichiers

- Espaces autorisés.
- Titres en français naturel avec accents.
- Pas de préfixes numérotés sur les pages.

### Tags

- Minuscules, français, préfixe thématique (#outil/..., #pratique/..., #protocole/...).
- Max 5 tags par page.

### Wikilinks

- `[[Page exacte]]` ou `[[Page|alias]]`.
- Chaque wikilink justifié par la phrase qui l'entoure, jamais en listing brut hors MOC.

### Sources (footnotes Markdown)

```markdown
Fait sourcé[^1].

[^1]: Auteur ou organisme, *Titre*, date, URL.
```

Sources acceptables ordre de préférence :
1. Documentation officielle de l'outil (Anthropic docs, Cursor docs, docs Aider)
2. Spec du protocole (MCP spec)
3. Blog posts engineering de l'éditeur
4. Articles techniques reconnus (Simon Willison, Latent Space, Pragmatic Engineer)
5. Repos GitHub de référence

Éviter : threads Twitter/X sans autorité établie, articles Medium anonymes, posts LinkedIn promotionnels.

---

## RÈGLES ANTI-HALLUCINATION (NON-NÉGOCIABLES)

1. Aucun nom propre inventé. Si WebSearch ne trouve pas : la page n'existe pas ou statut `to-verify`.
2. Aucune date fabriquée. Si incertitude : « date exacte à confirmer » dans le corps.
3. Aucun chiffre non sourcé (pricing, tokens, benchmarks).
4. Aucune citation directe inventée. Paraphrase neutre sinon.
5. **Pour les outils commerciaux** : confirmer pricing et features via le site officiel au moment du run. Ne pas fabriquer de tiers de prix.
6. **Pour les benchmarks de productivité IA** : beaucoup sont orientés marketing. Citer la source et le niveau de confiance.
7. **Pour MCP** : ne pas inventer de serveurs MCP — vérifier sur l'écosystème officiel ou les listes communautaires.
8. Reconnaître les biais auteur (DHH anti-microservices, Karpathy pro-software 3.0, etc.) quand pertinent.
9. **Obligation de transparence** : toute hallucination auto-détectée doit être loggée dans `99-Meta/Fact-Check-Log.md` section « Auto-corrections ».

---

## RÈGLES SPÉCIFIQUES ANTHONY (CONVENTIONS PERMANENTES)

1. **Langue** : français intégral, accents complets.
2. **Typographie** : zéro tiret cadratin. Utilise deux-points, virgules, parenthèses.
3. **Recommandations d'outils** : ordre Edu → Open Source → Commercial. Toujours préciser le type et la fiabilité synthétique.
4. **Optimisation tokens** : formulations denses, zéro verbosité. Diffs plutôt que réécritures quand applicable.
5. **Consciencieux** : préférer « je ne sais pas » à une hallucination confiante.
6. **Profil cible** : dev intermédiaire-avancé, orienté cybersec, étudiant Bac+3 alternance. Adapte le niveau d'exemples (éviter le trop débutant, éviter le niveau thèse).

---

## DÉMARRAGE

Quand tu as lu et intégré ce prompt :

1. Confirme brièvement le sujet, le cluster, et le chemin vault.
2. Vérifie la présence éventuelle d'un `CLAUDE.md` racine template à la racine de `{CHEMIN_VAULT}` et intègre-le.
3. Lance Phase 0 directement.
4. Enchaîne jusqu'au Checkpoint 1. Puis arrête-toi et attends.

Go