# GUIDE-USAGE, pilot-generator de bout en bout

Guide operationnel pour passer d'un cluster catalogue a des pages produites dans ton vault Obsidian. A lire une fois, puis a garder en reference.

---

## 1. Vue d'ensemble en 30 secondes

Trois couches, trois roles distincts :

```
+------------------+     +-------------------+     +--------------------+
|  pilot-generator |     |  PROMPT-PILOT-<ID>|     |  Vault Obsidian    |
|  (ce projet)     | ==> |  (fichier genere) | ==> |  SecondBrain...    |
|                  |     |                   |     |                    |
| - Catalogue      |     | - Brief cluster   |     | - Pages .md        |
| - Template       |     | - 6 phases        |     | - MOC              |
| - Slash commands |     | - 3 checkpoints   |     | - Frontmatter YAML |
| - QC             |     | - Sources         |     |                    |
+------------------+     +-------------------+     +--------------------+
      Claude Code             Claude Code               Toi, avec Claude
      (Opus 4.7)              (Opus 4.7 ou              Code ou Sonnet 1M
                              Sonnet 4.6 1M)            en lecture
```

Ce que fait `pilot-generator` : il **ecrit les promptes-pilotes** qui produiront les pages du vault. Il n'ecrit pas les pages du vault directement. C'est l'outil amont, pas l'executant final.

Ce que les prompts-pilotes font : une fois executes dans une session Claude Code separee, ils guident Claude a travers un protocole en 6 phases pour produire 30 a 200 pages Markdown conformes aux conventions du vault, avec 3 arrets imposes pour ta validation humaine.

---

## 2. Pre-requis, ce qui doit exister avant

### Cote machine

- Windows avec PowerShell 7+ (ou 5.1 par defaut)
- Claude Code CLI installe et authentifie (`claude doctor` passe)
- Git installe et configure
- Acces au vault Obsidian 

### Cote modeles

- Opus 4.7 pour la generation de prompts-pilotes (raisonnement)
- Sonnet 4.6 avec fenetre 1M pour executer les prompts-pilotes longs dans le vault
- WebSearch active dans Claude Code

### Cote contenu du projet

Tous ces fichiers sont deja presents dans `pilot-generator/` :

- `catalogue/clusters.yaml` : 179 clusters avec titres reels, importance, pages cibles, certs
- `curriculums/*.md` : les 5 curriculums sources (tu les as fournis)
- `template/PROMPT-PILOT-TEMPLATE.md` : template parametrable avec 19 placeholders
- `template/EXEMPLE-C2.0.6.md` : le pilote de reference (gold standard, 21 KB)
- `template/CHECKLIST-QC.md` : 27 criteres de QC en 6 sections
- `.claude/commands/*.md` : les slash commands
- `.claude/agents/*.md` : les subagents `pilot-generator` et `pilot-qc`
- `STATUS.md` : tableau de bord (179 clusters, C2.0.6 en `generated`)

---

## 3. Workflow standard

```
 [1] Setup initial (une seule fois)
       |
       v
 [2] Choisir un cluster : /etat  ou  /next
       |
       v
 [3] Generer le prompt-pilote : /nouveau-pilote <ID>
       |  => ecrit generated/D<N>/PROMPT-PILOT-<ID>-<Slug>.md
       |  => marque STATUS.md en "generated"
       |  => log CHANGELOG.md
       v
 [4] Valider la qualite : /qc <ID>
       |  => ecrit generated/D<N>/qc/QC-<ID>-<date>.md
       |  => verdict OK, WARN, ou FAIL
       |  => si OK : marque STATUS.md en "qc-ok"
       |  => si FAIL : retour a [3] apres correction
       v
 [5] Git commit (propose par la commande)
       |
       v
 [6] Executer le prompt-pilote dans le vault
       |  => nouvelle session Claude Code, cd vault
       |  => coller le contenu du prompt-pilote
       |  => Claude passe par les 6 phases
       |  => 3 checkpoints : architecture, pilier, consolidation
       |  => tu valides ou corriges a chaque arret
       v
 [7] Marquer deployed : edit manuel STATUS.md ou future commande
```

