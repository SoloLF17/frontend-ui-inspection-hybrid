# install/install.ps1  (complete)
$ErrorActionPreference = "Stop"

$Repo = if ($env:REPO) { $env:REPO } else { "SoloLF17/frontend-ui-inspection-hybrid" }
$Branch = if ($env:BRANCH) { $env:BRANCH } else { "main" }
$SkillSubpath = if ($env:SKILL_SUBPATH) { $env:SKILL_SUBPATH } else { "frontend-ui-inspection-hybrid/complete" }
$SkillName = if ($env:SKILL_NAME) { $env:SKILL_NAME } else { "frontend-ui-inspection" }
$TargetBase = if ($env:TARGET_BASE) { $env:TARGET_BASE } else { Join-Path $HOME ".config\opencode\skills" }
$Target = Join-Path $TargetBase $SkillName
$BaseUrl = if ($env:BASE_URL) { $env:BASE_URL } else { "https://raw.githubusercontent.com/$Repo/$Branch/$SkillSubpath" }

$Files = @(
  "skill/frontend-ui-inspection/SKILL.md",
  "skill/frontend-ui-inspection/README.md",
  "agents/agent-integration.md",
  "config/opencode.config.snippet.json"
)

Write-Host "Baixando skill (complete) '$SkillName'..."
foreach ($f in $Files) {
  $rel = $f -replace "^skill/frontend-ui-inspection/", ""
  if ($rel -eq $f) { $rel = $f }
  $out = Join-Path $Target $rel
  $dir = Split-Path $out -Parent
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $url = "$BaseUrl/$f"
  Write-Host "  -> $rel"
  Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing
}
Write-Host "Instalacao concluida em: $Target"