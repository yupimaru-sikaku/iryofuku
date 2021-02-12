document.addEventListener('DOMContentLoaded', () => {

  ScrollReveal().reveal('.kuraseru-description', {
    duration: 1600, 
    origin: 'top', 
    distance: '50px',
    reset: true   
  });

  ScrollReveal().reveal('.service-flow', {
    duration: 1600, 
    origin: 'left', 
    distance: '50px',
    reset: true   
  });

  ScrollReveal().reveal('.contact', {
    duration: 1600, 
    origin: 'right', 
    distance: '50px',
    reset: true   
  });
});