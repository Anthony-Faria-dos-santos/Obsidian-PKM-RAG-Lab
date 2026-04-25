# Schema du catalogue `clusters.yaml`

Documentation du format YAML utilise pour decrire les 181 clusters du Second Brain d'Anthony.

## Structure d'une entree

```yaml
<CLUSTER_ID>:
  title: "<Titre humain du cluster>"
  domain: <D1|D2|D3|D4|D5>
  folder: "<Johnny Decimal folder>"
  pages_target: <entier, nombre de pages atomiques cible>
  importance: <pilier|standard|deep-cut|spe>
  status: <todo|wip|generated|qc-ok|deployed|qc-fail|deprecated>
  certs: [<liste des certifications liees>]
  brief: "<description courte, 1 a 2 lignes>"
  transverse: [<liste des cluster IDs lies pour wikilinks>]
  delta_validation: <duree, ex: 6m, 12m, 24m, 36m, 60m>
```

## Champs en detail

### `CLUSTER_ID` (cle)

Format : `C<domaine>.<sous-domaine>[.<sous-sous-domaine>]` avec domaine de 1 a 5.

Exemples :

- `C1.5` : domaine cybersec, cluster 5 (Active Directory offensif)
- `C2.0.1` : domaine dev, cluster fondation 0, sous-cluster 1
- `C2.3A.1` : domaine dev, cluster 3A (frontend), sous-cluster 1

Les suffixes alphabetiques (A, B, C) servent a regrouper plusieurs axes d'un meme domaine (par exemple C2.3A pour frontend, C2.3B pour backend).

### `title`

Titre lisible humain, en francais, sans em-dash, sans accents dans les slugs derives.

### `domain`

Un des 5 codes :

| Code | Nom | Folder Johnny Decimal |
|---|---|---|
| D1 | Cybersecurite | 10-Cybersecurite |
| D2 | Developpement | 20-Developpement |
| D3 | Cloud | 30-Cloud |
| D4 | IA-ML-Data | 40-IA-ML-Data |
| D5 | Reseaux | 50-Reseaux |

### `folder`

Dossier Johnny Decimal du vault Obsidian ou le cluster sera cree. Correspond au champ `domain`.

### `pages_target`

Nombre de pages atomiques attendues apres run du prompt pilote. Valeurs typiques :

- 30 a 40 pour un cluster standard
- 50 a 60 pour un cluster pilier a forte profondeur
- 20 a 25 pour un cluster deep-cut cible

### `importance`

- `pilier` : incontournable, base du domaine, a traiter en priorite
- `standard` : complete le socle, a generer apres les piliers
- `deep-cut` : sujet de specialisation ou de curiosite, optionnel
- `spe` : specialisation avancee, dependante de multiples prerequis

### `status`

Cycle de vie complet :

```
todo -> wip -> generated -> qc-ok -> deployed
                    |
                    `-> qc-fail -> todo (regeneration)
```

Un cluster `deprecated` est un cluster abandonne ou fusionne avec un autre.

### `certs`

Liste des certifications liees. Permet de prioriser selon l'agenda d'Anthony.

Exemples :

- `[AZ-900, AZ-104]` pour Azure fundamentals
- `[CompTIA Security+, OSCP]` pour cybersec offensif
- `[]` liste vide si pas de certif directement liee

### `brief`

Description synthetique de 1 a 2 lignes, utilisee comme point de depart pour la generation du champ `DESCRIPTION_CLUSTER` du prompt pilote.

### `transverse`

Liste des cluster IDs qui ont des liens bidirectionnels avec le cluster courant. Sert a tisser les wikilinks Obsidian lors de la generation.

Exemple :

```yaml
C1.5:
  transverse: [C1.4, C1.9, C1.15, C2.6]  # AD offensif lie a MITRE, Blue Team, tooling offensif, Windows dev
```

### `delta_validation`

Duree avant que le contenu ne soit considere comme potentiellement obsolete. Utilise pour planifier les revalidations periodiques.

| Valeur | Domaines typiques |
|---|---|
| `6m` | Cloud providers (prix, services), outils IA (modeles, librairies) |
| `12m` | Dev frameworks, stacks applicatives |
| `24m` | Cybersecurite offensive (outils), DevOps |
| `36m` | Fondamentaux cybersec (crypto, reseaux theoriques) |
| `60m` | Fondations (Git, SQL, OS, architectures classiques) |

## Invariants a respecter

- Chaque cluster a un `CLUSTER_ID` unique
- Chaque cluster a un `domain` valide
- `certs`, `transverse` sont des listes (jamais `null`, liste vide tolerée)
- `status` initial = `todo` a la creation
- `delta_validation` obligatoire pour planifier les rafraichissements

## Validation automatique

Un script Python peut valider la coherence :

```python
# scripts/validate_catalogue.py (a implementer)
# - Parse YAML
# - Verifie unicite des IDs
# - Verifie que tous les transverse pointent vers des IDs existants ou marques a creer
# - Verifie que le domain correspond au prefixe du cluster ID (C1.* -> D1 etc)
# - Verifie que les certs sont dans une liste blanche connue
```
