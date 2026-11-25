# Builds a Release DLL and zips it in the layout SPT expects (BepInEx/plugins/...).
$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot

dotnet build -c Release
if ($LASTEXITCODE -ne 0) { throw 'Build failed' }

$version = ([xml](Get-Content .\TurretTweaks.csproj)).Project.PropertyGroup |
    ForEach-Object { $_.Version } | Where-Object { $_ } | Select-Object -First 1

$stage = Join-Path $PSScriptRoot 'dist\stage'
Remove-Item (Join-Path $PSScriptRoot 'dist') -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Force (Join-Path $stage 'BepInEx\plugins') | Out-Null
Copy-Item 'bin\Release\net471\TurretTweaks.dll' (Join-Path $stage 'BepInEx\plugins')

$zip = Join-Path $PSScriptRoot "dist\TurretTweaks-$version.zip"
Compress-Archive -Path (Join-Path $stage '*') -DestinationPath $zip
Remove-Item $stage -Recurse -Force

Write-Host "Created $zip"
