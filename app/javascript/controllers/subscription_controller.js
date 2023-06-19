import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // champs dans le form resultat
  static targets = 
    ["brut", "prixBrutInitial", "prixNetInitial", "prixInitial",  "platformFeesInitial", "paymentFeesInitial",
    "spanNet",  "spanTotal", "spanPlatformFeesInitial", "spanPaymentFeesInitial"];

  toggleFees(event) {
    event.preventDefault();
    const button = event.currentTarget;
    const totalSpan = this.spanTotalTarget;
    const netSpan = this.spanNetTarget;
    const paymentFeesInitialSpan = this.spanPaymentFeesInitialTarget;
    const platformFeesInitialSpan = this.spanPlatformFeesInitialTarget;
    const brutField = this.prixInitialTarget;

    if (totalSpan.textContent === this.prixBrutInitialTarget.value) {
      // cover fees 
      button.textContent = "Uncover the fees";
      netSpan.textContent = parseFloat(this.prixBrutInitialTarget.value).toFixed(2);
      platformFeesInitialSpan.textContent = parseFloat(this.platformFeesInitialTarget.value).toFixed(2);
      paymentFeesInitialSpan.textContent = parseFloat(this.paymentFeesInitialTarget.value).toFixed(2);
      
      var totalPrice = parseFloat(this.prixInitialTarget.value) + parseFloat(this.platformFeesInitialTarget.value) + parseFloat(this.paymentFeesInitialTarget.value);
      totalSpan.textContent = totalPrice.toFixed(2);
      brutField.value = totalPrice.toFixed(2);

    } else {
      // uncover fees - initial price
      this.prixInitialTarget.value = this.prixBrutInitialTarget.value;
      button.textContent = "Cover the fees";
      totalSpan.textContent = parseFloat(this.prixBrutInitialTarget.value).toFixed(2);
      netSpan.textContent = parseFloat(this.prixNetInitialTarget.value).toFixed(2);
      platformFeesInitialSpan.textContent = parseFloat(this.platformFeesInitialTarget.value).toFixed(2);
      paymentFeesInitialSpan.textContent = parseFloat(this.paymentFeesInitialTarget.value).toFixed(2);
      brutField.value =parseFloat(this.prixBrutInitialTarget.value).toFixed(2);

    }
  }
  
  connect() {
    console.log("connect controller sub")
    const totalSpan = this.spanTotalTarget;
    const netSpan = this.spanNetTarget;
    const platformFeesInitialSpan = this.spanPlatformFeesInitialTarget;
    const paymentFeesInitialSpan = this.spanPaymentFeesInitialTarget;

    totalSpan.textContent = parseFloat(this.prixBrutInitialTarget.value).toFixed(2);
    netSpan.textContent = parseFloat(this.prixNetInitialTarget.value).toFixed(2);
    platformFeesInitialSpan.textContent = parseFloat(this.platformFeesInitialTarget.value).toFixed(2);
    paymentFeesInitialSpan.textContent = parseFloat(this.paymentFeesInitialTarget.value).toFixed(2);

  }


  // continuer fonction pour si clicj sur bouton cover the fees, changer la valeur totale
}
