import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'password' ]

  verify() {
    const element = document.querySelector('div.password-explanation')

    this.imageSwitch

    if (this.passwordIsValid) {
      element.classList.add('valid')
    } else {
      element.classList.remove('valid')
    }
  }

  get password() {
    return this.passwordTarget.value
  }

  get passwordIsValid() {
    return (
      this.hasValidLength &&
      this.hasUpperCaseCharacter &&
      this.hasLowerCaseCharacter &&
      this.hasSpecialCharacter
    )
  }

  get hasValidLength() {
    return this.password.length >= 8 && this.password.length <= 72
  }

  get hasUpperCaseCharacter() {
    return this.password.toLowerCase() != this.password;
  }

  get hasLowerCaseCharacter() {
    return this.password.toUpperCase() != this.password;
  }

  get hasSpecialCharacter() {
    const specialChars = /[#?!@$%^&*-]/;

    return specialChars.test(this.password);
  }

  get imageSwitch() {
    const element1 = document.getElementById('password-img-1')
    const element2 = document.getElementById('password-img-2')
    const element3 = document.getElementById('password-img-3')
    const element4 = document.getElementById('password-img-4')

    this.imageSrc(this.hasValidLength, element1)
    this.imageSrc(this.hasUpperCaseCharacter, element2)
    this.imageSrc(this.hasLowerCaseCharacter, element3)
    this.imageSrc(this.hasSpecialCharacter, element4)
  }

  imageSrc(conditon, imageElement) {
    if (conditon) {
      imageElement.src = '/accept.png'
    } else {
      imageElement.src = '/cancel.png'
    }
  }
}
