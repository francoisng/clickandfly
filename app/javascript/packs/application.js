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

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "mapbox-gl/dist/mapbox-gl.css";

// Internal imports, e.g:
import { initMapbox } from "../plugins/init_mapbox";
import { initFlatpickr } from "../plugins/flatpickr";
import { initSweetalert } from "../plugins/init_sweetalert";
// import { initSelect2 } from '../components/init_select2';

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();
  initMapbox();
  initFlatpickr();
  initSweetalert();
});

const input_start = document.querySelector("#new_booking > div.form-group.string.optional.booking_start_date > input.form-control.string.optional.input")
const input_end = document.querySelector("#end_date")