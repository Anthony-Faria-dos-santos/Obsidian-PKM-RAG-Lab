# Installation

Setup complet du labo, depuis un poste vierge. Cible : Windows 11 + PowerShell 7+. Adaptable bash sans souci.

## Prérequis

- **Claude Code CLI** installé. Doc officielle : https://docs.claude.com.
- **Modèle** Opus 4.7 (`claude-opus-4-7`) ou Sonnet 4.6 1M (`claude-sonnet-4-6[1m]`). Le contexte 1M n'est pas négociable pour la génération de clusters lourds.
- **Git** configuré, identité posée (`git config --global user.name` et `user.email`).
- **PowerShell 7+** sous Windows. `pwsh --version` doit répondre.
- **Obsidian** pour la consultation du résultat. Pas requis pour la génération elle-même.
- Optionnel : un moteur RAG local si tu attaques le banc d'essai (LlamaIndex, LangChain, Haystack au choix).

## Cloner et bootstrap

```powershell
cd "C:\Users\<ton-user>\Sandbox-lite\AI_Workshop"
git clone <url-du-repo> obsidian-Brain
cd obsidian-Brain
```

## Initialiser pilot-gen

Le sous-projet `pilot-gen/` a besoin des cinq curriculums sources. Si tu les as ailleurs sur le poste, copie-les ou crée des liens symboliques.

```powershell
cd pilot-gen
Copy-Item "C:\chemin\vers\curriculums\*.md" .\curriculums\
```

Ensuite, lance Claude Code dans le dossier avec un modèle 1M :

```powershell
claude --model claude-opus-4-7
# ou
claude --model "claude-sonnet-4-6[1m]"
```

Au démarrage, Claude Code lit automatiquement `pilot-gen/CLAUDE.md` et `pilot-gen/STATUS.md`. Il affiche un résumé de session et propose la suite.

## Vérifier que ça tourne

Une fois Claude Code lancé dans `pilot-gen/`, tape :

```
/etat
```

Tu dois voir un tableau ASCII avec le décompte par domaine et par statut. Si la commande n'est pas reconnue, c'est que `.claude/commands/` n'a pas été cloné correctement.

## Résolution de problèmes courants

- **Cluster introuvable au lancement de `/nouveau-pilote`** : vérifier `catalogue/clusters.yaml`, l'ID exact (sensible à la casse), et que le YAML parse sans erreur.
- **Curriculum introuvable** : `curriculums/` doit contenir les cinq fichiers `01-Developer-2026-Curriculum.md` à `05-Reseaux-Cert-Roadmap.md`. Les noms exacts sont attendus.
- **Template manquant** : `template/PROMPT-PILOT-TEMPLATE.md`, `template/CHECKLIST-QC.md` et `template/EXEMPLE-C2.0.6.md` doivent tous être présents. Si un manque, c'est bloquant. Réinitialiser via `scripts/init.ps1`.
