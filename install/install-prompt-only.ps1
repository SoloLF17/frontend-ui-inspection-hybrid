# install/install-prompt-only.ps1
$ErrorActionPreference = "Stop"

$Repo = if ($env:REPO) { $env:REPO } else { "SoloLF17/frontend-ui-inspection-hybrid" }
$Branch = if ($env:BRANCH) { $env:BRANCH } else { "main" }
$SkillSubpath = if ($env:SKILL_SUBPATH) { $env:SKILL_SUBPATH } else { "frontend-ui-inspection-hybrid/prompt-only" }
$SkillName = if ($env:SKILL_NAME) { $env:SKILL_NAME } else { "frontend-ui-inspection-prompt-only" }
$TargetBase = if ($env:TARGET_BASE) { $env:TARGET_BASE } else { Join-Path $HOME ".config\opencode\skills" }
$Target = Join-Path $TargetBase $SkillName
$BaseUrl = if ($env:BASE_URL) { $env:BASE_URL } else { "https://raw.githubusercontent.com/$Repo/$Branch/$SkillSubpath" }

$Files = @("SKILL.md","README.skill.md","SYSTEM_PROMPT.txt","agents/agent-integration.md")

New-Item -ItemType Directory -Force -Path (Join-Path $Target "agents") | Out-Null
foreach ($f in $Files) {
  $out = Join-Path $Target $f
  $dir = Split-Path $out -Parent
  if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $url = "$BaseUrl/$f"
  Write-Host "  -> $f"
  Invoke-WebRequest -Uri $url -OutFile $out -UseBasicParsing
}
Write-Host "Instalacao concluida em: $Target"