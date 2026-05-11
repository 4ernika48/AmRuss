$ErrorActionPreference = 'Stop'

Set-Location -LiteralPath $PSScriptRoot

$targets = @(
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

if (!(Test-Path -LiteralPath 'kazan.html')) {
  @'
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-16">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Казань - Третья столица России</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden;
            background: linear-gradient(to bottom, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            color: #fff;
        }

        .forest-bg {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            z-index: -1;
            background: radial-gradient(ellipse at bottom, #1B2735 0%, #090A0F 100%);
            overflow: hidden;
        }

        .tree {
            position: absolute;
            bottom: 0;
            width: 0; height: 0;
            border-left: 50px solid transparent;
            border-right: 50px solid transparent;
            border-bottom: 200px solid #0d1f0d;
            animation: sway 4s ease-in-out infinite;
            opacity: 0.8;
        }

        .tree:nth-child(1) { left: 5%; animation-delay: 0s; }
        .tree:nth-child(2) { left: 15%; animation-delay: 0.5s; border-bottom-color: #1a3d1a; }
        .tree:nth-child(3) { left: 25%; animation-delay: 1s; }
        .tree:nth-child(4) { left: 35%; animation-delay: 1.5s; border-bottom-color: #0f2f0f; }
        .tree:nth-child(5) { left: 45%; animation-delay: 2s; }
        .tree:nth-child(6) { left: 55%; animation-delay: 0.3s; border-bottom-color: #1a3d1a; }
        .tree:nth-child(7) { left: 65%; animation-delay: 0.8s; }
        .tree:nth-child(8) { left: 75%; animation-delay: 1.3s; border-bottom-color: #0d1f0d; }
        .tree:nth-child(9) { left: 85%; animation-delay: 1.8s; }
        .tree:nth-child(10) { left: 95%; animation-delay: 2.3s; border-bottom-color: #1a3d1a; }

        @keyframes sway { 0%, 100% { transform: rotate(-2deg); } 50% { transform: rotate(2deg); } }

        .fog {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 300px;
            background: linear-gradient(to top, rgba(255,255,255,0.1), transparent);
            animation: fogMove 20s linear infinite;
        }

        @keyframes fogMove { 0% { transform: translateX(-100px); } 100% { transform: translateX(100px); } }

        .stars {
            position: fixed;
            top: 0; left: 0;
            width: 100%;
            height: 60%;
            z-index: -1;
        }

        .star {
            position: absolute;
            background: white;
            border-radius: 50%;
            animation: twinkle 3s infinite;
        }

        @keyframes twinkle { 0%, 100% { opacity: 0.3; } 50% { opacity: 1; } }

        header {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 2rem;
            position: relative;
        }

        h1 {
            font-size: 4rem;
            margin-bottom: 1rem;
            background: linear-gradient(45deg, #00ff87, #60efff, #00ff87);
            background-size: 200% auto;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: shine 3s linear infinite;
            text-shadow: 0 0 30px rgba(0, 255, 135, 0.5);
        }

        @keyframes shine { to { background-position: 200% center; } }

        .subtitle {
            font-size: 1.5rem;
            color: #a0a0a0;
            margin-bottom: 2rem;
            animation: fadeInUp 2s ease;
        }

        @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }

        .scroll-indicator {
            position: absolute;
            bottom: 30px;
            animation: bounce 2s infinite;
            font-size: 2rem;
            color: #00ff87;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-20px); }
            60% { transform: translateY(-10px); }
        }

        .container { max-width: 1200px; margin: 0 auto; padding: 4rem 2rem; }

        .section {
            margin-bottom: 6rem;
            opacity: 0;
            transform: translateY(50px);
            transition: all 0.8s ease;
        }

        .section.visible { opacity: 1; transform: translateY(0); }

        .section-title {
            font-size: 2.5rem;
            margin-bottom: 2rem;
            color: #00ff87;
            text-align: center;
            position: relative;
            display: inline-block;
            left: 50%;
            transform: translateX(-50%);
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, transparent, #00ff87, transparent);
        }

        .about-text {
            font-size: 1.2rem;
            line-height: 1.8;
            text-align: center;
            max-width: 900px;
            margin: 0 auto 3rem;
            color: #d0d0d0;
        }

        .cities-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .city-card {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
            animation: fadeInUp 1s ease;
            display: flex;
            flex-direction: column;
        }

        .city-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0, 255, 135, 0.2);
            border-color: #00ff87;
        }

        .city-image {
            width: 100%;
            height: 260px;
            object-fit: cover;
            --parallax-y: 0px;
            --img-scale: 1;
            transform: translate3d(0, var(--parallax-y), 0) scale(var(--img-scale));
            will-change: transform;
            transition: transform 0.5s ease;
            display: block;
        }

        .city-card:hover .city-image { --img-scale: 1.05; }

        .city-content { padding: 1.5rem; flex-grow: 1; display: flex; flex-direction: column; }
        .city-name { font-size: 1.5rem; color: #00ff87; margin-bottom: 0.5rem; }
        .city-description { color: #a0a0a0; line-height: 1.6; font-size: 0.95rem; }

        footer {
            background: rgba(0, 0, 0, 0.5);
            text-align: center;
            padding: 3rem 2rem;
            margin-top: 6rem;
            border-top: 1px solid rgba(0, 255, 135, 0.3);
        }

        .footer-text { color: #808080; font-size: 1.1rem; }

        @media (max-width: 768px) {
            h1 { font-size: 2.5rem; }
            .section-title { font-size: 2rem; }
            .cities-grid { grid-template-columns: 1fr; }
            .city-image { height: 220px; }
        }
    </style>
</head>
<body>
    <div class="forest-bg">
        <div class="stars" id="stars"></div>
        <div class="tree"></div><div class="tree"></div><div class="tree"></div><div class="tree"></div><div class="tree"></div>
        <div class="tree"></div><div class="tree"></div><div class="tree"></div><div class="tree"></div><div class="tree"></div>
        <div class="fog"></div>
    </div>

    <header>
        <h1>🕌 Казань 🕌</h1>
        <p class="subtitle">Город, где встречаются Восток и Запад</p>
        <div class="scroll-indicator">⬇</div>
    </header>

    <div class="container">
        <section class="section" id="about">
            <h2 class="section-title">Добро пожаловать в Казань</h2>
            <p class="about-text">
                Казань — столица Татарстана и один из самых красивых городов России. Здесь гармонично
                сочетаются древняя история, современная архитектура и богатая культура.
            </p>
        </section>

        <section class="section">
            <h2 class="section-title">Главные достопримечательности</h2>
            <div class="cities-grid">
                <div class="city-card">
                    <img class="city-image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Kazan_Kremlin_2021.jpg/1024px-Kazan_Kremlin_2021.jpg" alt="Казанский Кремль">
                    <div class="city-content">
                        <h3 class="city-name">🏰 Казанский Кремль</h3>
                        <p class="city-description">Древняя крепость, объект ЮНЕСКО, сердце исторической Казани.</p>
                    </div>
                </div>
                <div class="city-card">
                    <img class="city-image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Kul_Sharif_Mosque_in_Kazan_2021.jpg/1024px-Kul_Sharif_Mosque_in_Kazan_2021.jpg" alt="Мечеть Кул-Шариф">
                    <div class="city-content">
                        <h3 class="city-name">🕌 Кул-Шариф</h3>
                        <p class="city-description">Одна из крупнейших мечетей Европы, символ современного Татарстана.</p>
                    </div>
                </div>
                <div class="city-card">
                    <img class="city-image" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Bauman_Street_in_Kazan.jpg/1024px-Bauman_Street_in_Kazan.jpg" alt="Улица Баумана">
                    <div class="city-content">
                        <h3 class="city-name">🚶 Улица Баумана</h3>
                        <p class="city-description">Главная пешеходная улица — кафе, магазины и атмосфера города.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <footer>
        <p class="footer-text">
            🌟 Казань — третья столица России и жемчужина Поволжья 🌟<br>
            © 2026 Проект "Удивительная Россия"
        </p>
    </footer>

    <script>
        const starsContainer = document.getElementById('stars');
        for (let i = 0; i < 100; i++) {
            const star = document.createElement('div');
            star.className = 'star';
            star.style.width = Math.random() * 3 + 'px';
            star.style.height = star.style.width;
            star.style.left = Math.random() * 100 + '%';
            star.style.top = Math.random() * 100 + '%';
            star.style.animationDelay = Math.random() * 3 + 's';
            starsContainer.appendChild(star);
        }

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => entry.isIntersecting && entry.target.classList.add('visible'));
        }, { threshold: 0.1, rootMargin: "0px 0px -50px 0px" });
        document.querySelectorAll('.section').forEach(section => observer.observe(section));

        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            document.querySelectorAll('.tree').forEach((tree, index) => {
                const speed = 0.5 + (index * 0.1);
                tree.style.transform = `translateY(${scrolled * speed}px)`;
            });
        });
    </script>
    <script src="parallax.js"></script>
</body>
</html>
'@ | Set-Content -LiteralPath 'kazan.html' -Encoding Unicode
}

$reCityBase  = [regex]::new('(?s)(\.city-image\s*\{[\s\S]*?object-fit:\s*cover;)(\s*\r?\n\s*)transition:\s*transform\s*0\.5s\s*ease;')
$reCityHover = [regex]::new('(?s)(\.city-card:hover\s+\.city-image\s*\{[\s\S]*?)transform:\s*scale\((?<s>[0-9.]+)\);')

$reGoldBase  = [regex]::new('(?s)(\.golden-ring-image\s*\{[\s\S]*?)transition:\s*transform\s*0\.3s\s*ease;')
$reGoldHover = [regex]::new('(?s)(\.golden-ring-image:hover\s*\{[\s\S]*?)transform:\s*scale\((?<s>[0-9.]+)\);')

$reBodyClose = [regex]::new("\r?\n</body>")

$cityBaseReplacement = '$1$2--parallax-y: 0px;$2--img-scale: 1;$2transform: translate3d(0, var(--parallax-y), 0) scale(var(--img-scale));$2will-change: transform;$2transition: transform 0.5s ease;'
$cityHoverReplacement = '$1--img-scale: ${s};'

$goldBaseReplacement = '$1--parallax-y: 0px;' + "`r`n" +
  '            --img-scale: 1;' + "`r`n" +
  '            transform: translate3d(0, var(--parallax-y), 0) scale(var(--img-scale));' + "`r`n" +
  '            will-change: transform;' + "`r`n" +
  '            transition: transform 0.3s ease;'
$goldHoverReplacement = '$1--img-scale: ${s};'

$insertScript = "`r`n    <script src=""parallax.js""></script>`r`n</body>"

foreach ($f in $targets) {
  if (!(Test-Path -LiteralPath $f)) { continue }

  $html = Get-Content -LiteralPath $f -Raw

  if ($html -notmatch '--parallax-y') {
    $html = $reCityBase.Replace($html, $cityBaseReplacement)
    $html = $reCityHover.Replace($html, $cityHoverReplacement)
    $html = $reGoldBase.Replace($html, $goldBaseReplacement)
    $html = $reGoldHover.Replace($html, $goldHoverReplacement)
  }

  if ($html -notmatch '<script\s+src=""parallax\.js""') {
    $html = $reBodyClose.Replace($html, $insertScript, 1)
  }

  Set-Content -LiteralPath $f -Value $html -Encoding utf8
}

Write-Host \"Updated pages: $($targets.Count)\"

