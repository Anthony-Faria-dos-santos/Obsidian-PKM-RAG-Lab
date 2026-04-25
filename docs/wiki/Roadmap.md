# Roadmap

État courant des chantiers ouverts. Mise à jour à chaque fois qu'une case bouge.

## Court terme

- [ ] Stabiliser `pilot-gen/` sur les 181 clusters cibles.
- [ ] Premier banc d'essai RAG local sur un cluster pilote, avec protocole écrit.
- [ ] Documenter le pipeline `.pdf` vers cluster Obsidian, de bout en bout.
- [ ] Ouvrir un sous-projet `error-vault/` pour la mémoire d'erreurs locale.
- [ ] Templates de notes de labo et schémas de mesure dans `docs/notes-de-labo/`.

## Moyen terme

- [ ] MCP serveur custom exposant `get_cluster(id)`, `update_status(id, status)`, `list_by_status(status)`. Évite les lectures YAML répétées en session.
- [ ] Pipeline de conversion `.html` vers cluster, avec extraction des wikilinks naturels.
- [ ] Pipeline `dump Notion` vers Obsidian, avec préservation des relations.
- [ ] Banc d'essai "agent codeur lit le vault avant de coder", avec mesure de tests passés au premier essai.
- [ ] Notion sync via `notion-memory-secure` pour doubler la trace d'état (utile en multi-machines).

## Long terme

- [ ] GitHub Actions de validation YAML du catalogue à chaque push.
- [ ] QC automatique déclenché sur les prompts modifiés.
- [ ] Script Python headless `python scripts/generate.py --cluster C3.2` pour usage CI/CD sans Claude Code interactif.
- [ ] Comparatif `vault grandi sur 6 mois` vs `vault régénéré à neuf` sur les mêmes clusters.

## Cases fermées

- [x] Bootstrap du projet `pilot-gen/`.
- [x] Génération du premier prompt pilote `C1.1 Fondamentaux Cybersec`.
- [x] QC validé sur `C1.1` avec verdict OK 27/27.
- [x] Subtree pilot-gen importé dans le dépôt principal.