---

## 4. Setup initial, une seule fois

### 4.1 Placer le projet a son emplacement final

Le projet vit actuellement dans le dossier output Cowork. Copie-le vers un emplacement stable :

```powershell
# Destination recommandee
$dst = "C:\Users\{USER}\Projects\pilot-generator"
New-Item -ItemType Directory -Path $dst -Force | Out-Null

# Copie depuis le dossier du projet output
Copy-Item -Path "<chemin-projet-cloné>\pilot-generator\*" -Destination $dst -Recurse -Force
```

### 4.2 Lancer le bootstrap

```powershell
cd C:\Users\{USER}\Projects\pilot-generator
.\scripts\init.ps1 -VaultPath "C:\Users\{USER}\{VAULT_NAME}" -SkipCurriculums
```

Le flag `-SkipCurriculums` est correct ici, les curriculums sont deja dans `curriculums/` (tu les as fournis). Si un jour tu veux les synchroniser depuis une source externe, retire le flag.

Ce que fait `init.ps1` :

- Verifie la structure et les fichiers cles (si un manque : arret avec liste)
- Initialise Git et fait un premier commit `chore: bootstrap pilot-generator project`
- Ecrit `PILOT_GENERATOR_VAULT_PATH` dans `.claude/settings.local.json`

### 4.3 Menage d'un artefact

Le fichier `catalogue/real_ids.json` est un reste de la regeneration du catalogue. Tu peux le supprimer manuellement depuis l'Explorateur (Cowork ne peut pas le faire, permission denied). Il ne gene rien mais clutter le dossier.

### 4.4 Lancer Claude Code

```powershell
cd C:\Users\{USER}\Projects\pilot-generator
claude --model claude-opus-4-7
```

Dans la session, verifie que les slash commands sont detectes :

```
/etat
```

Tu dois voir un tableau de bord avec 179 clusters, C2.0.6 en `generated`.

---

## 5. Utilisation quotidienne

Toutes les commandes se lancent **depuis la session Claude Code ouverte dans `pilot-generator/`**. Pas depuis le vault.

### 5.1 Voir ou j'en suis : `/etat`

Affiche la synthese du catalogue : combien par domaine, combien par statut, prochains clusters logiques. C'est le tableau de bord. Consommee lecture seule de `STATUS.md` et `catalogue/clusters.yaml`.

### 5.2 Choisir le prochain cluster : `/next`

Propose 3 clusters a generer en priorite, scoring heuristique :

- +5 si importance `pilier`
- +3 si certification visee proche (Sec+, CCNA, etc.)
- +3 si prerequis transverse d'autres clusters
- +2 si delta_validation court (contenu qui bouge vite)
- +1 si pages_target <= 40 (quick win pour amorcer)

Output : 3 IDs avec justification courte. Tu choisis.

### 5.3 Lister ce qui reste : `/liste-restants [domaine]`

- `/liste-restants` : tous les `todo` et `qc-fail`, groupes par domaine
- `/liste-restants D1` : filtre sur le domaine D1 Cybersec
- `/liste-restants D2 pilier` : filtre sur D2 + importance pilier

### 5.4 Generer un prompt-pilote : `/nouveau-pilote <ID>`

Exemple :

```
/nouveau-pilote C1.1
```

Deroule :

1. Lookup `catalogue/clusters.yaml` pour C1.1
2. Verifie que le statut est `todo` ou `qc-fail`, sinon abort
3. Lookup le curriculum source correspondant (C1.* -> 02-Cybersec-Curriculum.md)
4. Lit `template/EXEMPLE-C2.0.6.md` pour calibrer la forme
5. Lit `template/PROMPT-PILOT-TEMPLATE.md` et remplace les 19 placeholders
6. Delegue au subagent `pilot-generator` pour la generation
7. Ecrit `generated/D1-Cybersec/PROMPT-PILOT-C1.1-Fondamentaux-Cybersec.md`
8. Met a jour `STATUS.md` : C1.1 passe de `todo` a `generated`
9. Log dans `CHANGELOG.md` : `feat(pilot): C1.1 Fondamentaux-Cybersec (12k mots, 20 sous-themes, 15 sources)`
10. Propose un commit Git : `feat(pilot): C1.1 Fondamentaux-Cybersec`
11. Propose de lancer `/qc C1.1`

