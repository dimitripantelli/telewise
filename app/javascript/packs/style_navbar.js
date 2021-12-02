window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  let homeNavbar = document.querySelector(".home-navbar")
  if (document.body.scrollTop > 720 || document.documentElement.scrollTop > 720) {
    homeNavbar.style.backgroundColor = "#171717";
  } else {
    homeNavbar.style.backgroundColor = "171717";
  }
}
