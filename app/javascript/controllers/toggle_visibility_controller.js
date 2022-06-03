import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["element"]

  toggle() {
    this.elementTarget.classList.toggle("pe-auto");
    this.elementTarget.classList.toggle("opacity-0");
    this.element.classList.toggle("bg-light");
  }
}
