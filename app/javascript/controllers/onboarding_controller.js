import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="onboarding"
export default class extends Controller {
  static targets = ["firstNameInput", "firstQuestion", "secondQuestion", "thirdQuestion", "firstNamePlaceHolder", "buttonA1", "buttonA2", "question2", "question2bis", "buttonback3", "buttonB1", "buttonB2", "buttonB1bis", "buttonB2bis", "buttonC1", "buttonC2", "buttonNextStep", "studentTags", "tagsPlaceHolder", "tagsRevealBtn", "form", "next"]

// Path choice
  pathChoice(event) {

  }

// Auto top scroll
  topScroll(event) {
    window.scrollTop;
  }

  next(event) {
    this.nextTarget.click();
  }

// Prevent scroll
  preventScroll(event) {
    event.preventDefault();
    event.stopPropagation();
  }

// Dynamic first name retrieval
  firstStep(event)  {
    const name = this.firstNameInputTarget.value;
    console.log(name);
    console.log(name, this.firstNamePlaceHolderTargets);
    this.firstNamePlaceHolderTargets.forEach((element) => {
      element.innerHTML = name;
    });
  }

// Student quizz
  q1FirstAnswer(event) {
    this.firstQuestion = "manual";
    this.buttonA1Target.classList.add("choice-button-selected");
    this.buttonA2Target.classList.add("choice-button-unselected");
    this.question2Target.classList.add("d-none");
    this.question2bisTarget.classList.remove("d-none");
    this.buttonback3Target.href = "#quizz-student-2nd-bis";
  }

  q1SecondAnswer(event) {
    this.firstQuestion = "intellectual";
    this.buttonA2Target.classList.add("choice-button-selected");
    this.buttonA1Target.classList.add("choice-button-unselected");
  }

  q2FirstAnswer(event) {
    this.secondQuestion = "scientific";
    this.buttonB1Target.classList.add("choice-button-selected");
    this.buttonB2Target.classList.add("choice-button-unselected");
  }

  q2SecondAnswer(event) {
    this.secondQuestion = "non-scientific";
    this.buttonB2Target.classList.add("choice-button-selected");
    this.buttonB1Target.classList.add("choice-button-unselected");
  }

  q2BisFirstAnswer(event) {
    this.secondQuestion = "outdoor";
    this.buttonB1bisTarget.classList.add("choice-button-selected");
    this.buttonB2bisTarget.classList.add("choice-button-unselected");
  }

  q2BisSecondAnswer(event) {
    this.secondQuestion = "indoor";
    this.buttonB2bisTarget.classList.add("choice-button-selected");
    this.buttonB1bisTarget.classList.add("choice-button-unselected");
  }

  q3FirstAnswer(event) {
    this.thirdQuestion = "alone";
    this.buttonC1Target.classList.add("choice-button-selected");
    this.buttonC2Target.classList.add("choice-button-unselected");
  }

  q3SecondAnswer(event) {
    this.thirdQuestion = "group";
    this.buttonC2Target.classList.add("choice-button-selected");
    this.buttonC1Target.classList.add("choice-button-unselected");
  }

  preferencesDef() {
    if (this.firstQuestion == 'manual' && this.secondQuestion == 'indoor' && this.thirdQuestion == 'alone') {
      this.studentTags = ["création", "manutention", "artisanat", "opérations", "industrie", "transport-logistique", "hôtellerie-restauration", "entretien", "art"];
    } else if (this.firstQuestion == 'manual' && this.secondQuestion == 'indoor' && this.thirdQuestion == 'group') {
      this.studentTags = ["création", "manutention", "artisanat", "opérations", "industrie", "transport-logistique", "entretien", "art"];
    } else if (this.firstQuestion == 'manual' && this.secondQuestion == 'outdoor' && this.thirdQuestion == 'alone') {
      this.studentTags = ["création", "manutention", "btp", "environnement", "opérations", "industrie", "transport-logistique", "entretien", "art"];
    } else if (this.firstQuestion == 'manual' && this.secondQuestion == 'outdoor' && this.thirdQuestion == 'group') {
      this.studentTags = ["création", "manutention", "btp", "environnement", "opérations", "industrie", "transport-logistique", "entretien", "art"];
    } else if (this.firstQuestion == 'intellectual' && this.secondQuestion == 'scientific' && this.thirdQuestion == 'alone') {
      this.studentTags = ["aéronautique", "finance", "ingénierie", "technologie", "médical", "informatique", "comptabilité", "banque", "assurance"];
    } else if (this.firstQuestion == 'intellectual' && this.secondQuestion == 'scientific' && this.thirdQuestion == 'group') {
      this.studentTags = ["aéronautique", "finance", "ingénierie", "technologie", "médical", "informatique", "comptabilité", "banque", "assurance"];
    } else if (this.firstQuestion == 'intellectual' && this.secondQuestion == 'non-scientific' && this.thirdQuestion == 'alone') {
      this.studentTags = ["audiovisuel", "commerce", "communication", "culture", "edition", "enseignement", "administration", "immobilier", "journalisme", "marketing", "mode-textile", "tourisme"];
    } else {
      this.studentTags = ["audiovisuel", "commerce", "communication", "culture", "edition", "enseignement", "administration", "immobilier", "journalisme", "marketing", "mode-textile", "tourisme"];
    }
    return this.studentTags;
  }

  studentTags(event) {
    // const div = document.createElement('div')

    const tags = this.preferencesDef();
    // div.insertAdjacentHTML("beforeend", '<form action="#" method="POST" class="">');
    // tags.forEach((tag) => {
    //   div.insertAdjacentHTML("beforeend", `<input class="tags-btn" type='checkbox' name='name' id=${tag} required> <label for=${tag}>${tag}</label>`);
    // });
    // div.insertAdjacentHTML("beforeend", '<input type="submit" value="Subscribe!">');
    // console.log(div);
    // this.tagsPlaceHolderTarget.innerHTML = div.outerHTML;
    // console.log(div.outerHTML);
    const token = document.querySelector('[name="csrf-token"]').content;
    const displayedTags = ['<form action="/preferences" method="POST" data-onboarding-target="form">'];
    tags.forEach((tag) => {
      displayedTags.push(`<input class="tags-btn" type="checkbox" value="${tag}" name="preference[tag_id][]" id="${tag}" required> <label for="${tag}">${tag}</label>`);
    })
    displayedTags.push(`<input type="hidden" name="authenticity_token" value="${token}">`);
    displayedTags.push('<input type="submit" class="btn-valid" value="Ok" data-action="click->onboarding#submitForm"> </form>');
    console.log(displayedTags.join(" "));
    this.tagsPlaceHolderTarget.innerHTML = displayedTags.join(" ");
    this.tagsRevealBtnTarget.classList.add("d-none");
    event.preventDefault();
  }

  submitForm() {
    this.formTarget.submit()
  }
}

/* <input type="checkbox" value="2" name="preference[tag_id][]" id="preference_tag_id_2"></input> */
