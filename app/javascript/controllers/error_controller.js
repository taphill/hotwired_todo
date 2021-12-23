import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  remove() {
    const element = document.querySelector('div.error-explanation')

    element.remove()
  }
}
