// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

// const form = document.querySelector("#new_booking");
// form.addEventListener("submit", (event) => {
//   event.preventDefault();
//   swal("Hello world!");
// });

const input_start = document.querySelector("#new_booking > div.form-group.string.optional.booking_start_date > input.form-control.string.optional.input")
const input_end = document.querySelector("#end_date")