Duree typique : 2 a 5 minutes sur Opus 4.7 selon la taille du cluster.

### 5.5 Valider la qualite : `/qc <ID>`

Exemple :

```
/qc C1.1
```

Deroule :

1. Delegue au subagent `pilot-qc` en mode lecture seule
2. Evalue les 27 criteres de `template/CHECKLIST-QC.md`
3. Ecrit le rapport dans `generated/D1-Cybersec/qc/QC-C1.1-20260422.md`
4. Verdict :
   - Tous OK -> `qc-ok` dans STATUS.md
   - Un FAIL -> `qc-fail`, retour a `/nouveau-pilote C1.1` apres relecture rapport
   - Mixte OK/WARN -> `qc-ok` avec notes (acceptable)

Duree typique : 30 a 60 secondes.

### 5.6 Traiter plusieurs clusters d'affilee : `/batch <domaine> [N]`

Exemple :

```
/batch D1 5
```

Genere et QC les 5 prochains clusters `todo` de D1 en sequence, avec arret immediat sur premier FAIL. Log detaille dans CHANGELOG.md.

A utiliser avec moderation, surtout au debut. Preferer le one-by-one tant que tu n'es pas 100% confiant dans la qualite du template.

---

## 6. Executer un prompt-pilote dans le vault

C'est l'etape finale, faite dans une session Claude Code **separee**. Elle est deliberement manuelle pour te forcer a voir ce qui se passe.

### 6.1 Ouvrir une session dans le vault

```powershell
cd C:\Users\{USER}\{VAULT_NAME}
claude --model claude-sonnet-4-6
# ou claude-opus-4-7 si le cluster est complexe
```

Sonnet 4.6 avec 1M est recommande pour les clusters qui genereront > 50 pages (fenetre contextuelle necessaire pour garder toute la coherence).

### 6.2 Alimenter Claude avec le prompt-pilote

Deux options, equivalentes :

**Option A, copier-coller** :

1. Ouvrir `C:\Users\{USER}\Projects\pilot-generator\generated\D1-Cybersec\PROMPT-PILOT-C1.1-Fondamentaux-Cybersec.md` dans un editeur
2. Copier tout le contenu
3. Le coller dans le chat Claude Code

**Option B, reference directe** (plus propre) :

Dans le chat Claude Code, taper :

```
Lis le fichier C:\Users\{USER}\Projects\pilot-generator\generated\D1-Cybersec\PROMPT-PILOT-C1.1-Fondamentaux-Cybersec.md
et execute le protocole qu'il decrit.
```

### 6.3 Les 3 checkpoints humains

Claude va suivre les 6 phases du protocole et **s'arreter 3 fois** pour attendre ton GO :

- **Checkpoint 1 apres Phase 2** : Claude presente l'architecture proposee (liste des sous-themes, plan des pages). Tu valides ou tu corriges l'architecture avant qu'il commence a ecrire.
- **Checkpoint 2 apres Phase 3** : Claude a ecrit la page pilier (la page centrale du cluster, 80 a 150 lignes). Tu la lis et valides la qualite/orientation avant qu'il generalise aux autres pages.
- **Checkpoint 3 apres Phase 5** : Claude a tout ecrit et presente le plan de consolidation (MOC, cross-links, tags). Tu valides avant la phase finale de polish.

Ces arrets sont imposes dans le prompt-pilote. Ne les saute pas, ils sont la pour eviter de consommer 100k tokens sur une architecture fausse.

### 6.4 Apres execution reussie

Retour dans la session `pilot-generator/` :

