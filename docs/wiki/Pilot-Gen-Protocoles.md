# pilot-gen, protocoles internes

Détail bas niveau de ce qui se passe quand une commande est lancée. Sert de référence quand un comportement diverge.

## Protocole `/nouveau-pilote <ID>`

Neuf étapes, dans cet ordre. Pas de raccourci possible.

### Étape 1, lookup catalogue

```
Read catalogue/clusters.yaml
Extraire la fiche du cluster <ID>
Si introuvable : stopper et afficher la liste des IDs valides du catalogue (fuzzy match sur les IDs proches)
```

### Étape 2, lookup curriculum

Mapping des préfixes vers les curriculums parents :

| Préfixe | Curriculum parent |
|---|---|
| `C1.*` | `curriculums/02-Cybersec-Curriculum.md` |
| `C2.*` | `curriculums/01-Developer-2026-Curriculum.md` |
| `C3.*` | `curriculums/03-Cloud-Curriculum.md` |
| `C4.*` | `curriculums/04-AI-ML-Curriculum.md` |
| `C5.*` | `curriculums/05-Reseaux-Cert-Roadmap.md` |

Grep pour la section du cluster (pattern `### <ID>` ou `C<ID>` dans les tableaux), puis lecture des 80 à 150 lignes autour pour récupérer les sous-thèmes exhaustifs.

### Étape 3, lookup exemple de référence

```
Read template/EXEMPLE-C2.0.6.md
```

Calibrer la longueur et le niveau de détail sur cet exemple. Pas paraphraser, **adapter**.

### Étape 4, lookup template paramétrable

```
Read template/PROMPT-PILOT-TEMPLATE.md
```

Identifier tous les placeholders `{{VARIABLE}}` à remplir.

### Étape 5, génération

Variables obligatoires :

- `{{CLUSTER_ID}}` : ex. `C3.2`
- `{{CLUSTER_TITLE}}` : ex. `Azure fundamentals et écosystème Microsoft`
- `{{CLUSTER_SLUG}}` : ex. `Azure-Fundamentals-Microsoft`
- `{{DOMAINE_CODE}}` : ex. `D3`
- `{{DOMAINE_NOM}}` : ex. `Cloud et Infrastructure`
- `{{DOSSIER_VAULT}}` : ex. `30-Cloud` (Johnny Decimal)
- `{{SUJET_GLOBAL}}` : ex. `Cloud et Infrastructure 2026`
- `{{DESCRIPTION_CLUSTER}}` : 3 à 5 phrases descriptives
- `{{SOUS_THEMES_LISTE}}` : liste Markdown tirée du curriculum
- `{{NB_PAGES_CIBLE}}` : nombre du catalogue
- `{{CERTIFS_LIEES}}` : liste des certifications du catalogue
- `{{TRANSVERSE_LINKS}}` : wikilinks vers autres clusters
- `{{BIBLIOGRAPHIE_SPECIFIQUE}}` : livres, YouTube, blogs (du curriculum)
- `{{CHEMIN_VAULT}}` : par défaut `C:\Users\Anthony\Obsidian\SecondBrain-Anthony`, surchargeable
- `{{FACT_CHECK_RULES_SPECIFIQUES}}` : règles propres au domaine (cybersec = MITRE/CVE/advisories, cloud = doc hyperscaler + release notes, etc.)
- `{{PIEGES_DOMAINE}}` : pièges classiques spécifiques au cluster

### Étape 6, écriture

Chemin de sortie :

```
generated/<DOMAINE>/PROMPT-PILOT-<CLUSTER_ID>-<SLUG>.md
```

Exemple : `generated/D3-Cloud/PROMPT-PILOT-C3.2-Azure-Fundamentals.md`.

### Étape 7, mise à jour de l'état

`STATUS.md` :

```
Changer la ligne du cluster <ID> :
  status: todo  ->  status: generated
  generated_at: 2026-04-22
  generated_by: <model>
```

`CHANGELOG.md`, ajouter en haut de la section "Recent" :

```
- 2026-04-22 | C3.2 | generated | <nom fichier> | <model>
```

### Étape 8, commit Git

Proposition à l'utilisateur (jamais d'auto-commit) :

```bash
git add generated/<chemin> STATUS.md CHANGELOG.md
git commit -m "feat(<DOMAINE>): generate prompt pilote <CLUSTER_ID> <TITLE>"
```

### Étape 9, proposition QC

À la fin du run, message standard :

> Prompt généré. Veux-tu que je lance le QC automatique ? (`/qc <ID>`)

## Protocole `/qc <ID>`

1. Lire `generated/<DOMAINE>/PROMPT-PILOT-<ID>-*.md`.
2. Lire `template/CHECKLIST-QC.md`.
3. Lancer le subagent `pilot-qc` (`.claude/agents/pilot-qc.md`) avec en entrée le prompt et la checklist.
4. Recevoir un verdict OK, WARN ou FAIL avec détail des critères non remplis.
5. Si **OK** : `STATUS.md` passe `generated` à `qc-ok`.
6. Si **WARN** : afficher les critères à corriger, proposer `/regen <ID>` ou correction manuelle.
7. Si **FAIL** : marquer `qc-fail`, afficher le rapport détaillé.

## Session recovery

À chaque démarrage de session Claude Code dans `pilot-gen/` :

1. Lecture automatique de `STATUS.md` et affichage d'un résumé en trois lignes :

```
Pilot Generator, session du 2026-04-22
Etat : 8/181 generes, 5 QC-OK, 2 deployes
Dernier prompt genere : C3.2 Azure Fundamentals (2026-04-21)
```

2. Lecture de `CHANGELOG.md` pour le contexte récent.

3. Proposition standard :

> Veux-tu continuer le dernier batch, générer un nouveau cluster, ou consulter l'état ?

## Gestion des erreurs

| Cas | Action |
|---|---|
| Cluster introuvable dans le catalogue | Afficher la liste des IDs proches via fuzzy match |
| Curriculum introuvable | Erreur explicite, instructions pour synchroniser `curriculums/` |
| Template manquant | Erreur bloquante, demander réinitialisation via `scripts/init.ps1` |
| Conflit dans `STATUS.md` (cluster déjà `qc-ok`, régénération demandée) | Avertissement, demande de confirmation explicite |

## Référence canonique

`template/EXEMPLE-C2.0.6.md` est le benchmark absolu. Tout prompt généré doit avoir :

- Même structure de sections (Phase 1 cartographie, Phase 2 fact-check, Phase 3 vérification humaine, Phase 4 rédaction cluster, Phase 5 debrief, Phase 6 prêt à scaler).
- Même niveau de détail dans les sous-sections.
- Même longueur approximative, +/- 30%.
- Même format des checkpoints humains.
- Même structure YAML frontmatter proposée.
