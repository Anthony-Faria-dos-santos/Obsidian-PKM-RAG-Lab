# CHANGELOG, Pilot Generator

Journal chronologique des generations, QC, et modifications du catalogue. Format inspire de Keep a Changelog.

Les sections recentes sont en haut. Entrees ajoutees automatiquement par les slash commands `/nouveau-pilote`, `/qc`, `/batch`.

---

## 2026-04-22

- qc(pilot): C1.1 verdict OK (27 OK / 0 WARN / 0 FAIL sur 27 criteres), rapport QC-C1.1-20260422.md
- feat(pilot): genere PROMPT-PILOT-C1.1-Fondamentaux-Cybersec.md (~7800 mots total, ~4900 hors blocs vault, 50 sous-themes, 30+ sources, snapshot vault 2026-04-22)
- chore(bootstrap): initialisation du projet pilot-generator
- feat(catalogue): creation initiale de `clusters.yaml` avec 181 clusters (D1: 19, D2: 129, D3: 13, D4: 10, D5: 10)
- feat(template): creation de `PROMPT-PILOT-TEMPLATE.md` parametrable
- feat(qc): creation de `CHECKLIST-QC.md` (27 criteres sur 6 sections)
- feat(status): initialisation `STATUS.md` avec tous les clusters en `todo` sauf `C2.0.6` en `generated` (pilote de reference)
- feat(commands): ajout des slash commands `/nouveau-pilote`, `/qc`, `/etat`, `/liste-restants`, `/next`, `/batch`
- feat(agents): ajout des subagents `pilot-generator` et `pilot-qc`
- feat(curriculums): integration des 5 curriculums sources reels (01-Developer, 02-Cybersec, 03-Cloud, 04-AI-ML, 05-Reseaux)
- feat(template): remplacement de `EXEMPLE-C2.0.6.md` par le pilote de reference reel (21 KB, SUJET "Developpement logiciel 2026")
- refactor(catalogue): regeneration de `clusters.yaml` depuis les curriculums reels, 179 clusters avec titres, importance, pages_target et certifications extraits des sources (D1: 17, D2: 129, D3: 13, D4: 10, D5: 10)
- refactor(status): regeneration de `STATUS.md` pour refleter les titres reels du catalogue
- docs(guide): creation de `GUIDE-USAGE.md`, guide operationnel de bout en bout (setup, workflow, commandes, checkpoints, FAQ)
- feat(rules): backport dynamique des regles vivantes depuis le vault via 3 placeholders {{EDITORIAL_RULES_VAULT}}, {{LEARNINGS_CUMULES}}, {{SCHEMA_YAML_VAULT}}. A chaque `/nouveau-pilote`, lecture directe de `$PILOT_GENERATOR_VAULT_PATH/CLAUDE.md`, `00-Meta/Learnings.md` et `00-Meta/Schema.md` avec verification d'existence et non-vide. Zero drift vault-generator.
- refactor(template): restructuration de PROMPT-PILOT-TEMPLATE.md avec Phase 0 d'internalisation des regles, sections `## Regles editoriales, snapshot...`, `## Apprentissages cumules...`, `## Schema frontmatter YAML...` entre marqueurs BEGIN/END, et Phase 6 qui boucle sur Learnings.md du vault (capture des nouveaux apprentissages)
- refactor(command): `/nouveau-pilote` passe de 11 a 13 etapes, avec 2 nouvelles etapes (verification vault + lecture 3 snapshots), messages d'erreur explicites en cas de vault incomplet
- refactor(subagent): `pilot-generator` recoit les 3 contenus vault en entree, doit les injecter bruts sans reformuler entre les marqueurs BEGIN/END

---

## Format des entrees

```
## YYYY-MM-JJ

- feat(pilot): genere PROMPT-PILOT-<ID>-<Slug>.md (Xk mots, Y sous-themes, Z sources)
- qc(pilot): <ID> verdict <OK|WARN|FAIL>, <score X/Y/Z sur 27>
- fix(pilot): <ID> correction <critere ou section> suite QC WARN
- chore(catalogue): mise a jour <ID> <champ modifie>
- refactor(template): <description>
- batch(start): domaine <D>, <N> clusters planifies
- batch(stop): interruption sur <ID>, raison : <message>
- batch(done): domaine <D>, <N> clusters generes, <M> QC-OK
```

## Convention de commit Git

Les messages de commit suivent le meme format que les entrees CHANGELOG. Exemple :

```bash
git commit -m "feat(pilot): C3.2 Azure-Fundamentals (12k mots, 45 sous-themes, 18 sources)"
```
