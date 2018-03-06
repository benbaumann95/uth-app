import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Explore for any Occasion!", "Cop a ticket in Seconds", "Safe and Secure", "Exclusive for Uni Students"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
