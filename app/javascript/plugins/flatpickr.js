import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";
import "flatpickr/dist/flatpickr.min.css" ;

const initFlatpickr = () => {
  flatpickr("#start_date", {
    altInput: true,
    allowInput: true,
    plugins: [new rangePlugin({ input: "#end_date" })],
    mode: "range"
  });
};
export { initFlatpickr };
