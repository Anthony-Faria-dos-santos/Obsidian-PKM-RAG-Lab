# PROMPT-PILOT, C1.1 Fondamentaux cybersec (CIA, AAA, threat modeling, surface d'attaque, risk management)

> Prompt pret-a-coller dans Claude Code. A executer dans un projet Claude Code ouvert sur le vault Obsidian `C:\Users\madko\Sandbox-lite\SecondBrain-Anthony`. Genere par le systeme Pilot Generator le 2026-04-22.
>
> **Les trois blocs "Regles editoriales", "Apprentissages cumules" et "Schema frontmatter YAML" sont des snapshots du vault pris le 2026-04-22.** La source de verite vivante reste dans le vault : `C:\Users\madko\Sandbox-lite\SecondBrain-Anthony/CLAUDE.md`, `C:\Users\madko\Sandbox-lite\SecondBrain-Anthony/00-Meta/Learnings.md`, `C:\Users\madko\Sandbox-lite\SecondBrain-Anthony/00-Meta/Schema.md`. En cas de contradiction entre ce prompt et le vault au moment de l'execution, le vault fait foi.

---

Tu es un assistant expert en construction de knowledge vault Obsidian pour Anthony, developpeur en alternance Bac+3 cybersecurite. Tu travailles en methode GodMode (Karpathy compile-once) pour generer un cluster complet de notes interconnectees.

## Variables de contexte verrouillees

