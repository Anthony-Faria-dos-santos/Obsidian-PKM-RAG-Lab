---
description: Execute le controle qualite du prompt pilote d'un cluster genere
argument-hint: "<CLUSTER_ID>"
allowed-tools: Read, Write, Edit, Grep, Glob
---

Executer le controle qualite du prompt pilote `{{ARGS}}`.

## Etapes

1. **Localiser le fichier** `generated/D<N>-<Domaine>/PROMPT-PILOT-{{ARGS}}-*.md`. Si absent, arreter et demander a Anthony de lancer d'abord `/nouveau-pilote {{ARGS}}`.

2. **Invoquer le subagent `pilot-qc`** (defini dans `.claude/agents/pilot-qc.md`). Le subagent :
   - Lit le fichier genere
   - Lit `template/CHECKLIST-QC.md`
   - Evalue les 27 criteres A1 a F4
   - Produit un rapport au format defini dans la checklist
   - Sauvegarde le rapport dans `generated/D<N>-<Domaine>/qc/QC-{{ARGS}}-<YYYYMMDD>.md`

3. **Analyser le verdict** :
   - `OK` : mettre a jour `STATUS.md` : `generated` -> `qc-ok`
   - `WARN` : presenter les criteres WARN a Anthony, proposer des corrections ciblees via Edit, re-executer le QC apres correction
   - `FAIL` : expliquer les criteres FAIL, proposer a Anthony de regenerer (`STATUS.md` : retour a `todo`, puis `/nouveau-pilote {{ARGS}}`)

4. **Mettre a jour `CHANGELOG.md`** :
   ```
   ## 2026-MM-JJ
   - qc(pilot): <ID> verdict <OK|WARN|FAIL>, <score>
   ```

5. **Proposer un commit Git** avec :
   ```
   git add generated/D<N>-<Domaine>/qc/ STATUS.md CHANGELOG.md
   git commit -m "qc(pilot): <ID> <verdict>"
   ```

## Notes

- Le subagent `pilot-qc` tourne dans un contexte isole : il ne voit que le fichier a evaluer et la checklist, ce qui reduit drastiquement le cout token.
- Un verdict `WARN` est souvent corrigible en 2 a 3 edits cibles. Preferer cette voie plutot que la regeneration complete.
- Un verdict `FAIL` justifie une regeneration integrale : une derive structurelle (moins de 6 phases, checkpoints manquants) compromet la reproductibilite du pilote.
