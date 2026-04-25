---
description: Suggere les 3 prochains clusters a generer selon heuristiques de priorite
allowed-tools: Read, Grep
---

Proposer les 3 prochains clusters optimaux a generer, en appliquant les regles de priorite.

## Heuristique de priorite

Par ordre d'importance decroissant :

1. **Piliers non genere** : importance `pilier` et statut `todo`.
2. **Certifications proches** : clusters lies a une certif planifiee dans les 6 mois.
3. **Prerequis transverses** : clusters cites en `transverse` par d'autres deja genere mais dont la cible n'existe pas (liens casses).
4. **Volatilite elevee** : `delta_validation` a 6 mois (domaines cloud et IA) avant ceux a 24 a 60 mois (fondamentaux).
5. **Cluster le moins couteux restant** : pages_target faible pour un quick-win.

## Etapes

1. Lire `STATUS.md` et `catalogue/clusters.yaml`.
2. Filtrer les clusters `todo`.
3. Appliquer un scoring combine :
   - +5 si `importance = pilier`
   - +3 si lie a une certif Anthony prevue
   - +3 si cible d'un wikilink transverse d'un cluster deja `qc-ok`
   - +2 si `delta_validation <= 6m`
   - +1 si pages_target <= 40
4. Trier par score decroissant et proposer le top 3 avec justification.

## Format de sortie

```
Prochains clusters recommandes

1. <ID> <Titre> (score X)
   - Importance : <pilier|standard|deep-cut>
   - Certifs liees : <liste>
   - Pourquoi maintenant : <justification en 1-2 lignes>
   - Prerequis : <OK | liste des cluster manquants>
   - Commande : /nouveau-pilote <ID>

2. <ID> ...
3. <ID> ...

Alternative si Anthony veut un quick-win : <ID le moins couteux>
```

## Notes

- Si tous les piliers sont `qc-ok`, basculer sur les standards.
- Si Anthony mentionne une certification en cours (via CLAUDE.md ou conversation), prioriser les clusters lies.