- **SUJET** : Cybersecurite 2026
- **CLUSTER_CHOISI** : C1.1, Fondamentaux cybersec (CIA, AAA, threat modeling, surface d'attaque, risk management)
- **DOMAINE** : D1 Cybersecurite
- **DOSSIER_CIBLE** : `10-Cybersecurite/C1.1-Fondamentaux-Cybersec/`
- **CHEMIN_VAULT** : `C:\Users\madko\Sandbox-lite\SecondBrain-Anthony`
- **NB_PAGES_CIBLE** : 50 pages atomiques
- **CERTIFS_LIEES** : Sec+ (CompTIA SY0-701), CC (ISC2 Certified in Cybersecurity)
- **NIVEAU_ENTREE** : debutant a intermediaire

## Description du cluster

C1.1 est le cluster pilier de Tier 1 du track Cybersecurite 2026. Il pose la fondation conceptuelle absolue sur laquelle tous les autres clusters cyber (C1.2 Cryptographie, C1.3 Reseaux securite, C1.4 MITRE ATT&CK, C1.9 Blue Team, C1.13 Conformite) vont s'articuler. L'objectif est de transformer le vocabulaire flou du debutant ("ce site n'est pas securise", "il y a un risque") en un langage rigoureux aligne sur les referentiels NIST, ISO, ANSSI et ENISA : triade CIA stricte, extensions AAA et Parkerian Hexad, distinction actif/vulnerabilite/menace/risque, methodologies de threat modeling (STRIDE, PASTA, LINDDUN, Attack Trees), analyse de risque quantitative et qualitative (EBIOS RM, ISO 27005, NIST SP 800-30, FAIR), taxonomie des controles (preventive, detective, corrective, compensating), et vocabulaire operationnel cyber (IoC, IoA, TTP, artifact, indicator, malware family).

Ce cluster sert de socle de revision commun pour Security+ SY0-701 (CompTIA) et CC ISC2 (Certified in Cybersecurity, inscription au FTS Program permettant de passer l'examen gratuitement). Il doit rester atemporel sur les concepts (delta de validation 24 mois) mais fact-check soigneux sur les versions de frameworks et les referentiels reglementaires en evolution (NIS2, DORA, CRA, AI Act, RGPD). Public cible : Anthony au demarrage de son track cyber, donc niveau debutant a intermediaire, avec exigence de rigueur conceptuelle elevee pour ne pas avoir a reecrire ces pages plus tard.

## Sous-themes a couvrir imperativement

1. **Triade CIA classique** : Confidentialite, Integrite, Disponibilite, definitions rigoureuses, exemples d'atteintes concrete a chaque pilier, metriques associees (chiffrement, checksums, SLA de disponibilite).
2. **Extensions de la triade** : Authenticite, Non-repudiation, Imputabilite (Accountability), Fiabilite (Reliability), Utilisabilite (Utility), Possession. Parkerian Hexad de Donn Parker (six elements) versus triade NIST.
3. **Modele AAA** : Authentication, Authorization, Accounting (parfois Auditing). Articulation avec les controles d'acces et le logging, reference directe aux architectures reelles (RADIUS, TACACS+, IAM cloud).
4. **Triade inverse DAD** : Disclosure, Alteration, Destruction, comme miroir des atteintes a CIA pour construire des scenarios d'attaque pedagogiques.
5. **Actifs, vulnerabilites, menaces, risque** : definitions strictes selon NIST SP 800-30 et ISO 27005, relation risque = fonction(menace, vulnerabilite, impact), exemple chiffre sur un actif concret.
6. **Surface d'attaque** : notion d'ensemble expose (physique, reseau, applicative, humaine, supply chain), outils d'evaluation (ASM, EASM), difference avec vecteur d'attaque.
7. **Vecteur d'attaque** : chemin concret d'exploitation (phishing, drive-by, supply chain compromise, insider), reference croisee avec C1.4 MITRE ATT&CK Initial Access.
8. **TTP (Tactiques, Techniques, Procedures)** : concept pyramidal de David Bianco (Pyramid of Pain), relation IoC versus IoA versus TTP, valeur defensive croissante.
9. **Threat modeling, STRIDE** : methodologie Microsoft (Spoofing, Tampering, Repudiation, Information disclosure, Denial of service, Elevation of privilege), cas d'usage application et API, integration Threat Modeling Tool.
10. **Threat modeling, PASTA** : Process for Attack Simulation and Threat Analysis (Tony UcedaVelez), approche 7 stages orientee business et attaquant, contraste avec STRIDE.
11. **Threat modeling, LINDDUN** : focus privacy (Linkability, Identifiability, Non-repudiation, Detectability, Disclosure of information, Unawareness, Non-compliance), usage RGPD et AIPD.
12. **Threat modeling, Attack Trees** : methodologie Bruce Schneier, arbre racine objectif attaquant, branches AND/OR, usage pour prioriser defenses.
13. **Principes de conception securisee** : defense in depth, least privilege, fail secure versus fail open, separation of duties, complete mediation, economy of mechanism, open design (Saltzer & Schroeder 1975).
14. **Security by design et privacy by design** : Cavoukian 7 principes, integration RGPD article 25, patterns concrets (input validation, parameterized queries, secure defaults).
15. **Zero Trust, niveau concept** : ne jamais faire confiance, toujours verifier, reference NIST SP 800-207, distinction architecture versus buzzword commercial, lien vers C1.3 pour implementation reseau.
16. **Analyse de risque EBIOS Risk Manager** : methode ANSSI, 5 ateliers (cadrage, sources de risque, scenarios strategiques, scenarios operationnels, traitement), obligatoire secteurs reglementes en France.
17. **Analyse de risque ISO 27005** : edition 2022, integration ISO 27001, approche systematique, identification et traitement du risque.
18. **Analyse de risque NIST SP 800-30 rev1** : approche americaine, tier organizationnel, ingredients (threat source, threat event, vulnerability, impact, likelihood).
19. **Analyse de risque FAIR** : Factor Analysis of Information Risk, approche quantitative, loss event frequency et loss magnitude, debat sur la fiabilite des estimations.
20. **Appetit pour le risque et tolerance au risque** : risk appetite, risk tolerance, risk capacity, notion de traitement (accept, avoid, transfer, mitigate).
21. **Taxonomie des controles de securite** : preventive (pare-feu, MFA), detective (IDS, logs SIEM), corrective (patch, restauration), compensatoire (control alternatif quand le controle ideal est infaisable), dissuasive, directive.
22. **Controles techniques, administratifs, physiques** : matrice croisee avec preventive/detective/corrective, exemples pour chaque case.
23. **Vocabulaire operationnel, IoC (Indicator of Compromise)** : hashes, IP, domaines, artefacts, formats standards (STIX, MISP), place dans la Pyramid of Pain.
24. **Vocabulaire operationnel, IoA (Indicator of Attack)** : signaux comportementaux, utilisation par EDR modernes, difference avec IoC.
25. **Vocabulaire operationnel, artifact et indicator** : granularite, cycle de vie dans la detection, integration threat intel.
26. **Taxonomie malware** : malware family, strain, variant, exemples de conventions de nommage (Microsoft MMPC, ENISA), piege de la surmultiplication des noms.
27. **Kill chains et modeles d'attaque** : Lockheed Martin Cyber Kill Chain (7 phases), Unified Kill Chain (18 phases), Diamond Model (4 vertex), relations avec MITRE ATT&CK en C1.4.
28. **Cyber threat intelligence, niveau introductif** : strategic, operational, tactical, technical, cycle du renseignement (planning, collecte, exploitation, analyse, diffusion).
29. **APT (Advanced Persistent Threat)** : definition rigoureuse, exemples publiquement documentes (nommage Mandiant, ANSSI, CrowdStrike), lien vers C1.17.
30. **Script kiddie, hacktiviste, cybercriminel, APT** : classification des acteurs de la menace, motivations, capacites, TTPs typiques.
31. **Insider threat** : menace interne, typologie (malveillante, negligente, compromise), controles specifiques (DLP, UEBA), cadre CERT SEI.
32. **Supply chain attack** : concept, exemples publics (SolarWinds 2020, 3CX 2023), cadre NIST C-SCRM, reference CRA Europe.
33. **Security posture et maturite** : CMMI-cybersec, NIST CSF 2.0 (Govern, Identify, Protect, Detect, Respond, Recover), tiers 1 a 4, profiles.
34. **Framework de conformite, panorama** : panorama rapide PCI-DSS, HIPAA, SOC 2, ISO 27001, NIST CSF, pont vers C1.13 pour approfondissement.
35. **NIS2, niveau introductif** : directive UE, transposition France 2024-2025, entites essentielles versus importantes, obligations cyber, renvoi C1.13.
36. **DORA, niveau introductif** : secteur financier UE, applicable depuis janvier 2025, exigences cybersec, renvoi C1.13.
37. **AI Act, impact cybersec** : systemes IA haut risque, obligations cybersec dans article 15, renvoi C4 AI-ML.
38. **RGPD et cybersec** : article 32 (mesures techniques et organisationnelles), article 33-34 (notification violation), lien avec LINDDUN et AIPD.
39. **Triade People, Process, Technology** : modele pragmatique pour structurer un programme securite, limites (facteur humain souvent sous-investi).
40. **Modele de gouvernance RSSI, DPO, RSI** : roles, perimetres, interaction, reference PSSIE ANSSI pour les administrations.
41. **Secure Software Development Lifecycle (SSDLC)** : integration securite dans le cycle dev, references (Microsoft SDL, OWASP SAMM, BSIMM), renvoi C2 Developpement.
42. **Standards de durcissement (hardening)** : CIS Benchmarks, DISA STIGs, ANSSI guides, approche baseline versus risk-based.
43. **Vulnerability management** : cycle (decouverte, triage, priorisation, correction, verification), outils classiques (scanner, CMDB, ticketing), CVSS v3.1 et v4.0.
44. **CVE, CWE, CAPEC, NVD** : ecosysteme MITRE et NIST, difference entre identifiants, usage pratique, piege de la surpopulation CVE.
45. **Vocabulaire incident** : event, alert, incident, breach, distinction NIST SP 800-61 rev2, renvoi C1.10 DFIR.
46. **Glossaires de reference** : NIST Glossary CSRC, ENISA Glossary, ANSSI glossaire, usage pedagogique et piege des definitions divergentes.
47. **Deontologie et legalite, cadre France** : articles 323-1 a 323-8 Code penal, autorisation obligatoire pour tout acte offensif, lien bug bounty (HackerOne, YesWeHack), renvoi C1.19 Roadmap certifs.
48. **Social engineering, fondation conceptuelle** : principes Cialdini, phishing versus spear phishing versus whaling, renvoi C1.14 pour approfondissement.
49. **Metriques de securite** : KPI (MTTD, MTTR, patch compliance rate), KRI (risk indicators), piege du vanity metric, cadre ISO 27004.
50. **MOC du cluster** : page `_MOC.md` qui orchestre tous les wikilinks, avec schema visuel de la triade CIA enrichie et table de navigation par theme.

## Wikilinks transverses a tisser

- `[[C1.2-Cryptographie]]` : la cryptographie implemente techniquement les piliers Confidentialite, Integrite et Authenticite. Lier les pages CIA et AAA vers les primitives crypto correspondantes (AES, HMAC, signatures).
- `[[C1.3-Reseaux-Securite]]` : la segmentation, Zero Trust, defense in depth reseau sont les applications pratiques des principes poses en C1.1. Lier les pages defense in depth et Zero Trust vers C1.3.
- `[[C1.4-MITRE-ATTetCK]]` : les tactiques et techniques d'attaque sont le dictionnaire operationnel qui complete le vocabulaire pose en C1.1 (TTP, kill chain, Initial Access). Lier la page TTP et Kill Chain vers C1.4.
- `[[C1.9-Blue-Team]]` : la detection concrete, SIEM et EDR, mettent en oeuvre les controles detective poses en C1.1. Lier la taxonomie des controles et IoC/IoA vers C1.9.
- `[[C1.13-Hardening-Conformite]]` : le panorama conformite pose ici (NIS2, DORA, CRA, AI Act, RGPD) sera approfondi en C1.13 avec les baselines CIS, STIG, ANSSI. Lier les pages conformite introductives vers C1.13.
- `[[C1.14-Social-Engineering]]` : la section fondation Cialdini pointe vers C1.14 pour le traitement avance (vishing, pretexting, SE physique).
- `[[C1.19-Roadmap-Certifs]]` : la page deontologie France, le cadre legal, et la cartographie Sec+/CC renvoient vers C1.19 pour le plan de certifications et le budget.

---

## Regles editoriales, snapshot du vault 2026-04-22

Contenu integral de `C:\Users\madko\Sandbox-lite\SecondBrain-Anthony/CLAUDE.md` au moment de la generation. Ces regles priment sur toute autre instruction implicite. A appliquer des Phase 0, pas en cleanup Phase 4.

<!-- BEGIN EDITORIAL_RULES_VAULT -->
# CLAUDE.md — Vault Second Brain Anthony

> Fichier d'instructions racine pour tout agent Claude Code travaillant sur ce vault. À déposer à la racine du vault **avant** de lancer le premier run. Claude Code le lira en priorité et l'enrichira en Phase 0.

---

## Identité du vault

- **Nom** : Second Brain Anthony
- **Propriétaire** : Anthony (dev, étudiant Bac+3 alternance cybersécurité)
- **Méthode** : GodMode Mayday / LE LABO IA, protocole `PROMPT-PILOT.md` v1
- **Architecture maître** : voir `00-Meta/Architecture-Vault-Second-Brain.md`
- **Track Développeur 2026** : voir `00-Meta/Developer-2026-Curriculum.md`
- **Langue principale** : français
- **Commit policy** : Git + `.gitignore` excluant `.obsidian/workspace*` et caches ; push privé

---

## Domaines et numérotation Johnny Decimal

```
00-Meta/                    architecture, MOCs maîtres, logs, debriefs
10-Cybersecurite/           D1 — clusters C1.x
20-Developpement/           D2 — clusters C2.x (track Dev 2026)
30-Cloud-Infra/             D3 — clusters C3.x
40-IA-ML/                   D4 — clusters C4.x
50-Reseaux/                 D5 — clusters C5.x (CCNA/CCNP)
60-Etudes-Carriere/         D6 — clusters C6.x
70-Productivite/            D7 — clusters C7.x
80-Admin-Documentaire/      D8 — clusters C8.x
90-Finances/                D9 — clusters C9.x
95-Vie-Personnelle/         D10 — clusters C10.x
```

Tout nouveau cluster respecte cette arborescence. Chaque cluster vit dans son propre sous-dossier préfixé par son code (ex : `20-Developpement/C2.0.6-Collaboration-IA/`).

---

## Conventions de rédaction (non-négociables)

### Langue et style

- Français intégral dans le contenu, les titres, les champs YAML, les tags.
- Accents systématiquement présents.
- Terminologie technique anglaise conservée uniquement quand c'est le nom propre d'un concept (ex : « worktree », « Server Components »), jamais dans les titres de page.
- Zéro tiret cadratin (—). Utilise deux-points (:), virgules, ou parenthèses.
- Bannir les formules creuses : « il est important de noter que », « cependant il faut garder à l'esprit », « en conclusion », « dans le monde d'aujourd'hui ».
- Ton neutre mais tranché. Si un outil est surévalué, le dire et pourquoi. Si une pratique est débunkée, le dire et pourquoi.

### Longueur et densité

- Pages standards : 800 à 1500 mots.
- Pages piliers : peuvent monter à 2000 mots si justifié.
- Pages deep-cut : 600 à 1000 mots suffisent.
- Densité d'information supérieure à un article Wikipedia moyen du même sujet.

### Wikilinks

- `[[Page exacte]]` ou `[[Page|alias]]`.
- Chaque wikilink justifié par la phrase qui l'entoure. Jamais en liste brute hors du MOC.
- Cible : 7 à 12 wikilinks par page, pondérés selon densité.

### Sources

- Footnotes Markdown : `[^1]` dans le texte, `[^1]: ...` en bas de page.
- Hiérarchie des sources préférées : documentation officielle → spec protocole → blogs engineering → articles d'autorité établie.
- Éviter : threads X/Twitter sans autorité, articles Medium anonymes, posts LinkedIn promotionnels.

---

## YAML frontmatter standard du vault

```yaml
---
titre: "Nom exact de la page"
type: concept | pratique | outil | pattern | protocole | controverse | débat | personne | terme | théorie | expérience | école | méthode | œuvre | institution | événement | trouble
cluster: "C2.0.6 - Collaboration IA-augmentée"
domaine: "Développement"
statut: verified | to-verify | débattu | débunké | déprécié | hypothétique | stub | à-sourcer
controverse: low | medium | high
importance: pilier | standard | deep-cut
source_knowledge: internal | web-checked | mixed
sources_count: N
tags: [#dev/ia, #outil/claude-code]
créé: AAAA-MM-JJ
révisé: AAAA-MM-JJ
valide_jusqu_a: "2026-12-31"
certif_liee: []
liens_forts: ["[[...]]"]
liens_opposition: []
---
```

Champs obligatoires : `titre`, `type`, `cluster`, `domaine`, `statut`, `créé`.

Le champ `valide_jusqu_a` est **obligatoire** pour tout contenu sensible au temps (outils, versions, pricing, règles fiscales, CVE, certifications). Audit annuel à planifier.

---

## Préférences outillage (Edu → Open Source → Commercial)

Toute recommandation d'outil dans une page respecte cet ordre. Format standard recommandé :

| Outil | Type | Fiabilité | Remarque |
|---|---|---|---|
| Nom | Edu / Open Source / Commercial | ★★★★★ | Contexte d'usage |

Indiquer explicitement les plans étudiants/éducation disponibles (GitHub Student Pack, JetBrains, HTB Academy Student, Cisco NetAcad, etc.) quand ils existent.

---

## Règles anti-hallucination (non-négociables)

1. Aucun nom propre inventé. Si WebSearch échoue : `statut: to-verify`.
2. Aucune date fabriquée.
3. Aucun chiffre non sourcé (pricing, benchmarks, tokens, statistiques).
4. Aucune citation directe inventée. Paraphrase neutre sinon.
5. Pour les outils commerciaux : confirmer pricing et features via site officiel au moment du run.
6. Pour les benchmarks IA : citer source et niveau de confiance, signaler si orienté marketing.
7. Reconnaître les biais d'auteur connus (DHH anti-microservices, Karpathy pro-software 3.0, etc.) quand pertinent.
8. Toute auto-correction d'hallucination à logger dans `99-Meta/Fact-Check-Log.md`.

---

## Règles spécifiques par domaine

### Cybersécurité (D1)

- CVE : WebSearch obligatoire systématique.
- Techniques offensives : contextualiser légalement (autorisation, bug bounty, lab perso), ne pas produire de code d'exploitation clé en main pour cibles tierces.
- Tooling : préciser si OSS / commercial / usage strictement autorisé en France.

### Cloud et IA (D3, D4)

- Services cloud : WebSearch obligatoire pour tout service, tarif, quota (dépréciation fréquente).
- Modèles LLM : préciser version et date de validité (« Claude Opus 4.7 d'avril 2026 »).
- Benchmarks IA : citer source primaire, signaler si orienté marketing.

### Administratif et finances (D8, D9)

- **Statut par défaut** : `to-verify` sur toute règle fiscale, sociale, juridique française.
- **Pas de conseil juridique ou fiscal personnalisé** : information éducative uniquement.
- Audit annuel obligatoire (barèmes, tranches, plafonds changent chaque année fiscale).

### Santé (D10)

- **Jamais de conseil médical personnalisé.**
- Préfixe obligatoire sur les pages concernées : « Information éducative. Ne remplace pas un avis médical. »
- Citations d'études : niveau de preuve (méta-analyse > RCT > cohorte > étude d'observation > cas clinique).
- Psychologie : signaler statut de réplicabilité (crise post-2015).

---

## Protocole de run (rappel)

Chaque cluster suit les 6 phases du prompt pilote :

1. **Phase 0** : bootstrap du sous-dossier cluster.
2. **Phase 1** : cartographie (`Plan.md`) avec checkpoint humain.
3. **Phase 2** : 8 pages pilote avec checkpoint humain.
4. **Phase 3** : rédaction complète par batches de 8-10.
5. **Phase 4** : linking + MOC du cluster.
6. **Phase 5-6** : audit + debrief.

Le debrief de chaque cluster doit être lu avant de lancer le suivant. Les apprentissages s'accumulent dans `00-Meta/Learnings.md`.

---

## Règles pour les agents Claude Code travaillant dans ce vault

1. **Lire ce fichier avant toute action.**
2. Respecter les conventions sans discussion.
3. Utiliser le Task tool pour des subagents de fact-check groupé ou d'exploration parallèle, sinon travailler en direct.
4. Toujours préférer une édition ciblée (Edit) à une réécriture complète (Write) pour optimiser les tokens.
5. Consigner toute décision architecturale non-triviale dans `00-Meta/ADR/` en format Architecture Decision Record.
6. Ne jamais supprimer une page sans la logger dans `00-Meta/Pages-Supprimees.md` avec la raison.
7. En cas de conflit entre les instructions de ce fichier et celles d'un prompt ponctuel : priorité à ce fichier, sauf override explicite dans le prompt.

---

## Versioning et backup

- Git : dépôt privé, remote auto-hébergé ou GitHub (selon sensibilité des pages).
- `.gitignore` minimal inclus à la racine.
- Sync multi-machines : Syncthing (P2P chiffré, souverain).
- Backup : rclone vers cloud privé chiffré, fréquence hebdomadaire.

---

## Index des MOC

- `_MOC-Master.md` : point d'entrée global (à créer après 3 clusters).
- `10-Cybersecurite/_MOC-Cybersecurite.md`
- `20-Developpement/_MOC-Developpement.md`
- ... un MOC par domaine, mis à jour après chaque nouveau cluster.

---

## Journal de runs

Chaque pilote/production lancé est tracé dans `00-Meta/Runs-Journal.md` :

```markdown
## 2026-04-22 — Pilote C2.0.6 Collaboration IA-augmentée
- Pages créées : X
- Durée : Xh
- Coût : X€
- Debrief : [[Debrief-C2.0.6]]
- Apprentissages clés : [3 points]
```

---

## Licence et usage

Vault personnel, non destiné à redistribution. Les pages peuvent contenir des paraphrases de sources tierces : en cas de partage public d'extraits, rédiger proprement avec attribution complète.

---

*Ce fichier est la source de vérité pour tout travail sur ce vault. Mis à jour à chaque apprentissage majeur depuis un debrief de run. Version 1.0, 2026-04-22.*
<!-- END EDITORIAL_RULES_VAULT -->

---

## Apprentissages cumules des runs precedents, snapshot du vault 2026-04-22

Contenu integral de `C:\Users\madko\Sandbox-lite\SecondBrain-Anthony/00-Meta/Learnings.md` au moment de la generation. Ces apprentissages sont extraits des debriefs des clusters deja produits. Lire avant de commencer la Phase 1. Pour chaque apprentissage, appliquer la clause "Application" pendant toutes les phases.

<!-- BEGIN LEARNINGS_CUMULES -->
# Apprentissages cumulés des runs

Ce fichier agrège les enseignements transversaux extraits des debriefs de chaque cluster. Il sert de playbook pour les runs suivants.

## Format d'entrée

```markdown
### [Date], [Cluster], [Titre de l'apprentissage]
**Observation** : ce qui s'est passé.
**Conclusion** : règle ou ajustement à tirer.
**Application** : comment l'appliquer aux runs futurs.
```

## Apprentissages

### 2026-04-22, C2.0.6, WebSearch obligatoire avant rédaction sur sujets techno évolutifs

**Observation** : sur 5 pages outils du Phase 3, j'ai sous-livré sans WebSearch en croyant pouvoir m'appuyer sur la connaissance interne. Résultat : page OpenCode factuellement fausse (« projet jeune incertain » alors qu'il a 147K stars GitHub), informations Cursor obsolètes (« 9B$ » au lieu de $29.3B), et plusieurs autres erreurs de contexte.

**Conclusion** : pour tout outil commercial, toute personne publique, toute statistique post-2024, **WebSearch obligatoire avant rédaction**, sans exception. La connaissance interne, même récente, peut être périmée à 3 mois.

**Application** : insérer en Phase 0 du PROMPT-PILOT V2 une checklist explicite : pour chaque page de la liste Plan, marquer `WebSearch: obligatoire` ou `WebSearch: optionnel`, et faire les WebSearch obligatoires AVANT de commencer la rédaction du batch correspondant.

### 2026-04-22, C2.0.6, Budget contexte ne justifie jamais la sous-livraison

**Observation** : j'ai dégradé la qualité (longueur, sources) sur 5 pages pour économiser le contexte, croyant la fenêtre limitée à 200k tokens. Réalité : fenêtre 1M sur ce projet, status line affichant un seuil intermédiaire trompeur.

**Conclusion** : le budget contexte ne justifie jamais une sous-livraison. Si vraiment serré, on s'arrête tôt avec rapport honnête plutôt que pousser en dégradant. Pour ce projet, fenêtre 1M, donc aucun raccourci légitime.

**Application** : règle saved en mémoire dans `feedback_qualite_non_negociable.md` et `reference_contexte_1M.md`. À appliquer sur tous les runs futurs du vault.

### 2026-04-22, C2.0.6, Règles éditoriales appliquées dès Phase 0/1, pas en Phase 4

**Observation** : j'ai produit des em-dashes dans le Plan, le Schema, le README, les pages outils Phase 2-3 malgré la règle « zéro tiret cadratin ». Nettoyage Phase 4 par sed batch fonctionnel mais coûteux et imparfait (certains contextes auraient mérité « : » plutôt que « , »).

**Conclusion** : appliquer les règles éditoriales de CLAUDE.md DÈS la rédaction, pas en post-traitement. Pour le PROMPT-PILOT V2 : rappeler les règles non négociables (anti-cadratin, formules creuses bannies) explicitement dans la consigne de chaque phase.

**Application** : checklist auto-applicable en début de chaque batch de rédaction : « Avant d'écrire, je rappelle : zéro tiret cadratin, accents complets, pas de "il convient de noter", terminologie anglaise seulement comme noms propres. »

### 2026-04-22, C2.0.6, Renaming des pages anticipé en Phase 1

**Observation** : la page « Model Context Protocol (MCP) - overview » du Plan a dû être renommée « Model Context Protocol (MCP) » en Phase 2 pour respecter la règle anti-cadratin. La page « DHH et la critique des agents » a dû être renommée « DHH et le retournement vers l'agent-first » pour refléter le retournement 2026 documenté en WebSearch. Conséquence : wikilinks dans le Plan à fixer en Phase 4.

**Conclusion** : valider les titres des pages au regard des règles éditoriales **dès la production du Plan**, pas plus tard. Et accepter que le Plan évolue si WebSearch révèle un changement factuel structurant (cas DHH).

**Application** : en Phase 1 du PROMPT-PILOT V2, ajouter explicitement « relire chaque titre du Plan contre les règles éditoriales du CLAUDE.md ; pour les pages personnes ou outils, faire un mini-WebSearch d'orientation si la position 2026 n'est pas certaine ».
<!-- END LEARNINGS_CUMULES -->

---

## Schema frontmatter YAML, snapshot du vault 2026-04-22

Contenu integral de `C:\Users\madko\Sandbox-lite\SecondBrain-Anthony/00-Meta/Schema.md` au moment de la generation. Specification integrale du frontmatter et des enumerations du vault. Appliquer sans deviation sur toutes les pages produites.

<!-- BEGIN SCHEMA_YAML_VAULT -->
---
titre: "Schema du vault"
type: pattern
cluster: "Meta"
domaine: "Meta"
statut: verified
controverse: low
importance: pilier
source_knowledge: internal
sources_count: 0
tags: [#meta/schema, #convention]
créé: 2026-04-22
révisé: 2026-04-22
valide_jusqu_a: "2027-04-22"
---

# Schema du vault Second Brain Anthony

Document de référence technique pour le format des pages du vault. Complémentaire au `CLAUDE.md` racine : ce fichier détaille les énumérations et la mécanique, `CLAUDE.md` porte les règles éditoriales.

## YAML frontmatter

Tout fichier `.md` du vault, hors MOC et docs méta, porte un frontmatter YAML. Les champs obligatoires sont en gras dans la liste ci-dessous.

### Champs

| Champ | Type | Obligatoire | Valeurs ou format |
|---|---|---|---|
| **titre** | string | oui | Nom exact de la page, avec accents. |
| **type** | enum | oui | Voir énumération `type` ci-dessous. |
| **cluster** | string | oui | Code cluster + nom court, ex `"C2.0.6 - Collaboration IA-augmentée"`. |
| **domaine** | string | oui | Nom du domaine, ex `"Développement"`, `"Cybersécurité"`. |
| **statut** | enum | oui | Voir énumération `statut`. |
| controverse | enum | recommandé | `low`, `medium`, `high`. Défaut implicite `low`. |
| importance | enum | recommandé | `pilier`, `standard`, `deep-cut`. Défaut implicite `standard`. |
| source_knowledge | enum | recommandé | `internal`, `web-checked`, `mixed`. |
| sources_count | number | recommandé | Nombre de footnotes sourcées dans la page. |
| tags | list | recommandé | 1 à 5 tags, français, préfixés, minuscules. |
| **créé** | date | oui | `YYYY-MM-DD`. |
| révisé | date | recommandé | `YYYY-MM-DD`. À mettre à jour à chaque édition non triviale. |
| valide_jusqu_a | date | conditionnel | Obligatoire pour contenus sensibles au temps (outils, pricing, CVE, règles fiscales). `YYYY-MM-DD` entre guillemets. |
| certif_liee | list | optionnel | Codes de certifs reliées, ex `["CCNA-200-301"]`. |
| liens_forts | list | optionnel | `["[[Page 1]]", "[[Page 2]]"]`. Pages sans lesquelles celle-ci perd son sens. |
| liens_opposition | list | optionnel | Wikilinks vers pages opposées ou critiques, pour controverses. |

### Énumération `type`

| Valeur | Usage | Couleur graph |
|---|---|---|
| concept | Notion abstraite, idée, modèle mental. | Bleu |
| pratique | Manière de faire, méthode appliquée. | Rose |
| outil | Logiciel, service, framework concret. | Orange |
| pattern | Structure récurrente de configuration, de code, ou d'organisation. | Cyan |
| protocole | Spécification technique ou standard. | Turquoise |
| controverse | Sujet où la communauté est divisée, avec argumentaire des deux côtés. | Rouge |
| débat | Question ouverte, évolution en cours, pas de consensus. | Violet |
| personne | Figure publique du domaine. Fact-check obligatoire. | Vert |
| terme | Définition courte de vocabulaire, glossaire. | Gris |
| théorie | Cadre théorique structuré. | Bleu foncé |
| expérience | Étude, benchmark, expérimentation. | Bleu clair |
| école | Courant de pensée, mouvement. | Vert foncé |
| méthode | Méthodologie codifiée. | Rose foncé |
| œuvre | Livre, article fondateur, paper, conférence. | Marron |
| institution | Organisation, entreprise, collectif. | Olive |
| événement | Conférence, incident, release majeure. | Jaune |
| trouble | Spécifique D10 santé, pathologie. | Gris clair |

### Énumération `statut`

| Valeur | Usage |
|---|---|
| verified | Contenu vérifié par sources primaires, à jour. |
| to-verify | Contenu rédigé mais un ou plusieurs faits restent à confirmer. |
| débattu | Contenu sur un sujet où le consensus n'existe pas, positions multiples présentées. |
| débunké | Contenu qui explique pourquoi une idée populaire est fausse. |
| déprécié | Contenu factuellement correct mais concernant un outil ou pratique obsolète. |
| hypothétique | Spéculation ou prédiction assumée comme telle. |
| stub | Ébauche, moins de 400 mots, à compléter. |
| à-sourcer | Contenu rédigé mais sans footnotes suffisantes. |

## Tags

- Minuscules, français, sans accents (Obsidian gère mal les accents dans les tags).
- Format préfixé : `#<catégorie>/<valeur>`. Exemples : `#outil/claude-code`, `#pratique/worktree`, `#protocole/mcp`, `#dev/ia`, `#cluster/c2-0-6`.
- Max 5 tags par page. Au-delà, c'est du bruit.
- Les catégories usuelles : `outil`, `pratique`, `pattern`, `protocole`, `concept`, `debat`, `personne`, `dev`, `cluster`, `meta`.

## Wikilinks

- Syntaxe : `[[Page exacte]]` ou `[[Page|alias]]`.
- Chaque wikilink doit être justifié par la phrase qui le contient. Interdit en liste brute hors MOC.
- Cible : 7 à 12 wikilinks par page standard, plus sur les MOC et pages piliers.
- Si un wikilink pointe vers une page non encore rédigée (fantôme), c'est acceptable tant qu'elle figure au `Plan.md` du cluster ou d'un cluster futur.

## Footnotes et sources

Format Markdown standard :

```markdown
Fait sourcé dans le corps du texte[^1].

[^1]: Auteur ou organisme, *Titre*, date de publication ou consultation, URL.
```

Hiérarchie des sources, du plus fiable au moins fiable :

1. Documentation officielle de l'outil ou du standard.
2. Spécification du protocole.
3. Publications de recherche pair-évaluées (pour D4 IA/ML notamment).
4. Blog engineering de l'éditeur.
5. Articles techniques reconnus (Simon Willison, Latent Space, Pragmatic Engineer, Julia Evans, etc.).
6. Repos GitHub de référence.

Sources à éviter : threads X/Twitter sans autorité établie, articles Medium anonymes, posts LinkedIn promotionnels, contenus AI-généré sans vérification.

## Structure de page standard

```markdown
---
[YAML]
---

# Titre

> [!info] Résumé
> 1 à 2 phrases de pitch clair et précis.

## Définition
2 à 4 paragraphes denses.

## Contexte et origine
Qui, quand, où, dans quel cadre.

## Fonctionnement / caractéristiques / mécanismes
Le cœur. 3 à 6 paragraphes. Exemples concrets.

## Nuances, critiques, limites
Obligatoire. Coût, courbe d'apprentissage, cas où l'outil est mauvais choix.

## Liens et implications
Wikilinks sortants contextualisés dans des phrases complètes.

## Sources
[^1]: Référence 1
[^2]: Référence 2
```

Les sections peuvent être renommées légèrement selon le type de page, mais la logique reste : résumé, définition, contexte, mécanisme, critique, liens, sources.

## Longueur cible

| Importance | Mots |
|---|---|
| deep-cut | 600 à 1000 |
| standard | 800 à 1500 |
| pilier | 1200 à 2000 |

Page à plus de 2000 mots : envisager un découpage.
Page à moins de 600 mots : marquer `statut: stub`.

## Nommage des fichiers

- Titres en français naturel, avec accents, espaces autorisés.
- Pas de préfixe numérique sur les pages individuelles.
- Les MOC sont préfixés `_MOC-` pour trier en haut dans l'explorateur Obsidian.
- Les docs méta cluster-specific sont préfixés par leur code cluster, ex `Plan-C2.0.6.md`, `Audit-C2.0.6.md`.
<!-- END SCHEMA_YAML_VAULT -->

---

## Regles de fact-check specifiques a ce cluster

Ce cluster porte sur des concepts largement stables (triade CIA, principes Saltzer & Schroeder 1975, STRIDE de Microsoft, Attack Trees de Schneier) mais s'appuie aussi sur des referentiels vivants. Le fact-check doit etre soigneux, en priorisant les sources primaires officielles.

- **Frameworks de threat modeling** : verifier la version courante de STRIDE (Microsoft Threat Modeling Tool, derniere version publique), de PASTA (ouvrage de Tony UcedaVelez et Marco Morana, edition 2015, toujours reference en 2026), de LINDDUN (site officiel `linddun.org` maintenu par l'universite KU Leuven, version LINDDUN GO disponible). Ne jamais inventer de variante. Si une version plus recente est citee dans une source, privilegier le site editeur.
- **Methodes d'analyse de risque** : EBIOS Risk Manager ANSSI, verifier la version courante (v1.5 diffusee en 2018-2019, check 2026 sur `cyber.gouv.fr` pour tout update). ISO 27005 edition 2022 (confirmer qu'aucune revision 2026 n'est parue). NIST SP 800-30 revision 1 de septembre 2012 (toujours la revision courante en 2026, verifier sur `csrc.nist.gov`). FAIR Institute : verifier la terminologie officielle et eviter les derives pop-culture.
- **NIST Cybersecurity Framework** : CSF 2.0 publie officiellement en fevrier 2024 par le NIST, ajout de la fonction Govern. Verifier qu'aucune revision mineure n'est parue depuis. URL canonique : `nist.gov/cyberframework`.
- **Referentiels conformite cites en pont C1.13** : NIS2 directive `(UE) 2022/2555`, transposition France par la loi du 30 octobre 2024 (confirmer date exacte, decrets d'application publies progressivement). DORA reglement `(UE) 2022/2554`, applicable depuis le 17 janvier 2025. CRA Cyber Resilience Act reglement `(UE) 2024/2847`, publie au JOUE fin 2024, applicable progressivement jusqu'a decembre 2027. AI Act reglement `(UE) 2024/1689`, entree en vigueur 1er aout 2024, applicabilite progressive. RGPD reglement `(UE) 2016/679`, stable. Pour chaque texte, verifier les dates et fournir l'URL EUR-Lex.
- **Taxinomie et glossaires** : privilegier NIST Glossary (CSRC IR 7298 revision 3, 2019) et ENISA glossary (enisa.europa.eu). ANSSI glossaire disponible sur `cyber.gouv.fr/glossaire`. Ne pas utiliser de definitions de blogs non authentifies.
- **Programmes de certification** : verifier Security+ SY0-701 (version actuelle depuis novembre 2023 d'apres `comptia.org`, remplace SY0-601, durant environ trois ans avant SY0-801). Verifier CC ISC2 (One Million Certified in Cybersecurity Program, passage gratuit de l'examen, confirmer que le programme est toujours actif en 2026). Frais 2026, materiel officiel, duree de validite (3 ans Sec+, 3 ans CC avec CPE).
- **Taux et chiffres** : aucune invention statistique. Sources autoritaires acceptables : ENISA Threat Landscape (rapport annuel), Verizon DBIR (Data Breach Investigations Report, rapport annuel), ANSSI Panorama de la menace (rapport annuel en francais), IBM Cost of a Data Breach Report, rapport Mandiant M-Trends. Toujours citer l'annee du rapport et la page ou metrique exacte.
- **CVE, CWE, CAPEC, NVD** : sources MITRE (`cve.mitre.org`, `cwe.mitre.org`, `capec.mitre.org`) et NIST (`nvd.nist.gov`). Pour CVSS, version actuelle v4.0 publiee le 1er novembre 2023, v3.1 toujours largement utilisee.
- **Kill chains et modeles** : Lockheed Martin Cyber Kill Chain (white paper 2011), Unified Kill Chain (these de Paul Pols 2017, mise a jour en 2022), Diamond Model (Caltagirone, Pendergast, Betz 2013). Verifier URLs officielles.
- **Pour toute page type `personne` ou `institution`** : mini WebSearch avant redaction (rappel Learning 2026-04-22 C2.0.6). Ne jamais inventer de citations directes, paraphraser.
- **Pour tout chiffre de pricing certif** : verifier sur les sites officiels au moment du run (comptia.org, isc2.org, offsec.com). Marquer `valide_jusqu_a: "2026-12-31"` ou plus tot si volatilite detectee.

## Pieges classiques du domaine a eviter

- **Confondre vulnerabilite, menace, risque**. La vulnerabilite est une faiblesse (CVE-XXXX non patchee, mot de passe faible, absence de MFA). La menace est un acteur ou evenement potentiel (APT29, phishing, inondation). Le risque est la probabilite qu'une menace exploite une vulnerabilite avec un impact donne. Obligatoire de demontrer la triade avec un exemple concret sur chaque page de definition, pas seulement une formule abstraite.
- **Resumer la securite a CIA**. La triade classique est reductrice. Introduire systematiquement Authenticite, Non-repudiation, Imputabilite (AAA operationnel), et mentionner la Parkerian Hexad (Possession, Utility) pour marquer la limite du modele NIST. Ne pas presenter CIA comme une fin en soi.
- **Presenter STRIDE comme LA methode de threat modeling**. STRIDE est une methode Microsoft orientee applications. PASTA est orientee processus et attaquant. LINDDUN est privacy-centric et utile pour RGPD. Attack Trees sont attaquant-centriques. Chaque methode a son cas d'usage. Presenter le panorama et guider sur le choix, ne pas trancher arbitrairement.
- **Melanger surface d'attaque et vecteur d'attaque**. Surface d'attaque = ensemble des points d'exposition (APIs exposees, ports ouverts, employes cibles de phishing). Vecteur d'attaque = chemin concret emprunte par une attaque reelle (phishing vers piece jointe malveillante vers C2). La surface est un ensemble, le vecteur est un chemin dans cet ensemble.
- **Ignorer la distinction preventive/detective/corrective/compensatoire**. Ces quatre categories sont systematiquement interrogees en certification (Sec+ et CC) et structurent la pensee defensive. Un seul type presente = page incomplete. Ajouter dissuasive et directive pour les pages exhaustives.
- **Recopier sans nuancer les definitions divergentes entre NIST et ISO**. Les deux ecoles coexistent. NIST tend vers le tiered risk assessment (800-30) et le CSF 2.0. ISO tend vers le systeme de management (27001 + 27005). Quand les definitions different (notamment sur "threat" versus "threat source"), le signaler.
- **Parler de Zero Trust comme d'une technologie**. Zero Trust est une architecture, pas un produit. NIST SP 800-207 pose les principes (verification continue, micro-segmentation, contexte de confiance). Les produits Zero Trust commerciaux implementent partiellement ces principes. Renvoyer l'implementation concrete a C1.3 Reseaux et securite reseau.
- **Presenter EBIOS RM comme obsolete**. EBIOS Risk Manager est au contraire la methode de reference ANSSI, obligatoire dans plusieurs contextes reglementaires en France (secteurs OIV, OSE, administrations). Sa v1.5 reste la version courante en 2026. Ne pas la traiter comme curiosite francaise.
- **Traiter le risk management comme purement quantitatif**. FAIR apporte une approche quantitative utile mais controversee (fiabilite des distributions de probabilite estimees). Les methodes qualitatives (cartographies, matrices probabilite/impact) restent pertinentes pour les contextes sans donnees historiques. Equilibrer qualitatif et quantitatif, ne pas fetichiser les chiffres.
- **Presenter les TTP comme synonymes d'IoC**. La Pyramid of Pain de David Bianco classe ces concepts par valeur defensive : hash, IP, domain sont bas dans la pyramide (IoC triviaux a rotation). TTPs sont au sommet (couteux a changer pour un attaquant). Bien expliquer la hierarchie, pas traiter en liste plate.
- **Ne pas contextualiser les articles 323-1 a 323-8 du Code penal**. Toute page mentionnant des techniques offensives doit rappeler le cadre legal francais, l'exigence d'autorisation ecrite, les programmes bug bounty comme cadre legitime (HackerOne, YesWeHack, Intigriti). Rappel du Learning editorial vault D1.

---

## Protocole d'execution en 6 phases

### Phase 0, Internalisation des regles

Avant toute action :

1. Relire les trois blocs ci-dessus (Regles editoriales, Apprentissages cumules, Schema frontmatter YAML).
2. Extraire de chaque apprentissage la clause "Application" et t'engager a l'appliquer. Point de vigilance particulier pour ce cluster : l'apprentissage sur les em-dashes des le Plan, pertinent car les titres cybersec francais peuvent naturellement en prendre si on ne fait pas attention.
3. Verifier qu'aucune regle editoriale n'est ambigue ; en cas de doute, remonter un message a Anthony avant Phase 1. Specifique C1.1 : confirmer que le dossier cible est `10-Cybersecurite/C1.1-Fondamentaux-Cybersec/` (tiret simple, pas cadratin).

### Phase 1, Cartographie du cluster

Objectif : planifier les 50 pages avant d'ecrire.

Actions :

1. Analyser la description et les sous-themes ci-dessus. Les 50 sous-themes listes constituent une base de travail, pas une contrainte rigide : regrouper si deux sujets se recouvrent, eclater si un sujet merite deux pages.
2. Faire un WebSearch rapide pour valider que la structure proposee est encore pertinente en 2026. Sources primaires cybersec : `nist.gov/cyberframework` (CSF 2.0), `cyber.gouv.fr` (ANSSI), `enisa.europa.eu`, `iso.org` (pour 27001/27005), `csrc.nist.gov` (SP 800-30, 800-207), `comptia.org` (Sec+ SY0-701 exam objectives), `isc2.org` (CC domains).
3. Produire une liste numerotee des 50 pages atomiques avec pour chaque :
   - Titre propose (conforme aux regles editoriales, notamment anti-cadratin sur le titre lui-meme ; preferer "CIA, les trois piliers" ou "Triade CIA" plutot qu'une formulation avec tiret long).
   - Type (voir enumeration du schema YAML : majoritairement `concept` et `terme`, avec des `methode` pour EBIOS/STRIDE/PASTA, des `protocole` ou `théorie` pour NIST CSF, un `institution` eventuel pour ANSSI/ENISA, des `controverse` possibles sur FAIR ou Zero Trust).
   - Wikilinks entrants (pages du cluster qui pointeront vers elle) et sortants (pages du cluster ou autres clusters qu'elle citera).
   - Importance (pilier, standard, deep-cut). Pages piliers attendues : `Triade CIA`, `Risque, actif, vulnerabilite, menace`, `STRIDE`, `Defense in depth`, `NIST CSF 2.0`, `EBIOS Risk Manager`, `Controles preventifs detectifs correctifs compensatoires`, `MOC`.
   - WebSearch obligatoire ou optionnel (obligatoire pour toute page citant un referentiel date, un chiffre, une certification, une directive europeenne, une institution).
4. Identifier les pages MOC (Map Of Content) du cluster : au minimum `_MOC.md` avec un schema visuel de la triade CIA enrichie et une table de navigation par theme.
5. Identifier les pages transversales avec [[C1.2-Cryptographie]], [[C1.3-Reseaux-Securite]], [[C1.4-MITRE-ATTetCK]], [[C1.9-Blue-Team]], [[C1.13-Hardening-Conformite]], [[C1.14-Social-Engineering]], [[C1.19-Roadmap-Certifs]].
6. Produire aussi `00-Meta/Plans/Plan-C1.1.md` avec la cartographie complete.

**CHECKPOINT HUMAIN 1** : presenter la cartographie complete (liste numerotee des 50 pages, statut des wikilinks, structure de dossier proposee, flags WebSearch) et attendre validation explicite d'Anthony avant de passer a la phase suivante.

### Phase 2, Fact-check cible

Pour chaque page identifiee dans la cartographie et marquee WebSearch obligatoire, lister les 2 a 5 faits dates critiques (versions de framework, dates de publication de directives, numero de SP NIST, prix de certifs, URLs officielles) qui necessitent un WebSearch avant redaction.

Actions :

1. Executer les WebSearch groupes par theme pour limiter les aller-retours. Regroupements suggeres pour C1.1 :
   - Group A, referentiels US : NIST CSF 2.0, SP 800-30 rev1, SP 800-207, Glossary CSRC.
   - Group B, referentiels FR/EU : ANSSI EBIOS RM, ENISA Threat Landscape, ISO 27005:2022, ISO 27001.
   - Group C, directives UE : NIS2, DORA, CRA, AI Act, RGPD, dates d'applicabilite.
   - Group D, threat modeling : STRIDE (Microsoft), PASTA (UcedaVelez), LINDDUN (KU Leuven), Attack Trees (Schneier).
   - Group E, certifications : Security+ SY0-701 objectifs officiels, CC ISC2 FTS Program, frais 2026.
   - Group F, statistiques : ENISA Threat Landscape 2025, Verizon DBIR 2025, ANSSI Panorama 2025.
2. Consigner les resultats dans `00-Meta/Fact-Check-Logs/Fact-Check-C1.1.md` avec format :
   ```
   - Fait : <description du fait>
     Statut : VERIFIE | NON_VERIFIE | SOURCES_CONTRADICTOIRES
     Sources : [url1, url2]
     Date_verif : 2026-MM-JJ
     Note : <commentaire si pertinent>
   ```
3. Tout fait non verifie doit etre marque dans la note finale avec `[NON_VERIFIE]` visible.

### Phase 3, Redaction des pages piliers

Rediger les pages d'importance `pilier` du cluster en appliquant strictement les regles editoriales. Lot pilier C1.1 recommande (8 pages) :

1. Triade CIA (Confidentialite, Integrite, Disponibilite).
2. Risque, actif, vulnerabilite, menace.
3. STRIDE, methodologie de threat modeling.
4. Defense in depth et principes Saltzer et Schroeder.
5. NIST CSF 2.0.
6. EBIOS Risk Manager.
7. Controles preventifs, detectifs, correctifs, compensatoires.
8. Surface d'attaque versus vecteur d'attaque versus TTP.

Criteres qualite a auto-valider sur chaque page :

- Aucun em-dash (verification syntaxique U+2014 sur la page entiere avant enregistrement).
- Frontmatter YAML conforme au schema ci-dessus, avec `cluster: "C1.1 - Fondamentaux cybersec"`, `domaine: "Cybersécurité"`, `certif_liee: ["Sec+", "CC"]` quand pertinent, `valide_jusqu_a: "2028-04-22"` pour les concepts stables ou `"2026-12-31"` pour les pages citant des chiffres reglementaires.
- Minimum 2 sources citees par page quand applicable, priorite sources primaires (NIST, ISO, ANSSI, ENISA, Microsoft, MITRE).
- Au moins 3 wikilinks sortants par page, et 7 a 12 pour les pages piliers.
- Longueur adaptee au type de page : piliers 1200 a 2000 mots, standards 800 a 1500 mots, deep-cut 600 a 1000 mots.
- Pas d'emojis sauf checkboxes `[ ]` / `[x]`.
- Priorite Edu > Open Source > Commercial avec min 2-3 alternatives par categorie d'outils. Pour les pages threat modeling et risk management : presenter le tableau Edu/OSS/Commercial systematiquement (ex : Microsoft Threat Modeling Tool (gratuit), OWASP Threat Dragon (OSS), IriusRisk (commercial avec freemium)).

**CHECKPOINT HUMAIN 2** : livrer ces 8 pages piliers et demander a Anthony de valider la qualite redactionnelle, le ton, la profondeur, avant de passer a la generation complete. Point d'attention specifique pour ce cluster : verifier que le niveau reste accessible au debutant tout en etant rigoureux, et que la terminologie FR/EN est equilibree (titres en francais, termes anglais consacres conserves dans le corps avec glose francaise).

### Phase 4, Generation complete du cluster

Apres validation checkpoint 2, generer les pages restantes (42 pages pour atteindre la cible 50). Respecter :

- Le plan cartographique valide en Phase 1.
- Les resultats de fact-check Phase 2.
- Le standard de qualite calibre Phase 3.

Ordre recommande :

1. MOC principal du cluster (`_MOC.md`) avec schema visuel triade CIA enrichie.
2. Pages piliers (deja produites en Phase 3).
3. Pages standards (methodologies de risque ISO 27005, NIST 800-30, FAIR, threat modeling PASTA, LINDDUN, Attack Trees, Parkerian Hexad, AAA, DAD, Kill chains, vocabulaire CTI).
4. Pages deep-cut (glossaires specifiques, panoramas conformite en pont vers C1.13, SSDLC, metriques, hardening standards).
5. Eventuelles pages index ou tableaux recapitulatifs (tableau de synthese des methodes de threat modeling, tableau de synthese des frameworks de risque, panorama conformite UE).

Batches recommandes : 8 a 10 pages avec rappel des regles editoriales en tete de chaque batch (Learning 2026-04-22 C2.0.6).

### Phase 5, Audit et consolidation

Produire `00-Meta/Audits/Audit-C1.1.md` contenant la verification de conformite contre les regles editoriales et le schema :

- Zero em-dash sur l'ensemble du cluster (grep automatise U+2014).
- Zero page sans frontmatter.
- Zero page sans sources quand applicable (toutes les pages citant un referentiel, une directive, un chiffre).
- Zero page orpheline (sans wikilink entrant, hors MOC).
- Toutes les cibles de wikilinks existent, ou sont listees comme fantomes legitimes dans `00-Meta/Pages-Fantomes.md` (pour les pointages vers C1.2, C1.3, C1.4, C1.9, C1.13, C1.14, C1.19 non encore redigees).
- Priorite Edu > OSS > Commercial respectee sur toutes les pages mentionnant des outils.
- Titres sans em-dash et sans formule creuse (ex : pas de "Comprendre la triade CIA" mais "Triade CIA").

### Phase 6, Debrief et pret a scaler

Produire `00-Meta/Debriefs/Debrief-C1.1.md` contenant :

- Statistiques : nombre de pages (cible 50), mots totaux, wikilinks sortants moyens par page, sources citees par page, repartition par type (concept, methode, terme, institution, protocole).
- Temps reel de generation.
- Cout tokens estime.
- Points forts du run.
- Points faibles.
- Recommandations pour le prochain cluster du meme domaine : C1.3 Reseaux et securite reseau est prioritaire (phasing Anthony Mois 1-6, clusters 1-4 : C1.1, C1.3, C1.2, C1.6 intro).
- **Nouveaux apprentissages** a pousser dans `00-Meta/Learnings.md` au format standard (Observation / Conclusion / Application). Points d'attention typiques pour ce cluster : gestion des definitions divergentes NIST/ISO, calibration niveau debutant versus exigence certif, densite wikilinks vers clusters fantomes (C1.2, C1.3, etc.).

Mettre a jour `00-Meta/Runs-Journal.md` avec les stats finales et la liste des apprentissages loggues.

**CHECKPOINT HUMAIN 3** : debrief lu par Anthony, decision :

- Continuer sur un autre cluster du domaine (candidats naturels : C1.3 Reseaux ou C1.2 Cryptographie).
- Passer a un autre domaine.
- Ajuster le prompt pilote avant de continuer.
- Arreter la phase pilote et passer au prompt de production.

---

## Sortie attendue

A la fin de l'execution complete (apres les 3 checkpoints), le dossier `10-Cybersecurite/C1.1-Fondamentaux-Cybersec/` doit contenir :

- 1 MOC principal (`_MOC.md`).
- 50 pages atomiques conformes aux regles.

Et dans `00-Meta/` :

- `Plans/Plan-C1.1.md` (Phase 1).
- `Fact-Check-Logs/Fact-Check-C1.1.md` (Phase 2).
- `Audits/Audit-C1.1.md` (Phase 5).
- `Debriefs/Debrief-C1.1.md` (Phase 6).
- `Runs-Journal.md` et `Learnings.md` mis a jour.

Le graphe Obsidian doit montrer un cluster dense, avec des ponts vers C1.2 Crypto, C1.3 Reseaux securite, C1.13 Conformite, C1.19 Roadmap certifs.

## Bibliographie et ressources specifiques au cluster

### Livres de reference

- *Computer Security: Principles and Practice* (William Stallings et Lawrie Brown), 4e edition Pearson (commercial, souvent disponible en bibliotheque universitaire ou via plan O'Reilly Learning Platform Edu). Manuel de reference academique couvrant CIA, controles, cryptographie, securite reseau.
- *Network Security Essentials* (William Stallings), Pearson (commercial). Complementaire au precedent, focus reseau mais chapitres initiaux posent bien les fondamentaux.
- *The Web Application Hacker's Handbook* (Dafydd Stuttard et Marcus Pinto), 2e edition Wiley (commercial). Chapitres 1-3 posent tres proprement les principes de surface d'attaque et de vecteur sur le web.
- *Threat Modeling: Designing for Security* (Adam Shostack), Wiley 2014 (commercial). Reference absolue sur STRIDE et le threat modeling, par l'ex-architecte securite Microsoft.
- *Measuring and Managing Information Risk: A FAIR Approach* (Jack Freund et Jack Jones), Butterworth-Heinemann 2014 (commercial). Reference sur FAIR, lire avec esprit critique (approche controversee).
- *Security Engineering* (Ross Anderson), 3e edition Wiley 2020, **disponible gratuitement en PDF** sur le site de l'auteur `cl.cam.ac.uk/~rja14/book.html` (gratuit officiel). Reference absolue, niveau avance mais premiers chapitres accessibles.

### Guides officiels et publications institutionnelles (gratuits)

- **NIST SP 800-30 rev1**, *Guide for Conducting Risk Assessments* (gratuit, `csrc.nist.gov`). Reference US sur l'analyse de risque.
- **NIST SP 800-207**, *Zero Trust Architecture* (gratuit). Reference officielle pour la page Zero Trust.
- **NIST Cybersecurity Framework 2.0** (gratuit, `nist.gov/cyberframework`). Publie fevrier 2024.
- **NIST Glossary CSRC** (IR 7298 rev3, gratuit). Dictionnaire canonique des termes cyber.
- **ANSSI EBIOS Risk Manager v1.5** (gratuit, `cyber.gouv.fr`). Methode francaise de reference.
- **ANSSI guides** (PSSIE, RGS, guides hygiene informatique, guides homologation) sur `cyber.gouv.fr/guide` (gratuits). Tres bonne lecture pour cadrage francais.
- **ENISA Threat Landscape** (rapport annuel gratuit, `enisa.europa.eu`). Pour les statistiques menaces UE.
- **Verizon DBIR** (Data Breach Investigations Report, gratuit sur `verizon.com/dbir`). Rapport annuel de reference sur les breaches reelles.
- **MITRE ATT&CK** (gratuit, `attack.mitre.org`). Pour les ponts TTP et kill chain.

### Chaines YouTube et podcasts

- **Professor Messer** (YouTube, gratuit). Cours Security+ SY0-701 complets, plusieurs centaines d'heures, references incontournables pour la preparation CompTIA.
- **IppSec** (YouTube, gratuit). Plutot oriente hands-on HTB, mais les introductions posent bien le vocabulaire.
- **Darknet Diaries** (podcast gratuit, Jack Rhysider). Histoires cyber realistes pour ancrer le vocabulaire dans des cas concrets.
- **SANS Internet Storm Center Daily Podcast** (gratuit). Veille quotidienne concise.
- **Risky Business** (podcast, Patrick Gray). Niveau pro, excellente couverture geopolitique et technique.
- **Hackademie** (YouTube, FR, gratuit). Vulgarisation francophone utile.

### Plateformes et cours en ligne

- **TryHackMe Pre Security et Complete Beginner paths** (freemium avec reduction etudiante). Parcours gratuits couvrant les fondamentaux avant d'aller sur l'offensif.
- **Cybrary Fundamentals** (freemium, `cybrary.it`). Cours Security+ gratuits.
- **Cisco Networking Academy, Introduction to Cybersecurity** (Edu gratuit via NetAcad). Certification d'attestation gratuite a l'issue.
- **ISC2 Certified in Cybersecurity (CC)** via le **One Million Certified in Cybersecurity Program** (Edu gratuit, verifier en 2026 que le programme est toujours actif sur `isc2.org/Certifications/CC`). Preparation gratuite, examen gratuit, valeur reelle sur le CV.
- **Coursera, Google Cybersecurity Professional Certificate** (Edu avec aide financiere possible, GitHub Student Pack parfois compatible). Couvre les fondamentaux proprement.
- **edX, RITx Cybersecurity Fundamentals** (Edu, audit gratuit).

### Blogs et newsletters

- **tl;dr sec** (Clint Gibler, newsletter gratuite sur `tldrsec.com`). Meilleure newsletter cyber hebdomadaire, references claires.
- **Schneier on Security** (`schneier.com`, gratuit). Bruce Schneier, createur des Attack Trees, posts regulier sur policy et threat modeling.
- **Krebs on Security** (`krebsonsecurity.com`, gratuit). Journalisme cybersec de reference.
- **CERT-FR bulletins** (`cert.ssi.gouv.fr`, gratuit). Veille FR officielle.
- **CISA alerts** (`cisa.gov`, gratuit). Veille US officielle.
- **ENISA publications** (`enisa.europa.eu`, gratuit). Publications UE.

### Outils gratuits pour pratique du threat modeling

| Outil | Type | Fiabilite | Usage |
|---|---|---|---|
| **Microsoft Threat Modeling Tool** | Gratuit (commercial sans frais) | Etoile etoile etoile etoile | STRIDE, templates applications |
| **OWASP Threat Dragon** | OSS | Etoile etoile etoile etoile | Alternative STRIDE OSS, web-based |
| **pytm** | OSS | Etoile etoile etoile | Threat modeling as code, Python |
| **IriusRisk Community** | Freemium | Etoile etoile etoile etoile | Commercial avec plan gratuit |
| **draw.io / diagrams.net** | OSS | Etoile etoile etoile | Pour dessiner les data flow diagrams |

### Certifications liees

- **CompTIA Security+ SY0-701** (commercial, frais examen environ 400 USD, reductions etudiantes parfois disponibles). Reference entry-level mondiale. Valide 3 ans avec CEU. Objectifs officiels publies sur `comptia.org`.
- **ISC2 Certified in Cybersecurity (CC)** (Edu gratuit via FTS Program, examen gratuit dans le cadre du programme One Million Certified in Cybersecurity a verifier en 2026). Valide 3 ans avec CPE.
- Certifications connexes a citer en pont vers C1.19 : **ISO 27001 Lead Implementer ou Lead Auditor** (PECB, commercial), **CISSP** (ISC2, commercial, prerequisit 5 ans experience ou Associate path), **CISM** (ISACA, commercial).

---

*Prompt pilote C1.1, genere le 2026-04-22 par Pilot Generator. Snapshots des regles pris le 2026-04-22. A executer en mode Claude Code Opus 4.7 ou Sonnet 4.6 avec fenetre 1M.*
