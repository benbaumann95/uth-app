import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Explore for any occasion!", "Cop a ticket in seconds", "Exclusive for Uni students"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
