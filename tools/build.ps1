$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$build = Join-Path $root 'build'
New-Item -ItemType Directory -Force -Path $build | Out-Null

& sdasz80 -plosgff (Join-Path $root 'src/main.asm')
if ($LASTEXITCODE -ne 0) { throw 'Assembly failed.' }

$rel = Join-Path $root 'src/main.rel'
$ihx = Join-Path $build 'sms-nero-adventure.ihx'
& sdldz80 -n -i $ihx $rel
if ($LASTEXITCODE -ne 0) { throw 'Linking failed.' }

& ihx2sms $ihx (Join-Path $build 'sms-nero-adventure.sms')
if ($LASTEXITCODE -ne 0) { throw 'ROM conversion failed.' }

Write-Host 'Created build/sms-nero-adventure.sms'
