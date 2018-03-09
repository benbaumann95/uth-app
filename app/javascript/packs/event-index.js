$(".heart").on('click', function(){
  $(this).toggleClass('is_animating');
});
$('.heart').on('animationend', function(){
  $(this).toggleClass('is_animating');
});

const heart = document.querySelectorAll(".heart")
heart.forEach(heart_element => {
  heart_element.addEventListener("click", () => {
    if (heart_element.hasAttribute("style", "background-position:right;"))
      heart_element.removeAttribute ("style", "background-position:right;");
    else
    heart_element.classList.toggle("heart-clicked");
  });
});
