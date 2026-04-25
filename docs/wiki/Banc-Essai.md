# Banc d'essai

Le labo n'a de sens que si on mesure ce qu'il produit. Cette page liste les pistes de test ouvertes, leur protocole, et le format des notes de labo.

## Pistes ouvertes

| Piste | Question testée | Métrique cible | Statut |
|---|---|---|---|
| RAG local sur vault complet | Cluster structuré bat-il un RAG naïf sur dump brut ? | Précision de réponse, taux d'hallucination | À ouvrir |
| Source de vérité projet web | Un agent codeur produit-il du code plus correct quand il lit le vault d'abord ? | Tests passés au premier essai, lignes corrigées en review | À ouvrir |
| Mémoire d'erreurs locale | Un sous-vault d'erreurs réduit-il le TTR ? | Temps moyen de résolution, taux de réoccurrence | À ouvrir |
| Conversion multi-format vers `.obsidian` | Quel pipeline (PDF, HTML, Notion, Slack, transcripts) préserve le mieux la sémantique ? | Fidélité, ratio de bruit, perte de structure | À ouvrir |
| Compounding temporel | Vault grandi sur 6 mois vs vault régénéré à neuf | Couverture, densité de wikilinks, fraîcheur | À ouvrir |

## Protocole standard d'un banc d'essai

Avant tout test, écrire la note de protocole. Pas de mesure sans protocole versionné.

Structure d'une note de protocole, à déposer dans `docs/notes-de-labo/<date>-<piste>.md` :

```markdown
---
date: 2026-04-25
piste: RAG-local-vault
auteur: Anthony
statut: protocole | en-cours | termine
---

## Hypothèse

Phrase unique. Ce qu'on cherche à valider ou invalider.

## Setup

- Modèles utilisés (avec version exacte)
- Stack RAG (LlamaIndex 0.10.x, embeddings, store, etc.)
- Vault sous test, commit Git
- Jeu de questions, taille, source

## Protocole

Étapes reproductibles. Quelqu'un d'autre doit pouvoir relancer.

## Métriques

Définir avant de lancer. Pas après.

## Résultats

Tableaux, graphiques, observations.

## Interprétation

Ce que ça veut dire. Ce que ça ne veut pas dire.

## Suite

Prochaine itération, ou abandon, ou pivot.
```

## Règle d'or

Pas de benchmark sans protocole écrit avant. Pas de conclusion sans données brutes commitées dans `docs/notes-de-labo/`. Si une mesure est trop coûteuse à reproduire, elle ne compte pas.

## Outils RAG candidats

Pour la piste RAG local, candidats à tester (Edu et OSS d'abord) :

- **LlamaIndex** (OSS), bonne intégration Markdown, gestion native de l'arborescence.
- **LangChain** (OSS), plus généraliste, parser Obsidian disponible.
- **Haystack** (OSS), pipeline visualisable, bon pour les benchs.
- **Chroma** (OSS), store vectoriel local simple à monter.
- **Qdrant** (OSS, hosted gratuit limité), si on veut tester du multi-tenant.

Le choix se fait piste par piste, en fonction de la question testée. Pas de stack imposée.
