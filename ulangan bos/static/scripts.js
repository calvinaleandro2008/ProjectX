// scripts.js

document.addEventListener('DOMContentLoaded', function () {
    // Scroll event for navbar background change
    window.addEventListener('scroll', function () {
        var navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.classList.add('scrolled');
        } else {
            navbar.classList.remove('scrolled');
        }
    });
});
