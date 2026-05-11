# Simple script to fix remaining HTML files
# Fixes: 1) Add styles.css link if missing, 2) Fix duplicate parallax.js

$files = @(
    "krasnoyarsk.html", "kostroma.html", "rostov-veliky.html", "ivanovo.html",
    "lipetsk.html", "pereslavl-zalessky.html", "perm.html", "veliky-novgorod.html",
    "sergiev-posad.html", "tver.html", "pskov.html", "volgograd.html",
    "ufa.html", "yaroslavl.html", "vladimir.html", "vladivostok.html",
    "voronezh.html", "suzdal.html"
)

foreach ($file in $files) {
    Write-Host "Processing $file..." -ForegroundColor Cyan
    
    if (-not (Test-Path $file)) {
        Write-Host "  File not found!" -ForegroundColor Yellow
        continue
    }
    
    $lines = Get-Content $file -Encoding UTF8
    $newLines = @()
    $styleBlock = $false
    $parallaxCount = 0
    $addedCssLink = $false
    $hasCssLink = $false
    
    # First pass - check if styles.css link exists
    foreach ($line in $lines) {
        if ($line -match 'styles\.css') {
            $hasCssLink = $true
        }
    }
    
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        
        # Skip inline style blocks
        if ($line -match '<style>') {
            $styleBlock = $true
            continue
        }
        if ($styleBlock) {
            if ($line -match '</style>') {
                $styleBlock = $false
            }
            continue
        }
        
        # Add styles.css link after title if missing
        if (-not $hasCssLink -and -not $addedCssLink -and $line -match '</title>') {
            $newLines += $line
            $newLines += '    <link rel="stylesheet" href="styles.css">'
            $addedCssLink = $true
            continue
        }
        
        # Fix duplicate parallax.js - keep only first occurrence
        if ($line -match '<script src="parallax\.js"></script>') {
            $parallaxCount++
            if ($parallaxCount -eq 1) {
                $newLines += $line
            }
            continue
        }
        
        $newLines += $line
    }
    
    # Save file
    Set-Content -Path $file -Value $newLines -Encoding UTF8
    Write-Host "  Done. CSS link added: $(-not $hasCssLink), Parallax tags found: $parallaxCount" -ForegroundColor Green
}

Write-Host "All files processed!" -ForegroundColor Magenta