1. Edit manuel de `STATUS.md` : C1.1 passe de `qc-ok` a `deployed`, ajouter la date
2. Entree CHANGELOG.md : `deploy(pilot): C1.1 Fondamentaux-Cybersec, 22 pages creees dans 10-Cybersecurite/C1.1-...`
3. Commit Git

Une future commande `/deployed <ID>` automatisera ces trois etapes.

---

## 7. Fichiers cles et leur role

| Fichier | Quand le consulter | Quand l'editer |
|---|---|---|
| `STATUS.md` | A chaque `/etat`, `/next` | Auto par commandes, edit manuel pour `deployed` |
| `catalogue/clusters.yaml` | Quand tu veux voir la structure d'un cluster | Rare, si tu ajoutes ou fusionnes un cluster |
| `CHANGELOG.md` | Historique chronologique | Auto par commandes, jamais manuel |
| `curriculums/*.md` | Pour retrouver un cluster dans son contexte | Jamais, lecture seule |
| `template/PROMPT-PILOT-TEMPLATE.md` | Pour comprendre la structure des prompts | Rare, si tu ameliores le template |
| `template/EXEMPLE-C2.0.6.md` | Reference de calibration | Jamais, lecture seule |
| `template/CHECKLIST-QC.md` | Comprendre ce que QC verifie | Rare, si tu ajoutes un critere |
| `generated/D<N>/PROMPT-PILOT-*.md` | Sortie a executer dans le vault | Jamais apres generation |
| `generated/D<N>/qc/QC-*.md` | Rapport de QC | Jamais |
| `.claude/settings.local.json` | Verifier VaultPath | Si tu changes de vault |

---

## 8. Conseils et FAQ

### Q : Par ou commencer ?

R : Fais tourner `/next` et prends la suggestion la plus haute. En general ce sera un cluster pilier d'un domaine ou il n'y a pas encore de `qc-ok`. Pour un premier tour, C1.1 (Fondamentaux Cybersec), C2.1 (Clean Code) ou C3.2 (Azure Fundamentals) sont de bons demarrages.

### Q : Quel modele utiliser ?

R :

- Generation du prompt-pilote (dans `pilot-generator/`) : **Opus 4.7**, raisonnement fort necessaire pour produire 10k-15k mots structures.
- Execution du prompt-pilote (dans le vault) : **Sonnet 4.6 avec fenetre 1M** si cluster > 50 pages, sinon **Opus 4.7** suffit.

### Q : Pourquoi C2.0.6 est deja en `generated` ?

R : C'est le pilote de reference, deja produit manuellement par toi. Il sert de gold standard pour calibrer les autres generations (le fichier `template/EXEMPLE-C2.0.6.md`). Ne le regenere pas.

### Q : Le bootstrap a echoue, fichiers manquants ?

R : `scripts/init.ps1` imprime la liste des fichiers manquants. Verifier que tout a bien ete copie depuis le dossier output Cowork. Les 9 fichiers cles sont : `CLAUDE.md`, `README.md`, `STATUS.md`, `CHANGELOG.md`, `.gitignore`, `catalogue/clusters.yaml`, `catalogue/schema.md`, `template/PROMPT-PILOT-TEMPLATE.md`, `template/CHECKLIST-QC.md`.

### Q : Un cluster n'existe pas dans `clusters.yaml`, comment l'ajouter ?

R :

1. Ajouter l'entree dans `catalogue/clusters.yaml` en respectant le schema de `catalogue/schema.md`
2. Verifier qu'il est bien dans le curriculum source correspondant, sinon mettre a jour le curriculum aussi
3. Relancer `/etat` pour confirmer la prise en compte

### Q : Deux clusters sont redondants, comment les fusionner ?

R :

1. Choisir l'ID survivant (plus petit numero)
2. Editer `catalogue/clusters.yaml` : fusionner les metadonnees (certs, transverse, pages_target=max)
3. Mettre l'ID elimine en statut `merged` (ajouter ce statut au schema)
4. Log dans CHANGELOG.md : `chore(catalogue): merge C2.5.3 into C2.5.2`

### Q : Quel est l'ecart entre catalogue et curriculums ?

