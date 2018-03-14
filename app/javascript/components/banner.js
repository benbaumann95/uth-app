import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Fast. Simple. Secure."],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };


