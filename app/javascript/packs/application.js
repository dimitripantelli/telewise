// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import "controllers";
import "bootstrap";

// import { scrollFunction } from 'style_navbar.js'

// document.addEventListener('turbolinks:load', () => {
//   window.onscroll = function() {scrollFunction()};
// }

window.checkPrevious = function (currCheckbox) {
  let allPrevious = Array.from(
    document.getElementsByClassName("episode-check")
  ).filter((otherCheckbox) => {
    return parseInt(otherCheckbox.id,10) < parseInt(currCheckbox.id,10);
  });
  allPrevious.forEach((input) => input.checked = true);
};
