# Sync wiki

Le wiki GitHub est un dépôt Git séparé du dépôt principal. Pour garder le wiki versionné en même temps que le code, on stocke la source dans `docs/wiki/` et on synchronise vers le wiki GitHub à la demande.

## Pourquoi cette gymnastique

Le wiki GitHub est sympa à consulter, mais son dépôt n'apparaît pas dans le repo principal. En gardant les sources dans `docs/wiki/`, on a :

- Versionnement unique avec le reste du dépôt.
- Revue par PR possible avant publication.
- Possibilité de régénérer le wiki entier en cas de perte.

## Première publication

Le wiki GitHub doit être initialisé une fois manuellement. Aller sur :

```
https://github.com/<owner>/obsidian-Brain/wiki
```

Cliquer sur "Create the first page", écrire deux lignes, sauvegarder. Le dépôt wiki existe désormais.

## Cloner le dépôt wiki

```bash
git clone https://github.com/<owner>/obsidian-Brain.wiki.git wiki
```

Le `.wiki.git` à la fin n'est pas une faute de frappe. C'est l'URL réelle du dépôt wiki.

## Synchroniser depuis `docs/wiki/`

Méthode simple, à la main, depuis la racine du dépôt principal :

```bash
# Copier les pages
cp docs/wiki/*.md ../obsidian-Brain.wiki/

# Pousser
cd ../obsidian-Brain.wiki
git add .
git commit -m "wiki: sync from docs/wiki/ at $(date +%Y-%m-%d)"
git push
```

## Convention de nommage

Le wiki GitHub mappe les noms de fichiers sur les URLs des pages. Quelques règles :

- `Home.md` correspond à la page d'accueil.
- Les espaces dans le titre sont remplacés par des tirets dans l'URL.
- Pas d'accents dans les noms de fichiers, GitHub ne les gère pas toujours bien dans les URLs. On utilise `Regles-Redaction.md`, pas `Règles-Rédaction.md`.
- Les liens entre pages se font sans extension : `[Installation](Installation)`.

À noter : les liens dans `docs/wiki/` sont écrits avec l'extension `.md` pour que la prévisualisation locale et sur GitHub fonctionne. Le script de sync (à venir) les nettoiera au moment de pousser vers le wiki.

## Script de sync, à venir

Ouvert dans la roadmap : un script PowerShell `scripts/sync-wiki.ps1` qui :

1. Vérifie que le dépôt wiki existe localement.
2. Copie les fichiers `docs/wiki/*.md` en retirant l'extension `.md` des liens internes.
3. Commit et push automatique avec un message daté.
4. Affiche le diff avant push, pour relecture humaine.

Tant que ce script n'existe pas, on fait le sync à la main avec les commandes ci-dessus.
