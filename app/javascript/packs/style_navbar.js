window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  let homeNavbar = document.querySelector(".home-navbar")
  if (document.body.scrollTop > 720 || document.documentElement.scrollTop > 720) {
    homeNavbar.style.display = "flex";
  } else {
    homeNavbar.style.display = "none";
  }
}
