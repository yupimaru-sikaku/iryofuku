document.addEventListener('DOMContentLoaded', () => {

  ScrollReveal().reveal('.iryo-description', {
    duration: 1600, 
    origin: 'top', 
    distance: '50px',
    reset: false
  });

  ScrollReveal().reveal('.service-flow', {
    duration: 1600, 
    origin: 'left', 
    distance: '50px',
    reset: false
  });

  ScrollReveal().reveal('.contact', {
    duration: 1600, 
    origin: 'right', 
    distance: '50px',
    reset: false  
  });
});

