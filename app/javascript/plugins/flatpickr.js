import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    enableTime: true,
    altInput: true,
    minuteIncrement: 60
  });
}

export { initFlatpickr };
