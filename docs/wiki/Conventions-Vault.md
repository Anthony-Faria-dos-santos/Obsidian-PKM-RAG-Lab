# Conventions vault

Standard appliqué à tout cluster produit dans le labo. Objectif : portabilité d'un vault à l'autre, exploitabilité par n'importe quel pipeline en aval, lisibilité humaine garantie.

## Filesystem, Johnny Decimal

```
00-Meta/
10-Cybersecurite/
20-Developpement/
30-Cloud/
40-IA-ML-Data/
50-Reseaux/
60-Productivite/
70-Finance-Admin/
80-Vie-Perso/
90-Archives/
```

Chaque cluster vit sous le domaine correspondant. Pas d'arborescence libre. Si une note ne rentre nulle part, c'est qu'elle relève de `00-Meta/` ou qu'elle est mal cadrée.

## YAML frontmatter

Champs minimaux obligatoires sur chaque note :

```yaml
---
titre: "Azure Resource Manager (ARM)"
cluster: "C3.2"
domaine: "D3-Cloud"
type: "concept | tuto | reference | post-mortem"
statut: "draft | revise | valide"
cree: 2026-04-22
revise: 2026-04-22
valide_jusqu_a: 2026-10-22
tags: [azure, iac, arm]
liens: ["[[C3.2-Azure-Fundamentals]]", "[[C3.5-IaC-Terraform]]"]
---
```

Le champ `valide_jusqu_a` est requis dès que la page contient des données datées (versions, prix, URLs, dates de release). Delta court (3 à 6 mois) pour le contenu mouvant, plus long (12 à 24 mois) pour les fondamentaux stables.

## Nommage des fichiers

Format strict :

```
C<cluster>-<slug-kebab-case>.md
```

Exemples :

- `C3.2-Azure-Resource-Manager-ARM.md`
- `C1.4-MITRE-ATTACK-Reconnaissance.md`
- `C2.3A-Python-FastAPI-Async.md`

Slug en kebab-case, sans accent, sans espace, sans caractère spécial autre que le tiret.

## Wikilinks

Toujours utiliser la syntaxe Obsidian native `[[...]]`. Jamais d'URL interne en dur, jamais de chemin relatif.

```markdown
Voir aussi [[C3.5-IaC-Terraform]] et [[C3.2-MOC]].
```

Chaque cluster a sa MOC (Map Of Content) nommée `C<cluster>-MOC.md`, qui sert de point d'entrée et de hub de wikilinks.

## Cross-domaines

Les liens cross-domaines sont encouragés. Un cluster cybersec peut renvoyer vers un cluster cloud ou réseau quand le sujet le justifie. Le but est de densifier le graph view.

## Sources

Chaque page se termine par un bloc `## Sources` listant les références utilisées. Format minimal :

```markdown
## Sources

- Doc officielle Azure ARM, https://learn.microsoft.com/azure/azure-resource-manager/, consultée le 2026-04-22.
- Microsoft Learn, parcours AZ-104, https://learn.microsoft.com/credentials/certifications/azure-administrator/, consulté le 2026-04-22.
```

Date de consultation systématique. Si tu cites un livre, ISBN ou édition. Si tu cites une vidéo, timestamp si possible.
