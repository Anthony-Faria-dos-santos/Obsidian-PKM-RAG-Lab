# Pilot Generator, usine a PROMPT-PILOT pour le Second Brain Anthony

Projet Claude Code dedie a la generation interactive, a la demande, de prompts pilotes exhaustifs pour chacun des 181 clusters du vault Obsidian Second Brain.

Conçu pour Claude Code CLI en mode Opus 4.7 ou Sonnet 4.6 extended context (1M tokens), avec persistance de l'etat entre sessions via Git + fichier STATUS.md.

## Objectifs

1. Qualite egale au modele de reference `PROMPT-PILOT-C2.0.6-Collaboration-IA.md` pour **chacun** des 181 clusters
2. Generation a la demande en une commande : `/nouveau-pilote <ID>` et le prompt est pret
3. Historique preserve : chaque prompt genere est commit Git, statut trace dans `STATUS.md`, log dans `CHANGELOG.md`
4. Pas de re-apprentissage : Claude relit `CLAUDE.md`, `STATUS.md`, template et curriculums a chaque session

## Prerequis

- Claude Code CLI installe (voir https://docs.claude.com)
- Modele `claude-opus-4-7` ou `claude-sonnet-4-6[1m]` (context 1M) selectionne
- Git installe et configure
- PowerShell 7+ (Windows) ou bash (Linux/macOS)
- Les 5 curriculums existants copies dans `curriculums/` (ou en lien symbolique)

## Installation

```powershell
# Windows PowerShell
cd "C:\Users\Anthony\Projects"
# Copier le contenu de /sessions/.../outputs/pilot-generator vers ce repertoire
# (utiliser l'UI Cowork ou une commande de synchro)

cd pilot-generator
git init
git add .
git commit -m "chore: bootstrap pilot-generator project"

# Copier les curriculums existants
Copy-Item "C:\Users\Anthony\Documents\curriculums\*.md" .\curriculums\

# Lancer Claude Code avec context 1M
claude --model claude-opus-4-7
# Ou en alternative moins chere
# claude --model "claude-sonnet-4-6[1m]"
```

## Usage quotidien

### Generer un nouveau pilote

```
/nouveau-pilote C3.2
```

Claude va :
1. Lire le catalogue pour extraire la fiche du cluster C3.2 (Azure fundamentals)
2. Lire le curriculum parent (`03-Cloud-Curriculum.md` section C3.2) pour les sous-themes
3. Lire le template `PROMPT-PILOT-TEMPLATE.md`
4. Remplir toutes les variables et produire `generated/D3-Cloud/PROMPT-PILOT-C3.2-Azure-Fundamentals.md`
5. Mettre a jour `STATUS.md` (todo -> generated)
6. Ajouter une entree `CHANGELOG.md`
7. Proposer un commit Git

### Faire un controle qualite

```
/qc C3.2
```

Declenche le subagent `pilot-qc` qui evalue le prompt contre `CHECKLIST-QC.md` et renvoie un verdict : OK, WARN (corrections mineures), FAIL (a regenerer).

### Voir l'avancement

```
/etat
```

Affiche un tableau synthetique : X generated, Y qc-ok, Z deployed, W todo. Par domaine et global.

### Lister ce qui reste

```
/liste-restants D1
```

Liste tous les clusters du domaine D1 (cybersec) non encore generes. Omettre le filtre pour tout voir.

### Suggerer le prochain cluster

```
/next
```

Analyse l'etat, applique les regles de priorite (pilier avant standard, prerequis d'abord, cert proche), propose les 3 clusters optimaux a generer ensuite.

### Generer en batch pour un domaine complet

```
/batch D3
```

Lance la generation de tous les clusters du domaine D3 encore en statut `todo`. Un par un, avec pause pour validation humaine toutes les 3 generations (checkpoint).

## Structure du projet

