# Anti-hallucination

Règle d'or du labo : aucune donnée datée n'entre dans un cluster sans validation WebSearch. Si on ne peut pas vérifier, on marque, on n'invente pas.

## Phrase obligatoire dans tout prompt généré

Tout prompt pilote produit par `pilot-gen/` doit inclure, mot pour mot ou en variation proche :

> Pour chaque fait daté (version, prix, URL, date de sortie), exécuter un WebSearch pour valider en 2026. Si la validation est impossible ou si les sources se contredisent, écrire explicitement `[NON_VERIFIE]` ou `[SOURCES_CONTRADICTOIRES]` et ne pas inventer.

Cette phrase n'est pas décorative. Elle conditionne le comportement du modèle pendant toute la phase de rédaction.

## Champ `valide_jusqu_a`

Toute page contenant des données datées porte une date limite de validité dans son YAML :

```yaml
valide_jusqu_a: 2026-10-22
```

Choix de la date selon la nature du contenu :

| Type de contenu | Delta typique |
|---|---|
| Versions logicielles, prix de service cloud, URLs de doc officielle | 3 à 6 mois |
| Actualité cybersec, CVE récentes, advisories vendeur | 1 à 3 mois |
| Roadmaps de certifs, parcours pédagogiques | 6 à 12 mois |
| Fondamentaux (modèle OSI, crypto symétrique, principes RSA) | 12 à 24 mois |
| Concepts mathématiques ou théoriques stables | 24 mois et plus |

## Marquage des données non vérifiables

Deux balises explicites :

- `[NON_VERIFIE]` : aucune source crédible n'a pu confirmer l'information dans le délai imparti. Le contenu reste, mais la balise est visible.
- `[SOURCES_CONTRADICTOIRES]` : plusieurs sources fiables divergent. On documente les versions, on ne tranche pas en aveugle.

Exemple :

```markdown
La version stable d'Azure CLI au 2026-04-22 est `2.59.x` [NON_VERIFIE, doc Microsoft inaccessible au moment de la rédaction].
```

## Sources préférentielles par domaine

Quelques règles de priorité pour orienter le fact-check :

- **Cybersec** : MITRE, CVE Mitre, NIST, CISA, advisories vendeur officiels avant blogs.
- **Cloud** : doc officielle de l'hyperscaler, release notes, CHANGELOG du SDK avant articles.
- **Dev** : doc officielle du langage/framework, RFC, PEPs, MDN avant Stack Overflow.
- **Réseaux** : RFC IETF, doc Cisco/Juniper officielle, NetAcad pour la pédagogie.
- **IA/ML** : papiers arXiv, blog officiel de l'éditeur du modèle, doc Hugging Face avant tutoriels tiers.

Si la source primaire n'est pas accessible au moment du run, on marque `[NON_VERIFIE]` et on garde la date du run.

## Auto-correction post-rédaction

À la fin d'un run de génération, l'auteur (humain ou agent) doit pouvoir grep le vault pour `[NON_VERIFIE]` et `[SOURCES_CONTRADICTOIRES]` et obtenir la liste des points à revisiter. C'est volontaire. Mieux vaut une carence visible qu'une hallucination invisible.
