// Smooth interactions, reveal on scroll, counters and simple form handling
document.addEventListener('DOMContentLoaded', function () {
  // Mobile nav toggle
  const hamburger = document.getElementById('hamburger');
  const nav = document.getElementById('nav');
  hamburger && hamburger.addEventListener('click', () => {
    nav.style.display = nav.style.display === 'flex' ? '' : 'flex';
    if (nav.style.display === 'flex') {
      nav.style.flexDirection = 'column';
      nav.style.position = 'absolute';
      nav.style.right = '18px';
      nav.style.top = '70px';
      nav.style.background = 'rgba(0,0,0,0.6)';
      nav.style.padding = '12px';
      nav.style.borderRadius = '10px';
    }
  });

  // Intersection Observer for reveal
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if(entry.isIntersecting){
        entry.target.classList.add('is-visible');
      }
    });
  }, {threshold: 0.15});

  document.querySelectorAll('.reveal').forEach(el => observer.observe(el));

  // Animated counters
  function animateCounters() {
    document.querySelectorAll('.stat-num').forEach(el => {
      const target = +el.getAttribute('data-target') || 0;
      let current = 0;
      const step = Math.max(1, Math.floor(target / 60));
      const interval = setInterval(() => {
        current += step;
        if (current >= target) {
          el.textContent = target;
          clearInterval(interval);
        } else {
          el.textContent = current;
        }
      }, 16);
    });
  }

  // Trigger counters when stats visible
  const statsEl = document.querySelector('.hero-stats');
  if (statsEl) {
    const statsObserver = new IntersectionObserver((entries, o) => {
      entries.forEach(e => {
        if (e.isIntersecting) {
          animateCounters();
          o.disconnect();
        }
      });
    }, {threshold: 0.5});
    statsObserver.observe(statsEl);
  }

  // Form handling
  const form = document.getElementById('contactForm');
  const toast = document.getElementById('toast');
  form && form.addEventListener('submit', (e) => {
    e.preventDefault();
    showToast('Спасибо! Ваша заявка отправлена — мы свяжемся в ближайшее время.');
    form.reset();
  });

  document.getElementById('demoBtn')?.addEventListener('click', () => {
    showToast('Запрос на демо отправлен. Мы перезвоним для согласования времени.');
  });

  function showToast(msg){
    toast.textContent = msg;
    toast.style.opacity = '1';
    toast.style.transform = 'translateY(0)';
    setTimeout(()=> {
      toast.style.opacity = '0';
      toast.style.transform = 'translateY(20px)';
    }, 3800);
  }

  // Update year
  document.getElementById('year').textContent = new Date().getFullYear();
});
