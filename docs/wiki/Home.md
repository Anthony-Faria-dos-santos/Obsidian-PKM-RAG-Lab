# obsidian-Brain, wiki

Documentation opérationnelle du labo. Le README à la racine sert de présentation. Ici on rentre dans le concret : comment on installe, comment on génère, comment on teste, à quoi on tient niveau qualité.

## Plan du wiki

### Pour démarrer

- [Installation](Installation.md), prérequis et bootstrap.
- [Stack](Stack.md), outils utilisés, versions, raisons.

### Standards et règles

- [Conventions vault](Conventions-Vault.md), Johnny Decimal, YAML, nommage, wikilinks.
- [Règles de rédaction](Regles-Redaction.md), FR, typographie, hiérarchie outils.
- [Anti-hallucination](Anti-Hallucination.md), fact-check WebSearch, marquage des données non vérifiées.

### pilot-gen, le générateur de prompts pilotes

- [Commandes slash](Pilot-Gen-Commandes.md), `/nouveau-pilote`, `/qc`, `/etat`, `/next`, `/batch`, `/liste-restants`.
- [Protocoles internes](Pilot-Gen-Protocoles.md), les neuf étapes de génération, le QC, la session recovery.

### Banc d'essai

- [Banc d'essai](Banc-Essai.md), pistes de test, métriques, format des notes de labo.

### Vie du dépôt

- [Roadmap](Roadmap.md).
- [Sync wiki](Sync-Wiki.md), comment pousser ces pages vers le wiki GitHub.

## Convention d'écriture du wiki

Pages courtes, ciblées, une page par sujet. Les procédures vont dans le wiki, jamais dans le README. Tout exemple de commande doit être copiable tel quel. Toute donnée datée porte sa date de validité et sa source.
