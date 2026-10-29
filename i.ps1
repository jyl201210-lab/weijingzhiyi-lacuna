# Lacuna (未竟之意) Windows PowerShell One-Line Installer
$ErrorActionPreference = "Stop"
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  Write-Host "[Lacuna] Node.js (>=20) is required. Install from https://nodejs.org first." -ForegroundColor Red
  exit 1
}
$BinDir = Join-Path $HOME ".lacuna\bin"
New-Item -ItemType Directory -Force -Path $BinDir | Out-Null
$TargetMjs = Join-Path $BinDir "lacuna.mjs"
Invoke-RestMethod -Uri "https://jyl201210-lab.github.io/weijingzhiyi-lacuna/dist/lacuna.mjs" -OutFile $TargetMjs

Set-Content -Path (Join-Path $BinDir "lacuna.cmd") -Encoding ASCII -Value "@echo off`r`nnode `"%~dp0lacuna.mjs`" %*`r`n"
Set-Content -Path (Join-Path $BinDir "lacuna.ps1") -Encoding UTF8 -Value "#!/usr/bin/env pwsh`n& node `"$PSScriptRoot/lacuna.mjs`" @args`nexit $LASTEXITCODE`n"

$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if (-not ($UserPath -split ";" | Where-Object { $_ -eq $BinDir })) {
  [Environment]::SetEnvironmentVariable("Path", "$BinDir;$UserPath", "User")
}
if (-not ($env:Path -split ";" | Where-Object { $_ -eq $BinDir })) {
  $env:Path = "$BinDir;$env:Path"
}

& node $TargetMjs install --quiet
Write-Host "[Lacuna] Installed to $BinDir (Windows). Try: lacuna help" -ForegroundColor Green
