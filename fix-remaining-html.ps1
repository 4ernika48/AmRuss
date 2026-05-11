# Script to fix remaining HTML files for CSS consolidation
# This script will:
# 1. Add <link rel="stylesheet" href="styles.css"> to files missing it
# 2. Remove inline <style> blocks
# 3. Fix duplicate parallax.js script tags

$filesWithStyle = @(
    "krasnoyarsk.html",
    "kostroma.html",
    "rostov-veliky.html",
    "ivanovo.html",
    "lipetsk.html",
    "pereslavl-zalessky.html",
    "perm.html",
    "veliky-novgorod.html",
    "sergiev-posad.html",
    "tver.html",
    "pskov.html",
    "volgograd.html",
    "ufa.html",
    "yaroslavl.html",
    "vladimir.html",
    "vladivostok.html",
    "voronezh.html",
    "suzdal.html"
)

foreach ($file in $filesWithStyle) {
    Write-Host "Processing $file..." -ForegroundColor Cyan
    
    if (-not (Test-Path $file)) {
        Write-Host "  File not found: $file" -ForegroundColor Yellow
        continue
    }
    
    $content = Get-Content $file -Raw -Encoding UTF8
    
    # Check if file already has styles.css link
    if ($content -notmatch '<link rel="stylesheet" href="styles\.css">') {
        # Add styles.css link after the title tag
        $content = $content -replace '(<title>.*?</title>)', '$1' + "`n    <link rel=`"stylesheet`" href=`"styles.css`">"
        Write-Host "  Added styles.css link" -ForegroundColor Green
    }
    
    # Remove inline <style> block (from <style> to </style>)
    $originalContent = $content
    $content = $content -replace '(?s)\s*<style>.*?</style>' , ''
    
    if ($originalContent -ne $content) {
        Write-Host "  Removed inline <style> block" -ForegroundColor Green
    }
    
    # Fix duplicate parallax.js tags - keep only the first one
    # Pattern: multiple consecutive <script src="parallax.js"></script> tags
    $content = $content -replace '(?s)(<script src="parallax\.js"></script>\s*){2,}', '<script src="parallax.js"></script>' + "`n"
    
    # Save the file
    Set-Content -Path $file -Value $content -Encoding UTF8
    Write-Host "  Saved $file" -ForegroundColor Green
    Write-Host ""
}

Write-Host "All files processed!" -ForegroundColor Magenta
