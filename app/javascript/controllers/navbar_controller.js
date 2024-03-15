// app/javascript/controllers/navbar_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
  }


  updateNavbar() {
    if (window.scrollY >= window.innerHeight / 3) {
      this.element.classList.add("navbar-lewagon-white")

      const logo = document.querySelector("a")
      logo.style.display = "none"

    } else {
      this.element.classList.remove("navbar-lewagon-white")
    }
  }
}
