# Stack et prérequis

Inventaire des outils utilisés dans le labo, pourquoi, et quelles versions.

## Outils requis

| Outil | Rôle | Notes |
|---|---|---|
| Claude Code CLI | Moteur de génération | Modèle Opus 4.7 ou Sonnet 4.6 1M, contexte 1M tokens obligatoire pour les clusters denses |
| Git | Traçabilité | Identité globale configurée, signature optionnelle |
| PowerShell 7+ | Shell sous Windows | `pwsh --version` répond |
| bash | Shell sous Linux/macOS | Utilisable aussi sous Windows via Git Bash |
| Obsidian | Consultation, graph view | Pas requis pour la génération en elle-même |

## Outils optionnels

| Outil | Quand | Notes |
|---|---|---|
| LlamaIndex (OSS) | Banc d'essai RAG | Parser Markdown natif, bonne base pour Obsidian |
| LangChain (OSS) | Banc d'essai RAG, alternative | Plus généraliste, plus verbeux |
| Haystack (OSS) | Pipeline RAG visualisable | Bon pour les benchs |
| Chroma (OSS) | Store vectoriel local | Setup minimal |
| Qdrant (OSS) | Store vectoriel hosted ou self-hosted | Plan gratuit limité |
| jq | Manipulation JSON en CLI | Indispensable pour les scripts d'export |
| ripgrep (`rg`) | Recherche rapide dans le vault | Plus rapide que `grep` sur gros vaults |

## Modèles Claude utilisés

| Modèle | ID | Usage |
|---|---|---|
| Opus 4.7 | `claude-opus-4-7` | Génération principale, raisonnement profond |
| Sonnet 4.6 1M | `claude-sonnet-4-6[1m]` | Alternative économique, contexte 1M conservé |
| Haiku 4.5 | `claude-haiku-4-5-20251001` | Tâches courtes, QC léger, exploration |

## Pourquoi 1M de contexte

Un cluster dense, avec son curriculum parent, son template, son exemple canonique et ses sous-thèmes, dépasse facilement 200k tokens en lecture. Le 1M de contexte permet de tout charger en une session sans perte de qualité ni recharge intermédiaire. C'est le seul setup qui tient la promesse de qualité reproductible.

## Coûts indicatifs

| Action | Temps | Coût |
|---|---|---|
| Génération d'un prompt pilote | 2 à 5 minutes | Quasi-nul (texte court) |
| Run d'un prompt pilote sur cluster (40 pages) | 1 à 2 heures | 10 à 30 EUR de tokens API |
| Run complet des 181 clusters via API payée | 18 à 36 mois | 2000 à 5000 EUR total |

Avec un abonnement Claude Max, le coût marginal tombe drastiquement. Les chiffres ci-dessus supposent une facturation API stricte.

## Pas de service cloud propriétaire dans la boucle

Choix volontaire : tout le pipeline de génération doit pouvoir tourner offline, ou en self-hosted, sauf l'appel au modèle Claude lui-même. Pas de Notion, pas d'Airtable, pas de service tiers obligatoire entre la commande et le fichier de sortie. Git seul fait office de persistance.
