# obsidian-Brain

Labo perso de construction et de test de clusters Obsidian. L'idée tient en une phrase : arrêter de jeter le savoir à chaque requête IA, le compiler une fois, proprement, dans un format navigable, et le réinjecter ensuite partout où ça compte.

Ce dépôt n'est pas un vault. C'est l'usine qui en fabrique.

---

## D'où ça vient

Le constat de départ tient en trois mots : RAG jetable partout. À chaque question on recontextualise, on re-embedde, on re-retrieve. Aucun compounding. Le savoir s'évapore entre deux conversations.

J'ai voulu inverser le flux. Compiler à froid, une bonne fois, des clusters denses et fact-checkés. Les ranger dans un format lisible à la main (Obsidian, Markdown brut, YAML), pour qu'ils restent utilisables même si demain je change de pipeline IA, de modèle, ou de stack RAG. Le vault grossit, il ne se perd pas.

L'autre intuition, plus discrète : un cluster bien structuré, navigable en graph view, vaut mieux qu'un dump vectorisé pour beaucoup de cas d'usage. Reste à le prouver. C'est précisément le job du labo.

---

## Ce qu'on teste ici

Quatre pistes principales, toutes ouvertes, toutes mesurables :

1. **RAG local sur vault** : un cluster bien charpenté bat-il un index naïf monté sur dump brut ? Sur quels types de questions ? À quel coût ?
2. **Source de vérité pour projets web** : on donne le vault à lire à un agent codeur avant qu'il code. Est-ce que ça réduit les bugs au premier essai ? De combien ?
3. **Mémoire d'erreurs locale** : un sous-vault dédié aux problèmes rencontrés, post-mortems, solutions. Requêtable par un agent quand un bug ressemble à un truc déjà vu. Test du TTR moyen avant/après.
4. **Conversion multi-format vers `.obsidian`** : PDF, HTML, dumps Notion, exports Slack, transcripts YouTube. Quel pipeline préserve le mieux la sémantique au moment de re-clusteriser ?

Les protocoles, les setups reproductibles et les résultats vivent dans le wiki, pas ici.

---

## Structure du dépôt

```
obsidian-Brain/
├── pilot-gen/        Sous-projet, usine a prompts pilotes
├── docs/             Notes de labo, sources externes, captures
│   └── wiki/         Source des pages du wiki GitHub
└── README.md
```

### `pilot-gen/`

Premier moteur opérationnel. On lui donne un identifiant de cluster, il sort un prompt pilote prêt à exécuter, calibré sur un standard de qualité reproductible. 181 clusters au catalogue, répartis sur cinq domaines (cybersec, dev, cloud, IA/ML, réseaux). Chaque run produit un sous-vault Obsidian autonome. Persistance Git, statut courant dans `pilot-gen/STATUS.md`, journal dans `pilot-gen/CHANGELOG.md`.

Tout le détail opérationnel (installation, commandes, protocoles de génération et de QC) est documenté dans le wiki.

### `docs/`

Mémoire externe du labo. Sources de référence, prompts d'inspiration, screenshots de graphes, captures de tests RAG, notes de protocole. Volontairement séparé du code : ça doit pouvoir survivre à une refonte de l'usine.

`docs/wiki/` contient la source Markdown des pages du wiki GitHub, versionnée avec le code. Voir [Sync-Wiki](docs/wiki/Sync-Wiki.md) pour la procédure de publication.

---

## Wiki

Toute la documentation opérationnelle vit sur le wiki GitHub :

- [Home](docs/wiki/Home.md)
- [Installation](docs/wiki/Installation.md)
- [Conventions vault](docs/wiki/Conventions-Vault.md)
- [Règles de rédaction](docs/wiki/Regles-Redaction.md)
- [Anti-hallucination](docs/wiki/Anti-Hallucination.md)
- [pilot-gen, commandes](docs/wiki/Pilot-Gen-Commandes.md)
- [pilot-gen, protocoles](docs/wiki/Pilot-Gen-Protocoles.md)
- [Banc d'essai](docs/wiki/Banc-Essai.md)
- [Stack et prérequis](docs/wiki/Stack.md)
- [Roadmap](docs/wiki/Roadmap.md)
- [Sync wiki](docs/wiki/Sync-Wiki.md)

---

## Licence

MIT.
