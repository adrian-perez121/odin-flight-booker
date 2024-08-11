import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passengers"
export default class extends Controller {
  static targets = [ "container", "template", "removebtn"]
  static values = {numPassengers: Number}
  add () {
    const clone = this.templateTarget.content.cloneNode(true)
    const passengerIndex = this.numPassengersValue.toString()

    clone.querySelectorAll("input, label").forEach(element => {
      if (element.id){
        element.id = element.id.replace("new", passengerIndex)
      }
      if (element.name) {
        element.name = element.name.replace("new", passengerIndex)
      }
      if (element.htmlFor) {
        element.htmlFor = element.htmlFor.replace("new", passengerIndex)
      }
    })

    this.numPassengersValue += 1
    this.containerTarget.appendChild(clone)

  }

  remove() {
    const passengerDiv = this.containerTarget.lastElementChild

    this.numPassengersValue--
    passengerDiv.remove()
  }

  numPassengersValueChanged(){
    if (this.numPassengersValue <= 1) {
      this.removebtnTarget.disabled = true
    }
    else {
      this.removebtnTarget.disabled = false
    }
  }
}
