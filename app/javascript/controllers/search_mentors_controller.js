import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list", "positionInput","sectorInput","industryInput","fieldInput"]

  update() {
    console.log('coucou')
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}&position=${this.positionInputTarget.value}&sector=${this.sectorInputTarget.value}&industry=${this.industryInputTarget.value}&field=${this.fieldInputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.innerHTML = data
      })
  }
}
