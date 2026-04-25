# CLAUDE.md, Instructions projet Pilot Generator

Ce fichier est auto-charge par Claude Code a chaque session ouverte dans ce repertoire. Il contient tout le contexte permanent necessaire pour generer des prompts pilotes exhaustifs sans perte de qualite.

## 1. Mission

Generer des prompts pilotes pour la methode GodMode (Mayday / LE LABO IA) pour 181 clusters du vault Obsidian Second Brain Anthony. Chaque prompt doit etre :

- **Autonome** : pret a etre copie-colle dans Claude Code sans edition supplementaire
- **Exhaustif** : qualite egale au modele `template/EXEMPLE-C2.0.6.md`
- **Conforme** : respect strict des conventions Anthony (FR, zero em-dash, Edu > OSS > Commercial)
- **Tracable** : chaque generation loguee dans `STATUS.md` et `CHANGELOG.md`

## 2. Profil utilisateur (permanent)

Anthony, developpeur en alternance Bac+3 cybersecurite, email madkor122@gmail.com.

Preferences permanentes appliquees a tout livrable :

- Redaction FR uniquement
- Zero tiret cadratin (em-dash `—`), utiliser virgules, parentheses, deux-points
- Priorite outils : **Edu > Open Source > Commercial**
- Pour chaque liste d'outils : minimum 2-3 alternatives triees par fiabilite/reputation
- Mentionner explicitement le type de plan (Edu, gratuit, discount, commercial)
- Toujours indiquer si un outil a un plan GitHub Student Pack, Academic, etc.

## 3. Conventions vault Obsidian cibles

Les prompts generes doivent produire des notes conformes a :

- **Johnny Decimal filesystem** : `00-Meta/`, `10-Cybersecurite/`, `20-Developpement/`, `30-Cloud/`, `40-IA-ML-Data/`, `50-Reseaux/`, `60-Productivite/`, `70-Finance-Admin/`, `80-Vie-Perso/`, `90-Archives/`
- **YAML frontmatter** standard avec minimum : `titre`, `cluster`, `domaine`, `type`, `statut`, `cree`, `revise`, `valide_jusqu_a` (pour contenu date), `tags`, `liens`
- **Nommage des fichiers** : `C<cluster>-<slug-kebab-case>.md` (ex. `C3.2-Azure-Resource-Manager-ARM.md`)
- **Wikilinks** systematiques vers MOC de cluster et cross-domaines
- **Fact-check WebSearch** obligatoire pour donnees datees (versions, prix, URLs)
- **Sources** citees en bas de chaque page

Reference absolue : `curriculums/00-Architecture-Vault-Second-Brain.md` si present, sinon le template `CLAUDE-root-template.md` du vault reel.

## 4. Protocole a executer pour `/nouveau-pilote <ID>`

Etapes imperatives, dans l'ordre :

### Etape 1, Lookup catalogue

```
Read catalogue/clusters.yaml
Extraire la fiche du cluster <ID>
Si introuvable : stopper et afficher la liste des IDs valides du catalogue
```

### Etape 2, Lookup curriculum

```
Identifier le curriculum parent selon le prefixe :
  C1.* -> curriculums/02-Cybersec-Curriculum.md
  C2.* -> curriculums/01-Developer-2026-Curriculum.md
  C3.* -> curriculums/03-Cloud-Curriculum.md
  C4.* -> curriculums/04-AI-ML-Curriculum.md
  C5.* -> curriculums/05-Reseaux-Cert-Roadmap.md

Grep pour trouver la section du cluster (pattern '### <ID>' ou 'C<ID>' dans les tableaux)
Lire les 80-150 lignes autour pour recuperer les sous-themes exhaustifs
```

### Etape 3, Lookup exemple de reference

```
Read template/EXEMPLE-C2.0.6.md
Calibrer la longueur et le niveau de detail sur cet exemple
```

### Etape 4, Lookup template parametrable

```
Read template/PROMPT-PILOT-TEMPLATE.md
Identifier tous les placeholders {{VARIABLE}} a remplir
```

### Etape 5, Generation

Remplir chaque placeholder avec du contenu specifique au cluster. Ne PAS paraphraser depuis l'exemple de reference, mais ADAPTER chaque section au domaine et au sujet du cluster. Les sous-themes doivent etre tires de l'etape 2 (curriculum), pas inventes.

Variables obligatoires a remplir :

