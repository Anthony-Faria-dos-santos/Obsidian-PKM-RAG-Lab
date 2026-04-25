---
description: Liste les clusters non encore generes, filtrable par domaine
argument-hint: "[D1|D2|D3|D4|D5]  (optionnel)"
allowed-tools: Read, Grep
---

Lister les clusters encore au statut `todo` dans `STATUS.md`.

## Comportement

- Si un filtre domaine est fourni (ex : `D1`), ne lister que ce domaine.
- Sinon, lister tous les clusters `todo` de tous les domaines.

## Format de sortie

```
Clusters restants <filtre>

D<N>, <nom domaine> (<X restants sur Y total>)
| ID | Titre | Importance | Certifs liees |
|----|-------|------------|---------------|
| ... | ... | ... | ... |

Suggestion de priorite :
1. Piliers d'abord (importance pilier)
2. Prerequis d'autres clusters (ex : C1.1 avant C1.4)
3. Certifications proches (delta < 6 mois)
```

## Etapes

1. Lire `STATUS.md`.
2. Lire `catalogue/clusters.yaml` pour enrichir avec importance et certifs.
3. Trier par importance (pilier > standard > deep-cut).
4. Si aucun cluster `todo` sur le filtre demande : feliciter et proposer de passer a un autre domaine ou au QC global.
