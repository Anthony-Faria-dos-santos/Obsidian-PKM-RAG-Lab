---
description: Genere en batch tous les clusters todo d'un domaine avec checkpoints
argument-hint: "<DOMAINE> (D1|D2|D3|D4|D5)"
allowed-tools: Read, Write, Edit, Grep, Glob, Bash(git add:*), Bash(git commit:*), Bash(git status:*)
---

Lancer la generation en batch des clusters `todo` du domaine `{{ARGS}}`.

## Protocole

1. **Lire l'etat** : `STATUS.md` + `catalogue/clusters.yaml` filtres par domaine `{{ARGS}}`.

2. **Proposer le plan** : presenter a Anthony la liste ordonnee des clusters a generer (par priorite, voir `/next`), avec estimatif du nombre de generations et du cout token approximatif.

3. **Demander confirmation explicite** avant de commencer. Le batch peut consommer significativement plus de tokens qu'une generation unique.

4. **Executer par paquet de 3 clusters** :
   - Pour chaque cluster, invoquer le subagent `pilot-generator` (contexte isole)
   - Apres chaque paquet de 3 : commit Git intermediaire + checkpoint humain
   - Demander a Anthony : continuer, pause, ajuster le prompt, arreter ?

5. **Ne jamais laisser un cluster en statut `wip`** entre deux sessions : toujours terminer proprement en `generated` ou rollback a `todo`.

6. **En cas d'erreur** : arreter le batch, remettre le cluster courant en `todo`, logguer dans `CHANGELOG.md` sous format :
   ```
   ## 2026-MM-JJ
   - batch(stop): interruption sur <ID>, raison : <message>
   ```

## Regle de securite

- Toujours committer entre les paquets (pas de gros commit de 10+ fichiers)
- Toujours re-lire `STATUS.md` entre deux generations (un agent externe a pu le modifier)
- Pas plus de 12 clusters dans un meme batch sans demander a Anthony de relancer manuellement (fatigue de l'operateur humain qui doit valider la qualite)

## Alternative recommandee

Pour les grands domaines (D2 Developpement avec 129 clusters), preferer plusieurs batchs cibles :
- `/batch D2` avec filtre sous-domaine si ajoute ulterieurement
- Ou generation interactive via `/nouveau-pilote` un par un pour controle fin
