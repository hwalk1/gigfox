import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "price", "venueprice"]
  static values = {price: Number}

  connect() {
    console.log("Hello from our first Stimulus controller")
    console.log(this.priceValue)
  }

  showTotal(event) {
    console.log(`${event.currentTarget.value}`)
    this.priceTarget.innerText = `$${(event.currentTarget.value * this.priceValue) }`
  }
}
