# init.ps1, Bootstrap PowerShell du projet pilot-generator
# Usage : .\scripts\init.ps1

[CmdletBinding()]
param(
    [Parameter(Mandatory = $false)]
    [string]$VaultPath = "C:\Users\Anthony\Obsidian\SecondBrain-Anthony",

    [Parameter(Mandatory = $false)]
    [string]$CurriculumsSource = "C:\Users\Anthony\Documents\curriculums",

    [Parameter(Mandatory = $false)]
    [switch]$SkipGit,

    [Parameter(Mandatory = $false)]
    [switch]$SkipCurriculums
)

$ErrorActionPreference = "Stop"
$projectRoot = Split-Path -Parent $PSScriptRoot

Write-Host "Pilot Generator, bootstrap" -ForegroundColor Cyan
Write-Host "Project root : $projectRoot" -ForegroundColor Gray
Write-Host ""

# 1. Verifier la structure
$expectedDirs = @(
    ".claude/commands",
    ".claude/agents",
    "catalogue",
    "template",
    "curriculums",
    "generated/D1-Cybersec",
    "generated/D2-Dev",
    "generated/D3-Cloud",
    "generated/D4-IA-ML",
    "generated/D5-Reseaux",
    "scripts"
)

foreach ($dir in $expectedDirs) {
    $path = Join-Path $projectRoot $dir
    if (-not (Test-Path $path)) {
        Write-Host "  Creation : $dir" -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $path -Force | Out-Null
    }
}

# 2. Verifier les fichiers cles
$expectedFiles = @(
    "CLAUDE.md",
    "README.md",
    "STATUS.md",
    "CHANGELOG.md",
    ".gitignore",
    "catalogue/clusters.yaml",
    "catalogue/schema.md",
    "template/PROMPT-PILOT-TEMPLATE.md",
    "template/CHECKLIST-QC.md"
)

$missing = @()
foreach ($file in $expectedFiles) {
    $path = Join-Path $projectRoot $file
    if (-not (Test-Path $path)) {
        $missing += $file
    }
}

if ($missing.Count -gt 0) {
    Write-Warning "Fichiers manquants :"
    $missing | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
    Write-Warning "Recopier le contenu depuis le dossier output Cowork"
    exit 1
}
else {
    Write-Host "Structure : OK" -ForegroundColor Green
}

# 3. Copier les curriculums si demande
if (-not $SkipCurriculums) {
    Write-Host ""
    Write-Host "Copie des curriculums depuis $CurriculumsSource" -ForegroundColor Cyan
    if (Test-Path $CurriculumsSource) {
        $cursorDest = Join-Path $projectRoot "curriculums"
        $curriculumFiles = @(
            "01-Developer-2026-Curriculum.md",
            "02-Cybersec-Curriculum.md",
            "03-Cloud-Curriculum.md",
            "04-AI-ML-Curriculum.md",
            "05-Reseaux-Cert-Roadmap.md"
        )
        foreach ($file in $curriculumFiles) {
            $src = Join-Path $CurriculumsSource $file
            $dst = Join-Path $cursorDest $file
            if (Test-Path $src) {
                Copy-Item -Path $src -Destination $dst -Force
                Write-Host "  Copie : $file" -ForegroundColor Green
            }
            else {
                Write-Warning "  Source introuvable : $file (ignore)"
            }
        }
    }
    else {
        Write-Warning "CurriculumsSource introuvable : $CurriculumsSource (etape ignoree)"
    }
}

# 4. Initialiser Git si demande
if (-not $SkipGit) {
    Write-Host ""
    Write-Host "Initialisation Git" -ForegroundColor Cyan
    Set-Location $projectRoot
    if (-not (Test-Path (Join-Path $projectRoot ".git"))) {
        git init | Out-Null
        git add .
        git commit -m "chore: bootstrap pilot-generator project" | Out-Null
        Write-Host "  Git initialise et premier commit effectue" -ForegroundColor Green
    }
    else {
        Write-Host "  Repo Git deja present" -ForegroundColor Gray
    }
}

# 5. Ecrire la variable d'environnement
Write-Host ""
Write-Host "Mise a jour settings.local.json avec VaultPath=$VaultPath" -ForegroundColor Cyan
$settingsPath = Join-Path $projectRoot ".claude/settings.local.json"
if (Test-Path $settingsPath) {
    $settings = Get-Content $settingsPath -Raw | ConvertFrom-Json
    $settings.env.PILOT_GENERATOR_VAULT_PATH = $VaultPath
    $settings | ConvertTo-Json -Depth 10 | Set-Content $settingsPath -Encoding UTF8
    Write-Host "  settings.local.json : OK" -ForegroundColor Green
}

# 6. Afficher les prochaines etapes
Write-Host ""
Write-Host "Bootstrap termine" -ForegroundColor Green
Write-Host ""
Write-Host "Prochaines etapes :" -ForegroundColor Cyan
Write-Host "  1. Copier PROMPT-PILOT-C2.0.6-Collaboration-IA.md comme template/EXEMPLE-C2.0.6.md"
Write-Host "  2. Lancer Claude Code : claude --model claude-opus-4-7"
Write-Host "  3. Executer : /etat pour voir le tableau de bord"
Write-Host "  4. Executer : /next pour avoir les 3 prochains clusters suggeres"
Write-Host "  5. Executer : /nouveau-pilote <ID> pour generer le premier prompt pilote"
Write-Host ""
