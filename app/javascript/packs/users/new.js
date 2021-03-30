//  service_typeその他チェックでテキスト入力できるように（チェックボタン）
const serviceTypeOther = document.querySelector('#service_typeその他');
const serviceTypeTextField = document.querySelector('.service_type_textfield');

serviceTypeOther.addEventListener('click', () => {
  serviceTypeTextField.disabled = false;
})