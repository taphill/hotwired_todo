import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'todo', 'description' ]

  connect() {
    const nav = document.getElementById('nav')
    nav.classList.remove('hidden')
  }

  disconnect() {
    const nav = document.getElementById('nav')
    nav.classList.add('hidden')
  }

  todoTargetConnected() {
    const descriptionInput = document.getElementById('description')
    descriptionInput.value = ''
  }

  enableButton() {
    const button = document.getElementById('add-todo-button')

    if (this.description) {
      button.disabled = false
    } else {
      button.disabled = true
    }
  }

  get description() {
    return this.descriptionTarget.value
  }
}
