// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "materialize-css/dist/js/materialize";

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('DOMContentLoaded', function () {
  var elems = document.querySelectorAll('select');
  M.FormSelect.init(elems, {});
});


window.onClickPaginate = (page) => {
  event.preventDefault();
  document.getElementById('loader').classList.remove('hide');
  document.getElementById('search_page').value = page;
  const elem = document.getElementById('search_form');
  Rails.fire(elem, 'submit');
}

window.onChangeSelect = () => {
  document.getElementById('loader').classList.remove('hide');
  document.getElementById('search_page').value = 1;
  const elem = document.getElementById('search_form');
  Rails.fire(elem, 'submit');
}

window.onClickSubmitButton = () => {
  document.getElementById('loader').classList.remove('hide');
  document.getElementById('search_page').value = 1;
  const elem = document.getElementById('search_form');
  Rails.fire(elem, 'submit');
}

window.onChangeTextField = () => {
  const { key } = event;

  if (key === 'Enter') {
    onClickSubmitButton();
  }
}