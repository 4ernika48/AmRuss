(() => {
  const reduceMotion =
    window.matchMedia &&
    window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  if (reduceMotion) return;

  const els = Array.from(
    document.querySelectorAll(
      "img.city-image, img.golden-ring-image, img[data-parallax]"
    )
  );
  if (!els.length) return;

  const clamp = (v, min, max) => Math.min(max, Math.max(min, v));

  let raf = 0;
  const update = () => {
    raf = 0;
    const vh = window.innerHeight || 0;
    for (const el of els) {
      const rect = el.getBoundingClientRect();
      if (rect.bottom < -50 || rect.top > vh + 50) continue;

      const speedAttr = Number(el.getAttribute("data-parallax-speed"));
      const speed = Number.isFinite(speedAttr) ? speedAttr : 1;

      const maxShiftAttr = Number(el.getAttribute("data-parallax-shift"));
      const maxShift = Number.isFinite(maxShiftAttr) ? maxShiftAttr : 26;

      const center = rect.top + rect.height / 2;
      const progress = (center - vh / 2) / (vh / 2 + rect.height / 2);
      const y = clamp(-progress, -1, 1) * maxShift * speed;

      el.style.setProperty("--parallax-y", `${y.toFixed(2)}px`);
    }
  };

  const requestUpdate = () => {
    if (raf) return;
    raf = window.requestAnimationFrame(update);
  };

  window.addEventListener("scroll", requestUpdate, { passive: true });
  window.addEventListener("resize", requestUpdate);

  requestUpdate();
})();

