import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["preview"];

  connect() {
    console.log("Stimulus preview image controller connected.");
  }

  previewImage(event) {
    const input = event.target;
    const previewContainer = this.previewTarget;

    previewContainer.innerHTML = ""; // Clear previous contents

    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = function (e) {
        const img = document.createElement("img");
        img.src = e.target.result;
        previewContainer.appendChild(img);
        img.classList.add("profile-pic");
      };
      reader.readAsDataURL(input.files[0]);
    } else {
      const placeholder = document.createElement("span");
      placeholder.classList.add("placeholder");
      placeholder.textContent = "No Image Selected";
      previewContainer.appendChild(placeholder);
    }
  }
}