- `{{CLUSTER_ID}}` : ex. `C3.2`
- `{{CLUSTER_TITLE}}` : ex. `Azure fundamentals et ecosysteme Microsoft`
- `{{CLUSTER_SLUG}}` : ex. `Azure-Fundamentals-Microsoft` (pour nom de fichier)
- `{{DOMAINE_CODE}}` : ex. `D3`
- `{{DOMAINE_NOM}}` : ex. `Cloud et Infrastructure`
- `{{DOSSIER_VAULT}}` : ex. `30-Cloud` (Johnny Decimal)
- `{{SUJET_GLOBAL}}` : ex. `Cloud et Infrastructure 2026`
- `{{DESCRIPTION_CLUSTER}}` : 3-5 phrases descriptives
- `{{SOUS_THEMES_LISTE}}` : liste Markdown des sous-themes du curriculum
- `{{NB_PAGES_CIBLE}}` : nombre du catalogue (ex. 40)
- `{{CERTIFS_LIEES}}` : liste des certs du catalogue
- `{{TRANSVERSE_LINKS}}` : wikilinks vers autres clusters du catalogue
- `{{BIBLIOGRAPHIE_SPECIFIQUE}}` : livres/YouTube/blogs pour ce cluster (tire du curriculum)
- `{{CHEMIN_VAULT}}` : par defaut `C:\Users\Anthony\Obsidian\SecondBrain-Anthony`, surchargable si l'utilisateur donne un autre chemin
- `{{FACT_CHECK_RULES_SPECIFIQUES}}` : regles de fact-check propres au domaine (ex. cybersec = sources officielles CVE/MITRE/vendor advisories, cloud = docs officielles hyperscaler + release notes, etc.)
- `{{PIEGES_DOMAINE}}` : pieges classiques specifiques au cluster a signaler a Claude Code

### Etape 6, Ecriture

```
Nom du fichier : generated/<DOMAINE>/PROMPT-PILOT-<CLUSTER_ID>-<SLUG>.md
Exemple : generated/D3-Cloud/PROMPT-PILOT-C3.2-Azure-Fundamentals.md
```

### Etape 7, Mise a jour etat

```
Edit STATUS.md :
  Changer la ligne du cluster <ID> : status: todo -> status: generated, generated_at: 2026-04-22, generated_by: <model>

Edit CHANGELOG.md :
  Ajouter une entree en haut de la section "Recent" :
  - 2026-04-22 | C3.2 | generated | <nom fichier> | <model>
```

### Etape 8, Commit Git

```
Proposer a l'utilisateur :
  git add generated/<chemin> STATUS.md CHANGELOG.md
  git commit -m "feat(<DOMAINE>): generate prompt pilote <CLUSTER_ID> <TITLE>"

Ne PAS commit automatiquement, toujours demander.
```

### Etape 9, Proposition QC

A la fin, proposer :
```
"Prompt genere. Veux-tu que je lance le QC automatique ? (/qc <ID>)"
```

## 5. Protocole pour `/qc <ID>`

Execution :

1. Lire `generated/<DOMAINE>/PROMPT-PILOT-<ID>-*.md`
2. Lire `template/CHECKLIST-QC.md`
3. Lancer le subagent `pilot-qc` (voir `.claude/agents/pilot-qc.md`) avec en entree le prompt et la checklist
4. Recevoir un verdict : OK, WARN, FAIL avec detail des criteres non remplis
5. Si OK : mettre a jour STATUS.md `status: generated -> status: qc-ok`
6. Si WARN : afficher les criteres a corriger, proposer `/regen <ID>` ou correction manuelle
7. Si FAIL : marquer `status: qc-fail`, afficher le rapport detaille

## 6. Protocole pour `/etat`

1. Lire `STATUS.md`
2. Compter par statut et par domaine
3. Afficher un tableau ASCII :

```
Domaine           | TODO | GEN | QC-OK | DEPLOYED | TOTAL
D1 Cybersec       |  15  |  2  |   1   |    1     |   19
D2 Dev            | 120  |  5  |   3   |    1     |  129
D3 Cloud          |  11  |  1  |   1   |    0     |   13
D4 IA/ML          |  10  |  0  |   0   |    0     |   10
D5 Reseaux        |  10  |  0  |   0   |    0     |   10
TOTAL             | 166  |  8  |   5   |    2     |  181
```

## 7. Protocole pour `/next`