R : Le catalogue contient 179 clusters, les curriculums contiennent 179 clusters distincts (D1:17, D2:129, D3:13, D4:10, D5:10). Alignement exact apres regeneration le 2026-04-22. Si tu modifies un curriculum, relancer la regeneration du catalogue (script Python disponible dans l'historique, a reintegrer dans `scripts/` si besoin recurrent).

### Q : Claude Code refuse une ecriture ?

R : Verifie `.claude/settings.local.json`. Les deny explicites sont : `Write(curriculums/**)`, `Write(template/**)`, `Edit(template/*.md)`. Ces verrous sont deliberes pour proteger les sources de verite. Contourner en supprimant temporairement la regle, puis la remettre.

### Q : Les pages generees dans le vault n'ont pas le bon frontmatter Obsidian ?

R : Relire la Phase 6 du prompt-pilote (consolidation), elle specifie le frontmatter YAML requis : `cluster`, `domaine`, `statut`, `importance`, `valide_jusqu_a`, `tags`, `aliases`, `sources_count`. Si absent, completer manuellement et ouvrir un ticket pour ameliorer le template.

### Q : Je veux regenerer tous les prompts parce que j'ai ameliore le template ?

R :

1. Editer `template/PROMPT-PILOT-TEMPLATE.md` (attention, deny par default, lever le verrou)
2. Pour chaque cluster deja `qc-ok` ou `deployed` : rebasculer en `todo`, relancer `/nouveau-pilote <ID>`
3. Ne pas regenerer ce qui est deja `deployed` sans raison forte (pages dans vault a resynchroniser)

### Q : Le vault a change, comment suivre ?

R : Le vault est la source de verite de l'etat final (pages). Le `pilot-generator` est amont et ne lit pas le vault en temps reel. Pour reconcilier : commande future `/scan-vault` qui comparera `deployed` STATUS.md avec les dossiers reels dans `C:\Users\madko\Sandbox-lite\SecondBrain-Anthony\<folder>`.

---

## 9. Checklist du tout premier run

Premier cluster, suivre cette sequence de bout en bout pour valider que tout marche :

1. [ ] `cd C:\Users\{USER}\Projects\pilot-generator`
2. [ ] `.\scripts\init.ps1 -VaultPath "C:\Users\{USER}\{VAULT_NAME}" -SkipCurriculums`
3. [ ] `claude --model claude-opus-4-7`
4. [ ] `/etat` (verifier 179 clusters, C2.0.6 en generated)
5. [ ] `/next` (choisir un pilier simple, ex C3.2 Azure-Fundamentals)
6. [ ] `/nouveau-pilote C3.2`
7. [ ] Verifier `generated/D3-Cloud/PROMPT-PILOT-C3.2-*.md` existe
8. [ ] `/qc C3.2`
9. [ ] Verifier verdict OK (ou corriger si WARN/FAIL)
10. [ ] Accepter le commit Git propose
11. [ ] Ouvrir une seconde session Claude Code : `cd <vault> && claude --model claude-sonnet-4-6`
12. [ ] Executer le prompt-pilote, respecter les 3 checkpoints
13. [ ] Verifier les pages produites dans `<vault>\30-Cloud\C3.2-Azure-Fundamentals\`
14. [ ] Retour dans `pilot-generator/`, edit STATUS.md : C3.2 -> `deployed`
15. [ ] Commit final : `deploy(pilot): C3.2 Azure-Fundamentals, X pages`

Si les 15 etapes passent sans friction, le workflow est valide. Tu peux alors monter en cadence.

---

## 10. Backport dynamique des regles du vault

### Principe

Les regles qui encadrent la generation des prompts-pilotes vivent dans le **vault**, pas dans le projet pilot-generator :

| Fichier vault | Role | Injecte dans le prompt sous |
|---|---|---|
| `<vault>/CLAUDE.md` | Regles editoriales (francais, anti-cadratin, Edu > OSS > Commercial, conventions) | `{{EDITORIAL_RULES_VAULT}}` |
| `<vault>/00-Meta/Learnings.md` | Apprentissages cumules des runs precedents | `{{LEARNINGS_CUMULES}}` |
| `<vault>/00-Meta/Schema.md` | Specification integrale du frontmatter YAML | `{{SCHEMA_YAML_VAULT}}` |

A chaque appel `/nouveau-pilote <ID>`, la commande :

1. Verifie que `PILOT_GENERATOR_VAULT_PATH` est defini et que les 3 fichiers existent et ne sont pas vides
2. Les lit **en entier**, tels quels
3. Les injecte dans les trois blocs `<!-- BEGIN ... -->` / `<!-- END ... -->` du PROMPT-PILOT-TEMPLATE.md
4. Ecrit le resultat dans `generated/D<N>/PROMPT-PILOT-<ID>-<Slug>.md`

Le prompt genere embarque donc la photo a l'instant T des regles du vault. La date du snapshot est ecrite en en-tete du prompt et dans le CHANGELOG, pour reproductibilite.

### Consequence pratique

**Tu n'as plus jamais a editer le template du pilot-generator pour propager une regle.** Si tu ajoutes une nouvelle entree dans `<vault>/00-Meta/Learnings.md`, elle sera automatiquement injectee dans le prochain prompt-pilote genere, sans action supplementaire de ta part.

### Boucle de retour via Phase 6 du prompt-pilote

Chaque run de pilote produit un debrief dans `<vault>/00-Meta/Debriefs/Debrief-<ID>.md` qui contient une section **Nouveaux apprentissages a pousser dans Learnings.md**. Le protocole demande explicitement a Claude de formuler ces apprentissages au format standard (Observation / Conclusion / Application) et de les ajouter a `<vault>/00-Meta/Learnings.md` avant la fin du run.

Consequence : le vault capitalise les lecons du run N, et le run N+1 en beneficie automatiquement.

### En cas d'erreur

Si `/nouveau-pilote` echoue avec :

```
Erreur : PILOT_GENERATOR_VAULT_PATH non defini.
```

Relancer `scripts/init.ps1` avec le bon VaultPath ou editer `.claude/settings.local.json` manuellement.

Si l'erreur est :

```
Erreur : vault incomplet. Fichier <chemin> absent ou vide.
```

Cela signifie qu'un des 3 fichiers source du vault manque. Cas typiques :

- **Premier run ever**, Learnings.md n'existe pas encore : creer un squelette minimal `# Apprentissages cumules des runs\n\n(Aucun apprentissage encore, premier run en preparation.)` et relancer.
- **Vault recemment deplace** : verifier le chemin dans settings.local.json.
- **Erreur de structure** : Schema.md doit etre dans `00-Meta/`, pas a la racine.

### Evolution possible (a faire si Learnings.md depasse 15 entrees)

Si Learnings.md devient trop volumineux, passer au **Niveau 2** : tagger chaque entree avec metadata `Priorite: must|should|nice`, `Applicable_a: [all, D1, D2, ...]`, `Statut: active|obsolete`, `Valide_jusqu_a: YYYY-MM-DD`. La commande filtrera automatiquement pour n'injecter que les apprentissages pertinents au cluster en cours de generation. Non necessaire tant qu'on est sous 15 entrees.

---

## 11. Ce qui reste a construire (optionnel)

Idees d'amelioration non bloquantes, classees par utilite :

1. Commande `/deployed <ID>` pour automatiser le passage `qc-ok` -> `deployed`
2. Commande `/scan-vault` pour reconcilier STATUS.md avec l'etat reel du vault
3. Commande `/sync-catalogue` pour regenerer `clusters.yaml` depuis les curriculums edites
4. Hook pre-commit Git qui refuse un commit si STATUS.md et CHANGELOG.md sont desynchronises
5. Metrique : dashboard HTML genere depuis STATUS.md avec graphe d'avancement par domaine
6. Scheduled task : `/etat` quotidien avec rapport email ou notification Discord

Aucun de ces elements n'est necessaire pour commencer. Ils viennent au fur et a mesure des besoins ressentis.

---

Derniere mise a jour : 2026-04-27
