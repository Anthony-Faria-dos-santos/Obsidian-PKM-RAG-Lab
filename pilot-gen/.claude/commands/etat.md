---
description: Affiche l'etat synthetique de generation des 181 clusters
allowed-tools: Read, Grep
---

Lire `STATUS.md` et produire un tableau de bord synthetique.

## Format attendu

```
Pilot Generator, etat au 2026-MM-JJ
====================================

Global : X/181 pilotes produits (Y qc-ok, Z deployed, W en wip)

| Domaine      | Total | todo | wip | generated | qc-ok | deployed | Progression |
|--------------|-------|------|-----|-----------|-------|----------|-------------|
| D1 Cybersec  | 19    | ...  | ... | ...       | ...   | ...      | XX pour cent |
| D2 Dev       | 129   | ...  | ... | ...       | ...   | ...      | XX pour cent |
| D3 Cloud     | 13    | ...  | ... | ...       | ...   | ...      | XX pour cent |
| D4 IA-ML     | 10    | ...  | ... | ...       | ...   | ...      | XX pour cent |
| D5 Reseaux   | 10    | ...  | ... | ...       | ...   | ...      | XX pour cent |

Prochain checkpoint recommande : <rappel selon heuristique>
Dernier commit pilote : <hash + message>
```

## Etapes

1. Lire `STATUS.md` en entier.
2. Compter par domaine et par statut.
3. Calculer la progression (qc-ok + deployed) / total par domaine.
4. Lire les 5 derniers commits via `git log --oneline -5` (si Git disponible).
5. Suggerer la prochaine action selon l'etat :
   - Si `wip` non nul depuis > 1 session : proposer de purger ou reprendre
   - Si `generated` non QC : proposer `/qc <ID>` pour le plus ancien
   - Sinon : proposer `/next` pour identifier le prochain cluster a lancer

## Regle de fraicheur

Si `STATUS.md` n'a pas ete mis a jour depuis plus de 7 jours, signaler a Anthony de relancer une session de generation ou de marquer explicitement une pause.
