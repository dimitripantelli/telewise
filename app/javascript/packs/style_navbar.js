window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  let homeNavbar = document.querySelector(".home-navbar")
  if (document.body.scrollTop > 1300 || document.documentElement.scrollTop > 500) {
    homeNavbar.style.display = "flex";
  } else {
    homeNavbar.style.display = "none";
  }
}
