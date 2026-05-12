# Fix emojis in HTML files - replace question marks with appropriate emojis
$files = @("astrakhan.html", "lipetsk.html", "voronezh.html")

foreach ($file in $files) {
    Write-Host "Processing $file..." -ForegroundColor Cyan
    
    if (-not (Test-Path $file)) {
        Write-Host "  File not found!" -ForegroundColor Yellow
        continue
    }
    
    $content = Get-Content $file -Raw -Encoding UTF8
    
    # Replace scroll indicator
    $content = $content -replace '<div class="scroll-indicator">\?</div>', '<div class="scroll-indicator">⬇️</div>'
    
    # Replace feature icons based on context
    # Astrakhan specific
    if ($file -eq "astrakhan.html") {
        $content = $content -replace '<div class="feature-icon">???</div>\s*<h3>Астраханский кремль</h3>', '<div class="feature-icon">🏰</div>' + "`n" + '                     <h3>Астраханский кремль</h3>'
        $content = $content -replace '<div class="feature-icon">??</div>\s*<h3>Город мечетей</h3>', '<div class="feature-icon">🕌</div>' + "`n" + '                     <h3>Город мечетей</h3>'
        $content = $content -replace '<div class="feature-icon">??</div>\s*<h3>Дельта Волги</h3>', '<div class="feature-icon">🌊</div>' + "`n" + '                     <h3>Дельта Волги</h3>'
        $content = $content -replace '<div class="feature-icon">??</div>\s*<h3>Икорная столица</h3>', '<div class="feature-icon">🐟</div>' + "`n" + '                     <h3>Икорная столица</h3>'
        $content = $content -replace '?? Астрахань ??', '🌆 Астрахань 🌆'
        $content = $content -replace '?? Астрахань — Жемчужина Каспия ??', '🌆 Астрахань — Жемчужина Каспия 🌆'
        $content = $content -replace '?? Астрахань — жемчужина Каспия и ворота России на юг ??', '🌆 Астрахань — жемчужина Каспия и ворота России на юг 🌆'
    }
    
    # Lipetsk specific
    if ($file -eq "lipetsk.html") {
        $content = $content -replace '?? Липецк ??', '🏭 Липецк 🏭'
        $content = $content -replace '?? Липецк — Жемчужина Черноземья ??', '🏭 Липецк — Жемчужина Черноземья 🏭'
        $content = $content -replace '?? Липецк — город металлургов и курортов, гордость Черноземья ??', '🏭 Липецк — город металлургов и курортов, гордость Черноземья 🏭'
    }
    
    # Voronezh specific
    if ($file -eq "voronezh.html") {
        $content = $content -replace '\? Воронеж \?</h1>', '⚓ Воронеж ⚓</h1>'
        $content = $content -replace '?? Воронеж — Жемчужина Черноземья ??', '⚓ Воронеж — Жемчужина Черноземья ⚓'
        $content = $content -replace '?? Воронеж — колыбель русского флота и литературная столица Черноземья ??', '⚓ Воронеж — колыбель русского флота и литературная столица Черноземья ⚓'
    }
    
    # Common replacements for feature icons
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Колыбель флота</h3>', '<div class="feature-icon">⚓</div>' + "`n" + '                     <h3>Колыбель флота</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Год основания</h3>', '<div class="feature-icon">📅</div>' + "`n" + '                     <h3>Год основания</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Белый Бим</h3>', '<div class="feature-icon">🐕</div>' + "`n" + '                     <h3>Белый Бим</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Богатая история</h3>', '<div class="feature-icon">📚</div>' + "`n" + '                     <h3>Богатая история</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Футбольные традиции</h3>', '<div class="feature-icon">⚽</div>' + "`n" + '                     <h3>Футбольные традиции</h3>'
    
    # City card icons
    $content = $content -replace '??? Астраханский кремль', '🏰 Астраханский кремль'
    $content = $content -replace '\? Успенский собор', '⛪ Успенский собор'
    $content = $content -replace '?? Белая мечеть', '🕌 Белая мечеть'
    $content = $content -replace '?? Лебединое озеро', '🦢 Лебединое озеро'
    $content = $content -replace '?? Набережная Волги', '🌊 Набережная Волги'
    $content = $content -replace '?? Музей арбуза', '🍉 Музей арбуза'
    $content = $content -replace '?? Нижний парк', '🌳 Нижний парк'
    $content = $content -replace '\? Христорождественский собор', '⛪ Христорождественский собор'
    $content = $content -replace '?? Памятник Петру I', '👑 Памятник Петру I'
    $content = $content -replace '\? Площадь Победы', '🎖️ Площадь Победы'
    $content = $content -replace '??? Дом Мастера', '🏠 Дом Мастера'
    $content = $content -replace '?? Ледовый дворец', '⛸️ Ледовый дворец'
    $content = $content -replace '?? Гото Предестинация', '⚓ Гото Предестинация'
    $content = $content -replace '\? Благовещенский собор', '⛪ Благовещенский собор'
    $content = $content -replace '?? Памятник Петру I</h3>', '👑 Памятник Петру I</h3>'
    $content = $content -replace '\? Адмиралтейская площадь', '⚖️ Адмиралтейская площадь'
    $content = $content -replace '?? Памятник Белому Биму', '🐕 Памятник Белому Биму'
    $content = $content -replace '?? Кольцовский сквер', '🌳 Кольцовский сквер'
    
    # Feature icons in facts section
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Год основания</h3>', '<div class="feature-icon">📅</div>' + "`n" + '                     <h3>Год основания</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Колыбель флота</h3>', '<div class="feature-icon">⚓</div>' + "`n" + '                     <h3>Колыбель флота</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Белый Бим</h3>', '<div class="feature-icon">🐕</div>' + "`n" + '                     <h3>Белый Бим</h3>'
    
    # Transportation icons
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>На самолёте</h3>', '<div class="feature-icon">✈️</div>' + "`n" + '                     <h3>На самолёте</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>На поезде</h3>', '<div class="feature-icon">🚂</div>' + "`n" + '                     <h3>На поезде</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>На автомобиле</h3>', '<div class="feature-icon">🚗</div>' + "`n" + '                     <h3>На автомобиле</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>На теплоходе</h3>', '<div class="feature-icon">🚢</div>' + "`n" + '                     <h3>На теплоходе</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>На автобусе</h3>', '<div class="feature-icon">🚌</div>' + "`n" + '                     <h3>На автобусе</h3>'
    
    # Season icons
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Лето</h3>', '<div class="feature-icon">☀️</div>' + "`n" + '                     <h3>Лето</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Осень</h3>', '<div class="feature-icon">🍂</div>' + "`n" + '                     <h3>Осень</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Зима</h3>', '<div class="feature-icon">❄️</div>' + "`n" + '                     <h3>Зима</h3>'
    $content = $content -replace '<div class="feature-icon">\?</div>\s*<h3>Весна</h3>', '<div class="feature-icon">🌸</div>' + "`n" + '                     <h3>Весна</h3>'
    
    # Save file
    Set-Content -Path $file -Value $content -Encoding UTF8
    Write-Host "  Done." -ForegroundColor Green
}

Write-Host "All files processed!" -ForegroundColor Magenta