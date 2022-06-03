import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["card"]

  connect() {
    this.acceptedTarget = document.getElementById('accepted')
    this.declinedTarget = document.getElementById('declined')
  }

  send(event) {
    const _this = this
    event.preventDefault()
    fetch(event.currentTarget.action, {
      method: "PATCH",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(event.currentTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        debugger
        if (data.status === 'active') {
          _this.acceptedTarget.insertAdjacentHTML("afterbegin", data.booking)
        } else {
          _this.declinedTarget.insertAdjacentHTML("afterbegin", data.booking)
        }
        _this.cardTarget.remove()
      })
    };
}
