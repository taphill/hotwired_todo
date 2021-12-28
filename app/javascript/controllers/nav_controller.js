import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('connected')
    const element = document.getElementById('nav')

    element.classList.remove('hidden')
  }

  disconnect() {
    console.log('disconnected')
    const element = document.getElementById('nav')

    element.classList.add('hidden')
  }
}