```
pilot-generator/
├── .claude/
│   ├── commands/                   # Slash commands custom
│   │   ├── nouveau-pilote.md
│   │   ├── qc.md
│   │   ├── etat.md
│   │   ├── liste-restants.md
│   │   ├── next.md
│   │   └── batch.md
│   ├── agents/                     # Subagents
│   │   ├── pilot-generator.md
│   │   └── pilot-qc.md
│   └── settings.local.json
├── CLAUDE.md                        # Contexte auto-charge a chaque session
├── catalogue/
│   ├── clusters.yaml                # Les 181 clusters, source de verite
│   └── schema.md                    # Documentation du format
├── template/
│   ├── PROMPT-PILOT-TEMPLATE.md     # Template parametrable
│   ├── CHECKLIST-QC.md              # Criteres QC
│   └── EXEMPLE-C2.0.6.md            # Reference canonique
├── curriculums/                     # Copies/symlinks des 5 curriculums
│   ├── 01-Developer-2026-Curriculum.md
│   ├── 02-Cybersec-Curriculum.md
│   ├── 03-Cloud-Curriculum.md
│   ├── 04-AI-ML-Curriculum.md
│   └── 05-Reseaux-Cert-Roadmap.md
├── generated/                       # Prompts produits, ranges par domaine
│   ├── D1-Cybersec/
│   ├── D2-Dev/
│   ├── D3-Cloud/
│   ├── D4-IA-ML/
│   └── D5-Reseaux/
├── STATUS.md                        # Etat courant de chaque cluster
├── CHANGELOG.md                     # Journal des generations
├── scripts/
│   └── init.ps1                     # Bootstrap PowerShell
└── .gitignore
```

## Regles de qualite

Tout prompt genere doit respecter :

- Redaction FR, zero tiret cadratin (em-dash), virgules et parentheses
- Priorite outils Edu > Open Source > Commercial (voir CLAUDE.md root vault)
- Les 6 phases du protocole officiel : `cartographie` -> `fact-check` -> `verification` -> `redaction par cluster` -> `debrief` -> `pret a scaler`
- Les 3 checkpoints humains conserves
- YAML frontmatter conforme au standard du vault (voir [[00-Architecture-Vault-Second-Brain]] et `CLAUDE-root-template.md`)
- Fact-check WebSearch obligatoire pour toute donnee datee
- Sources citees dans chaque page generee

## Scaling et coûts estimes

- **1 prompt pilote genere** : 2-5 min de run Claude Code, 0 EUR (c'est juste du texte).
- **1 run du prompt pilote** (cluster de 40 pages) : 1-2 h, 10-30 EUR de tokens API.
- **181 clusters runes en scaling GodMode** : objectif 18-36 mois, 2-5 k EUR total de tokens si tout passe par API paye. Avec un abonnement Claude Max, le coût marginal tombe drastiquement.

## Integration avec le Second Brain existant

- Le projet `pilot-generator` vit **hors** du vault Obsidian. Il genere des fichiers qui sont ensuite **deposes** dans le vault au moment de runer le prompt pilote reel.
- Le vault Obsidian lui-meme reste a `C:\Users\Anthony\Obsidian\SecondBrain-Anthony` avec son propre `CLAUDE.md` racine (celui genere precedemment).
- Le vault doit etre backupe independamment (Syncthing ou equivalent), voir [[00-Architecture-Vault-Second-Brain]] section Backup.

## Extensions possibles

- **MCP serveur custom** qui expose `get_cluster(id)`, `update_status(id, status)`, `list_by_status(status)` pour eviter les lectures YAML repetees.
- **Notion sync** via le skill `notion-memory-secure` pour doubler la trace d'etat (utile si multi-machines).
- **GitHub Actions** qui valide la structure YAML du catalogue a chaque push, declenche le QC auto sur les prompts modifies.
- **Script Python generateur headless** : `python scripts/generate.py --cluster C3.2` pour usage CI/CD sans Claude Code interactif.

---

*Genere par Claude Opus 4.7 dans Cowork, le 2026-04-22. MIT license.*
