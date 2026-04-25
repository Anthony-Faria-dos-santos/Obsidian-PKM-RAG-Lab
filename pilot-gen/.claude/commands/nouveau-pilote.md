---
description: Genere le PROMPT-PILOT exhaustif d'un cluster a partir de son ID, en injectant les regles vivantes du vault (CLAUDE.md, Learnings.md, Schema.md)
argument-hint: "<CLUSTER_ID>  (ex: C3.2, C1.5, C2.3A.1)"
allowed-tools: Read, Write, Edit, Grep, Glob, Bash(git add:*), Bash(git commit:*), Bash(git status:*), Bash(git diff:*), Bash(test:*)
---

Tu dois generer le prompt pilote exhaustif pour le cluster `{{ARGS}}`.

Ce prompt embarque trois blocs dynamiques synchronises depuis le vault : les regles editoriales (`CLAUDE.md`), les apprentissages cumules des runs precedents (`00-Meta/Learnings.md`), et le schema frontmatter YAML (`00-Meta/Schema.md`). Cette synchronisation est effectuee a chaque appel pour garantir zero drift entre le vault et le prompt genere.

## Etapes obligatoires dans l'ordre

1. **Lookup catalogue** : lire `catalogue/clusters.yaml`, extraire la fiche complete de `{{ARGS}}` (title, domain, folder, pages_target, importance, status, certs, brief, transverse, delta_validation). Si le cluster n'existe pas, arreter et signaler.

