$ErrorActionPreference = 'Stop'

Set-Location -LiteralPath $PSScriptRoot

$keep = @(
  'index.html',
  'moscow.html',
  'saint-petersburg.html',
  'kazan.html',
  'yekaterinburg.html',
  'sochi.html',
  'novosibirsk.html',
  'volgograd.html',
  'krasnoyarsk.html',
  'vladivostok.html',
  'veliky-novgorod.html',
  'pskov.html',
  'kostroma.html',
  'lipetsk.html',
  'perm.html',
  'astrakhan.html',
  'ufa.html',
  'voronezh.html',
  'tver.html',
  'vladimir.html',
  'suzdal.html',
  'yaroslavl.html',
  'rostov-veliky.html',
  'pereslavl-zalessky.html',
  'sergiev-posad.html',
  'ivanovo.html'
)

Get-ChildItem -File -Filter '*.html' | ForEach-Object {
  if ($keep -contains $_.Name) { return }

  $base = $_.BaseName
  $ext = $_.Extension

  if ($base -match 'недоделано$') { return }

  $newName = "$base недоделано$ext"
  if (Test-Path -LiteralPath $newName) {
    $i = 2
    while (Test-Path -LiteralPath ("$base недоделано ($i)$ext")) {
      $i = $i + 1
    }
    $newName = "$base недоделано ($i)$ext"
  }

  Rename-Item -LiteralPath $_.FullName -NewName $newName
}

Write-Host 'Done'

