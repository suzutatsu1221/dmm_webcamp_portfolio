const $form =
document.getElementById('form');


$form.addEventListener('change', update);
$form.addEventListener('input', update);

function update(e) {
	let type = e.target.type;
	let validationMessage =
	e.target.validationMessage;
	console.log(type, validationMessage);
}


