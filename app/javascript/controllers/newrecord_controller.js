import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["openButton", "closeButton", "formFields"];

  connect() {
    this.closeButtonTarget.hidden = true;
    console.log("stimulus dropdown controller");
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal();
    }
    // console.log(e.detail.success)
  }

  hideModal() {
    this.openButtonTarget.hidden = false;
    this.closeButtonTarget.hidden = true;


  }

  openDropdown() {
    this.openButtonTarget.hidden = true;
    this.closeButtonTarget.hidden = false;
    console.log("click btn nouveau");

    // Clear form fields
    this.formFieldsTargets.forEach((field) => {
      field.value = "";
    });
    console.log("reset form");

  }

  closeDropdown() {
    this.openButtonTarget.hidden = false;
    this.closeButtonTarget.hidden = true;
  }
}
