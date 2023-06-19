import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // champs dans le form resultat
  static targets = [   
     "prixBrutInitial", "prixInitial"
  ];

  coverFees(event) {
    event.preventDefault();
    this.prixInitialTarget.value =  this.prixInitialTarget.value * 1.05;
    console.log("test click cover")

  }

  uncoverFees(event) {
    event.preventDefault();
    this.prixInitialTarget.value = this.prixBrutInitialTarget.value;
    console.log("test click uncover")

  }

  connect() {
    console.log("test connect controller sub")
    console.log("intial brut prix: " +  this.prixBrutInitialTarget.value )

  }


  // continuer fonction pour si clicj sur bouton cover the fees, changer la valeur totale
}