Regles de priorite :

1. Clusters piliers (priorite `pilier`) avant `standard` avant `deep-cut`
2. Clusters avec cert ciblee proche dans le plan (ex. si AZ-900 prevue dans 1 mois : C3.2 prioritaire)
3. Prerequis d'abord : C2.1.x (CS fund) avant C2.3A.x (Python stack), C1.1 (cybersec fund) avant C1.4 (MITRE), etc.
4. Respect du phasing Anthony (voir curriculums, section "Phasing")
5. Eviter les gros clusters (> 100 pages) en premier, commencer par 30-60 pages

Proposer 3 candidats avec justification courte.

## 8. Protocole pour `/batch <DOMAINE>`

1. Lister les clusters TODO du domaine
2. Proposer un plan ordonne (voir regles `/next`)
3. Demander validation humaine avant de lancer
4. Generer un par un, avec checkpoint apres chaque 3 prompts
5. Mettre a jour STATUS.md et CHANGELOG.md a chaque iteration
6. A la fin du batch : commit Git unique avec message recapitulatif

## 9. Regles de redaction des prompts

Appliquer ces regles a tout prompt pilote genere :

- Jamais de tiret cadratin (em-dash `—`). Utiliser virgule, parentheses, deux-points, ou reformuler.
- Pas d'emojis sauf dans les placeholders de signalisation (checkboxes [ ], indicateurs ⚠️ tolerants si le template d'origine en contient).
- Pas de formulations du type "Je vais...", "Dans cet article on verra...". Ton direct, imperatif ou descriptif.
- Pas de self-promo ou mention de Claude dans le prompt (sauf section outils si pertinent).
- Code blocks avec syntax highlighting explicite (bash, python, yaml, etc.).
- Wikilinks Obsidian : `[[C3.X-slug]]` avec crochets doubles.
- Tous les outils mentionnes doivent avoir leur type entre parentheses : `(OSS)`, `(Edu)`, `(commercial)`, `(gratuit)`, `(GitHub Student Pack)`.

## 10. Anti-hallucination obligatoire

Dans TOUT prompt genere, inclure la phrase :

> Pour chaque fait date (version, prix, URL, date de sortie), executer un WebSearch pour valider en 2026. Si validation impossible ou contradiction, ecrire explicitement `[NON_VERIFIE]` ou `[SOURCES_CONTRADICTOIRES]` et ne pas inventer.

Et la regle :

> Les dates cibles (`valide_jusqu_a`) doivent etre ecrites dans la page generee. Si la donnee est en evolution rapide, mettre un delta court (3-6 mois). Pour le contenu stable (fondamentaux crypto, OSI), delta 12-24 mois.

## 11. Gestion des erreurs

- Si cluster introuvable dans catalogue : afficher la liste des IDs proches (fuzzy match)
- Si curriculum introuvable : erreur explicite + instructions pour synchroniser les curriculums
- Si template introuvable : erreur bloquante, demander a l'utilisateur de reinitialiser depuis `scripts/init.ps1`
- Si conflit dans STATUS.md (ex. cluster deja en `qc-ok`, regeneration demandee) : avertir + demander confirmation explicite

## 12. Session recovery

A chaque demarrage d'une session Claude Code dans ce projet :

1. Lire automatiquement `STATUS.md` et afficher un resume en 3 lignes :
   ```
   Pilot Generator, session du 2026-04-22
   Etat : 8/181 generes, 5 QC-OK, 2 deployes
   Dernier prompt genere : C3.2 Azure Fundamentals (2026-04-21)
   ```

2. Lire `CHANGELOG.md` pour contexte

3. Proposer : "Veux-tu continuer le dernier batch, generer un nouveau cluster, ou consulter l'etat ?"

## 13. Reference exemple canonique

Le fichier `template/EXEMPLE-C2.0.6.md` est le benchmark absolu. Tout prompt genere doit avoir :

- Meme structure de sections (Phase 1 cartographie, Phase 2 fact-check, Phase 3 verification humaine, Phase 4 redaction cluster, Phase 5 debrief, Phase 6 pret a scaler)
- Meme niveau de detail dans les sous-sections
- Meme longueur approximative (+/- 30%)
- Meme format des checkpoints humains
- Meme structure YAML frontmatter proposee

---

*Fin CLAUDE.md projet Pilot Generator. Toute modification doit etre committee avec message explicite.*
