import { Controller } from "stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {

  connect() {
    flatpickr(this.element, {
      enableTime: true,
      altInput: true,
      minuteIncrement: 60
    });
  }
}
