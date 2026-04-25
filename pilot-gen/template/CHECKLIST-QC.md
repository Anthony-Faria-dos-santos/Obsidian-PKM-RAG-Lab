# CHECKLIST-QC, Criteres de controle qualite d'un prompt pilote

Utilise par le subagent `pilot-qc` pour evaluer un prompt pilote genere. Chaque critere est note OK / WARN / FAIL. Le verdict final :

- **OK** global : tous les criteres OK
- **WARN** global : au moins un WARN, aucun FAIL (corrections mineures possibles)
- **FAIL** global : au moins un FAIL (regeneration recommandee)

---

## Section A, Conformite structurelle

| # | Critere | OK | WARN | FAIL |
|---|---|---|---|---|
| A1 | Le prompt a bien 6 phases (Cartographie, Fact-check, Redaction 8 pages, Generation complete, Debrief, Pret a scaler) | Oui | Manque 1 phase | Manque 2+ |
| A2 | 3 checkpoints humains explicites presents | Oui | 2 | 1 ou 0 |
| A3 | YAML frontmatter du template reproduit pour les notes generees | Oui | Partiel | Absent |
| A4 | Nom de fichier conforme : `PROMPT-PILOT-C<ID>-<Slug>.md` | Oui | Legere divergence | Non conforme |
| A5 | Dossier cible `generated/D<N>-<Domaine>/` respecte | Oui | - | Non |

## Section B, Respect des conventions Anthony

| # | Critere | OK | WARN | FAIL |
|---|---|---|---|---|
| B1 | Redaction FR uniquement (pas de paragraphes EN hors citations techniques) | Oui | < 3 occurrences EN | > 3 |
| B2 | Zero tiret cadratin `—` (em-dash) dans le prompt | Aucune | 1-2 | 3+ |
| B3 | Priorite Edu > OSS > Commercial mentionnee quand outils enumeres | Oui systematique | Parfois oublie | Jamais applique |
| B4 | Minimum 2-3 alternatives pour chaque categorie d'outil | Oui | 1 cas manquant | 3+ manquants |
| B5 | Type de plan (`(OSS)`, `(Edu)`, `(commercial)`) indique a chaque outil | Oui | Parfois | Rarement |

## Section C, Exhaustivite du contenu

| # | Critere | OK | WARN | FAIL |
|---|---|---|---|---|
| C1 | Variables `{{...}}` toutes remplacees (aucune non resolue) | Aucune laissee | 1 oubliee | 2+ |
| C2 | Sous-themes du curriculum source tous presents dans la liste | Oui | 1-2 oublies | 3+ oublies |
| C3 | Certifications liees citees | Oui | Partielles | Absentes |
| C4 | Wikilinks transverses vers autres clusters listes | Oui | Minimal | Absent |
| C5 | Bibliographie specifique (livres, YouTube, blogs) presente | Oui, detaillee | Legere | Absente ou generique |

## Section D, Qualite redactionnelle

| # | Critere | OK | WARN | FAIL |
|---|---|---|---|---|
| D1 | Ton direct, imperatif ou descriptif, pas de "je vais..." | Oui | 1-2 derives | 3+ |
| D2 | Aucune auto-promotion ou mention Claude hors contexte pertinent | Oui | 1 | 2+ |
| D3 | Code blocks avec syntax highlighting explicite | Oui | Partiel | Absent |
| D4 | Longueur du prompt calibree sur l'exemple C2.0.6 (+/- 30%) | Oui | Hors bornes +/- 40% | Hors bornes +/- 50% |
| D5 | Pas d'emojis sauf checkboxes ou indicateurs tolerants | Conforme | 1-2 | 3+ |

## Section E, Anti-hallucination

| # | Critere | OK | WARN | FAIL |
|---|---|---|---|---|
| E1 | Consigne WebSearch pour faits datés presente et claire | Oui | Partielle | Absente |
| E2 | Instructions `[NON_VERIFIE]` / `[SOURCES_CONTRADICTOIRES]` presentes | Oui | Ambiguës | Absentes |
| E3 | Regle de sources citees en bas de page rappelee | Oui | - | Non |
| E4 | Date `valide_jusqu_a` specifique au domaine indiquee | Oui | Generique | Absente |

## Section F, Executabilite

| # | Critere | OK | WARN | FAIL |
|---|---|---|---|---|
| F1 | Prompt copie-collable sans edition manuelle | Oui | 1 edition triviale | Plusieurs editions |
| F2 | Chemin vault parametre correctement | Oui | - | Mauvais chemin |
| F3 | Nombre de pages cible realiste (pas 1000+) | Oui | Limite haute | Irrealiste |
| F4 | Instructions aux checkpoints explicites | Oui | Floues | Absentes |

---

## Procedure QC

1. Ouvrir le fichier `generated/D<N>-<Domaine>/PROMPT-PILOT-<ID>-<Slug>.md`
2. Parcourir la checklist A a F, noter chaque critere
3. Compter les OK / WARN / FAIL
4. Calculer le verdict global
5. Produire un rapport dans le format :

```markdown
# Rapport QC <CLUSTER_ID>

Date : 2026-MM-JJ
Verdict : OK | WARN | FAIL
Score : X OK / Y WARN / Z FAIL sur N criteres

## Details

### Section A (Structure) : <verdict>
- A1 <OK/WARN/FAIL> : <commentaire>
- A2 ...

### Section B (Conventions) : <verdict>
...

## Recommandations

<liste des corrections proposees par critere WARN/FAIL>

## Decision proposee

- [ ] Valider en l'etat (statut -> qc-ok)
- [ ] Corriger manuellement puis revalider
- [ ] Regenerer (statut -> todo, effacer le fichier actuel)
```

6. Sauvegarder le rapport dans `generated/D<N>-<Domaine>/qc/QC-<CLUSTER_ID>-<YYYYMMDD>.md`
7. Mettre a jour STATUS.md selon la decision