2. **Verifier le statut** : si le statut actuel dans `STATUS.md` est `generated`, `qc-ok` ou `deployed`, demander confirmation explicite a Anthony avant de regenerer (risque d'ecraser un prompt valide).

3. **Lookup curriculum** : selon le prefixe cluster, lire la section correspondante dans le curriculum source :
   - `C1.*` : `curriculums/02-Cybersec-Curriculum.md`
   - `C2.*` : `curriculums/01-Developer-2026-Curriculum.md`
   - `C3.*` : `curriculums/03-Cloud-Curriculum.md`
   - `C4.*` : `curriculums/04-AI-ML-Curriculum.md`
   - `C5.*` : `curriculums/05-Reseaux-Cert-Roadmap.md`
   
   Extraire la liste detaillee des sous-themes, certifications liees, pieges specifiques.

4. **Verifier le vault source** : la variable d'environnement `PILOT_GENERATOR_VAULT_PATH` doit etre definie (pose par `scripts/init.ps1`). Verifier que les trois fichiers cles existent et ne sont pas vides :
   - `$PILOT_GENERATOR_VAULT_PATH/CLAUDE.md`
   - `$PILOT_GENERATOR_VAULT_PATH/00-Meta/Learnings.md`
   - `$PILOT_GENERATOR_VAULT_PATH/00-Meta/Schema.md`
   
   Si la variable d'environnement est absente, arreter avec :
   ```
   Erreur : PILOT_GENERATOR_VAULT_PATH non defini.
   Solution : lancer .\scripts\init.ps1 -VaultPath "<chemin-du-vault>" -SkipCurriculums
   ```
   
   Si un fichier manque ou est vide, arreter avec :
   ```
   Erreur : vault incomplet. Fichier <chemin> absent ou vide.
   Solution : verifier PILOT_GENERATOR_VAULT_PATH dans .claude/settings.local.json et la structure du vault (section 00-Meta/).
   Si le vault n'a pas encore de Learnings.md (premier run), creer un squelette minimal avec en-tete "# Apprentissages cumules des runs" avant de relancer.
   ```

5. **Lire les 3 snapshots du vault** (source de verite vivante des regles) :
   - `$PILOT_GENERATOR_VAULT_PATH/CLAUDE.md` -> contenu a injecter dans `{{EDITORIAL_RULES_VAULT}}`
   - `$PILOT_GENERATOR_VAULT_PATH/00-Meta/Learnings.md` -> contenu a injecter dans `{{LEARNINGS_CUMULES}}`
   - `$PILOT_GENERATOR_VAULT_PATH/00-Meta/Schema.md` -> contenu a injecter dans `{{SCHEMA_YAML_VAULT}}`
   
   Conserver les contenus tels quels, sans reformulation, sans troncature, sans normalisation. Ces trois fichiers sont la source de verite ; le prompt genere n'est qu'un transport.

6. **Lire la reference canonique** : `template/EXEMPLE-C2.0.6.md` en entier. C'est le gold standard de qualite et de longueur a reproduire.

7. **Lire le template parametrable** : `template/PROMPT-PILOT-TEMPLATE.md`. Toutes les variables `{{...}}` doivent etre remplacees, y compris les trois nouvelles : `{{EDITORIAL_RULES_VAULT}}`, `{{LEARNINGS_CUMULES}}`, `{{SCHEMA_YAML_VAULT}}`, ainsi que `{{SNAPSHOT_DATE}}` et `{{GENERATION_DATE}}` (tous deux egaux a la date du jour au format YYYY-MM-DD).

8. **Invoquer le subagent `pilot-generator`** pour produire le fichier `generated/D<N>-<Domaine>/PROMPT-PILOT-<CLUSTER_ID>-<Slug>.md` :
   - Passer en entree : la fiche catalogue, la section curriculum, les 3 contenus vault bruts, le chemin template, le chemin EXEMPLE
   - Le subagent remplace toutes les variables du template
   - Le subagent enrichit `SOUS_THEMES_LISTE`, `BIBLIOGRAPHIE_SPECIFIQUE`, `FACT_CHECK_RULES_SPECIFIQUES`, `PIEGES_DOMAINE`, `DELTA_VALIDATION`
   - Le subagent verifie l'absence d'em-dash et de variable non resolue avant ecriture

9. **Verifier la qualite** (cote agent principal, double check) :
   - Aucun em-dash (caractere U+2014) dans tout le fichier
   - Aucune occurrence de `{{` (variable non resolue)
   - Les trois blocs vault sont bien presents entre les commentaires `<!-- BEGIN ... -->` et `<!-- END ... -->`
   - Longueur proche de l'exemple C2.0.6 (plus ou moins 30 pour cent)

10. **Mettre a jour `STATUS.md`** : passer la ligne du cluster de `todo` a `generated`, mettre a jour la date, incrementer le compteur de la synthese globale.

11. **Mettre a jour `CHANGELOG.md`** : ajouter une entree en tete :
    ```
    ## YYYY-MM-DD
    - feat(pilot): genere PROMPT-PILOT-<ID>-<Slug>.md (Xk mots, Y sous-themes, Z sources, snapshot vault YYYY-MM-DD)
    ```

12. **Proposer un commit Git** : presenter a Anthony le diff (`git status`, `git diff --stat`) puis proposer :
    ```
    git add generated/ STATUS.md CHANGELOG.md
    git commit -m "feat(pilot): <ID> <Slug>"
    ```
    Ne PAS committer automatiquement, attendre validation.

13. **Proposer le QC** : suggerer a Anthony d'enchainer avec `/qc <ID>` pour valider.

## Regles non negociables

- Redaction FR uniquement
- Zero em-dash
- Priorite Edu > Open Source > Commercial avec min 2-3 alternatives par categorie d'outils
- Aucune invention : si un fait date ne peut pas etre verifie, le marquer `[NON_VERIFIE]` dans le prompt genere
- Toujours invoquer le subagent `pilot-generator` (defini dans `.claude/agents/pilot-generator.md`) pour le travail redactionnel lourd, afin d'isoler le contexte et reduire le cout token global
- **Ne jamais reformuler ni tronquer les 3 contenus vault injectes**. Le vault est source de verite, le prompt est transport.

## En cas de doute

Consulter `CLAUDE.md` (racine du projet `pilot-generator`) pour les conventions completes.
