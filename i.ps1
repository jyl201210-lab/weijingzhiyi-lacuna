# Lacuna (未竟之意) Windows PowerShell One-Line Installer
$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
  Write-Host "[Lacuna] Node.js (>=20) is required. Install from https://nodejs.org first." -ForegroundColor Red
  exit 1
}
$NodeMajor = 0
try {
  $NodeMajor = [int]((& node -p "process.versions.node.split('.')[0]") 2>$null)
} catch {
  $NodeMajor = 0
}
if ($NodeMajor -lt 20) {
  Write-Host "[Lacuna] Node.js (>=20) is required. Please upgrade Node.js from https://nodejs.org." -ForegroundColor Red
  exit 1
}

$HomeDir = if ($env:USERPROFILE) { $env:USERPROFILE } else { $HOME }
$BinDir = Join-Path $HomeDir ".lacuna\bin"
New-Item -ItemType Directory -Force -Path $BinDir | Out-Null
$TargetMjs = Join-Path $BinDir "lacuna.mjs"
$TmpMjs = Join-Path $BinDir "lacuna.tmp.$PID.mjs"

try {
  Invoke-RestMethod -Uri "https://raw.githubusercontent.com/jyl201210-lab/weijingzhiyi-lacuna/main/dist/lacuna.mjs" -OutFile $TmpMjs
  & node $TmpMjs presets list | Out-Null
  if ($LASTEXITCODE -ne 0) {
    throw "Downloaded bundle failed verification."
  }
  Move-Item -Force -Path $TmpMjs -Destination $TargetMjs
} finally {
  if (Test-Path $TmpMjs) {
    Remove-Item -Force $TmpMjs -ErrorAction SilentlyContinue
  }
}

$Utf8NoBom = [System.Text.UTF8Encoding]::new($false)
$CmdWrapper = '@echo off' + "`r`n" + 'node "%~dp0lacuna.mjs" %*' + "`r`n" + 'exit /b %ERRORLEVEL%' + "`r`n"
[System.IO.File]::WriteAllText((Join-Path $BinDir "lacuna.cmd"), $CmdWrapper, $Utf8NoBom)

$Ps1Wrapper = '#!/usr/bin/env pwsh' + "`n" + '& node "$PSScriptRoot/lacuna.mjs" @args' + "`n" + 'exit $LASTEXITCODE' + "`n"
[System.IO.File]::WriteAllText((Join-Path $BinDir "lacuna.ps1"), $Ps1Wrapper, $Utf8NoBom)

$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if (-not ($UserPath -split ";" | Where-Object { $_ -ieq $BinDir })) {
  $NextUserPath = if ([string]::IsNullOrEmpty($UserPath)) { $BinDir } else { "$BinDir;$UserPath" }
  [Environment]::SetEnvironmentVariable("Path", $NextUserPath, "User")
}
if (-not ($env:Path -split ";" | Where-Object { $_ -ieq $BinDir })) {
  $env:Path = "$BinDir;$env:Path"
}

& node $TargetMjs install --quiet
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}
Write-Host "[Lacuna] Installed to $BinDir (Windows). Try: lacuna status" -ForegroundColor Green
