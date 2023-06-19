import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // champs dans le form resultat
  static targets = ["prixBrutInitial", "prixNetInitial", "prixInitial", "spanTotal", "spanNet", "spanPlatformFeesInitial",
                    "platformFeesInitial", "paymentFeesInitial"];

  toggleFees(event) {
    event.preventDefault();
    const button = event.currentTarget;
    const totalSpan = this.spanTotalTarget;
    const netSpan = this.spanNetTarget;
    const platformFeesInitialSpan = this.spanPlatformFeesInitialTarget;

    if (totalSpan.textContent === this.prixBrutInitialTarget.value) {
      this.prixInitialTarget.value = this.prixInitialTarget.value * 1.05;
      button.textContent = "Uncover the fees";
      totalSpan.textContent =parseFloat(this.prixInitialTarget.value).toFixed(2);
      netSpan.textContent = parseFloat(this.prixBrutInitialTarget.value).toFixed(2);
      platformFeesInitialSpan.textContent = this.platformFeesInitialTarget.value;

    } else {
      this.prixInitialTarget.value = this.prixBrutInitialTarget.value;
      button.textContent = "Cover the fees";
      totalSpan.textContent = parseFloat(this.prixBrutInitialTarget.value).toFixed(2);
      netSpan.textContent = parseFloat(this.prixNetInitialTarget.value).toFixed(2);
      platformFeesInitialSpan.textContent = (this.prixInitialTarget.value * 1.05) * 0.1;

    }
  }
  

  connect() {
    console.log("test connect controller sub")
    console.log("intial brut prix: " +  this.prixBrutInitialTarget.value )
    console.log("platform fee ini: " +  this.platformFeesInitialTarget.value )

    const totalSpan = document.getElementById("span-total");
    const netSpan = this.spanNetTarget;

    const platformFeesInitialSpan = this.platformFeesInitialTarget;
    platformFeesInitialSpan.textContent = this.platformFeesInitialTarget.value;

    totalSpan.textContent = parseFloat(this.prixBrutInitialTarget.value).toFixed(2);
    netSpan.textContent = parseFloat(this.prixNetInitialTarget.value).toFixed(2);

  }


  // continuer fonction pour si clicj sur bouton cover the fees, changer la valeur totale
}
