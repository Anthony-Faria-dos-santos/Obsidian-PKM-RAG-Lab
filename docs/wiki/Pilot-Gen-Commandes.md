# pilot-gen, commandes slash

Toutes les commandes ci-dessous sont définies dans `pilot-gen/.claude/commands/`. Elles s'exécutent dans une session Claude Code ouverte à la racine de `pilot-gen/`.

## `/nouveau-pilote <ID>`

Génère le prompt pilote du cluster passé en argument.

```
/nouveau-pilote C3.2
```

Déroulé :

1. Lecture du `catalogue/clusters.yaml` pour extraire la fiche du cluster.
2. Lecture du curriculum parent (cybersec, dev, cloud, IA/ML, réseaux selon le préfixe).
3. Lecture de l'exemple canonique `template/EXEMPLE-C2.0.6.md` pour caler la longueur et le niveau de détail.
4. Lecture du template paramétrable `template/PROMPT-PILOT-TEMPLATE.md`.
5. Remplissage de chaque variable avec du contenu spécifique au cluster.
6. Écriture dans `generated/<DOMAINE>/PROMPT-PILOT-<ID>-<SLUG>.md`.
7. Mise à jour de `STATUS.md` (statut `todo` vers `generated`).
8. Ajout d'une entrée dans `CHANGELOG.md`.
9. Proposition d'un commit Git (jamais automatique).

Détail complet du protocole : [Pilot-Gen-Protocoles](Pilot-Gen-Protocoles.md).

## `/qc <ID>`

Lance le contrôle qualité automatique sur un prompt déjà généré.

```
/qc C3.2
```

Déclenche le subagent `pilot-qc` qui évalue le prompt contre `template/CHECKLIST-QC.md`. Verdicts possibles :

- **OK** : le statut passe à `qc-ok`.
- **WARN** : corrections mineures à appliquer, propose `/regen <ID>` ou édition manuelle.
- **FAIL** : statut `qc-fail`, rapport détaillé affiché, à régénérer.

## `/etat`

Affiche un tableau synthétique de l'avancement.

```
/etat
```

Sortie type :

```
Domaine           | TODO | GEN | QC-OK | DEPLOYED | TOTAL
D1 Cybersec       |  15  |  2  |   1   |    1     |   19
D2 Dev            | 120  |  5  |   3   |    1     |  129
D3 Cloud          |  11  |  1  |   1   |    0     |   13
D4 IA/ML          |  10  |  0  |   0   |    0     |   10
D5 Reseaux        |  10  |  0  |   0   |    0     |   10
TOTAL             | 166  |  8  |   5   |    2     |  181
```

## `/liste-restants [DOMAINE]`

Liste les clusters non encore générés. Filtre optionnel par domaine.

```
/liste-restants D1
/liste-restants
```

## `/next`

Suggère les trois prochains clusters à générer, avec justification courte.

```
/next
```

Règles de priorité appliquées :

1. Clusters `pilier` avant `standard` avant `deep-cut`.
2. Clusters liés à une certification ciblée proche (ex. AZ-900 prévue dans le mois).
3. Prérequis d'abord (C2.1.x avant C2.3A.x, C1.1 avant C1.4, etc.).
4. Respect du phasing défini dans les curriculums.
5. Démarrer par des clusters de 30 à 60 pages, pas par les gros clusters de 100+.

## `/batch <DOMAINE>`

Génère en série tous les clusters `todo` d'un domaine.

```
/batch D3
```

Mécanique :

1. Liste les clusters `todo` du domaine.
2. Propose un plan ordonné (mêmes règles que `/next`).
3. Demande validation humaine avant de lancer.
4. Génère un par un, avec checkpoint humain toutes les trois générations.
5. Met à jour `STATUS.md` et `CHANGELOG.md` à chaque itération.
6. Commit Git unique à la fin du batch, avec message récapitulatif.

## Au démarrage de session

Pas une commande, mais un comportement : à l'ouverture d'une session Claude Code dans `pilot-gen/`, le modèle lit `STATUS.md` et `CHANGELOG.md` automatiquement, affiche un résumé de trois lignes, et propose la suite (continuer un batch, générer un nouveau cluster, ou consulter l'état).
