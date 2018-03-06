function initUpdateNavbarOnScroll() {
  const navbar = document.querySelector('.navbar-wagon');
  window.addEventListener('scroll', () => {
    if (window.scrollY >= window.innerHeight) {
      navbar.classList.add('navbar-wagon-black');
    } else {
      navbar.classList.remove('navbar-wagon-black');
    }
  });
}

export { initUpdateNavbarOnScroll };


$(window).scroll(
{
  previousTop: 0
},
function () {
  var currentTop = $(window).scrollTop();
  if (currentTop < this.previousTop) {

    $(".navbar-wagon").show();
  } else {

    $(".navbar-wagon").hide();
  }
  this.previousTop = currentTop;
});
