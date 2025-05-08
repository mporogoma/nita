import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu", "button"]

  connect() {
    window.addEventListener("resize", this.handleResize.bind(this))
    document.addEventListener("click", this.handleClickOutside.bind(this))
  }

  disconnect() {
    window.removeEventListener("resize", this.handleResize.bind(this))
    document.removeEventListener("click", this.handleClickOutside.bind(this))
  }

  toggle(event) {
    event.stopPropagation()
    this.menuTarget.classList.toggle("hidden")
    this.buttonTarget.classList.toggle("open")
  }

  close() {
    this.menuTarget.classList.add("hidden")
    this.buttonTarget.classList.remove("open")
  }

  handleResize() {
    if (window.innerWidth >= 768) { // Tailwind's md breakpoint
      this.close()
    }
  }

  handleClickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }
}