import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
initilize() {}
connect() {}
toggleForm(event) {
    event.preventDefault();
    event.stopPropagation();
    const formID = event.params["form"];
    const commentBodyID = event.params["body"];
    const form = document.getElementById(formID);
    form.classList.toggle("d-none");
    const commentBody = document.getElementById(commentBodyID); 
    commentBody.classList.toggle("d-none");
    form.classList.toggle("mb-5");

 }
}