// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

// indexページの上に戻る //
$(function(){
	$('#back a').on('click', function(){
		$('body, html').animate({
			scrollTop:0
		}, 800);
		    return false;
	});
});

$(function(){
	$('#ranking_container').mouseover(function(){
		$('#ranking_comment').show();
	});

	$('#ranking_container').mouseout(function(){
		$('#ranking_comment').hide();
	});
});

$(function(){
	$('#genre_container').mouseover(function(){
		$('#genre_comment').show();
	});

	$('#genre_container').mouseout(function(){
		$('#genre_comment').hide();
	});
});

$(function(){
	$('#keyword_container').mouseover(function(){
		$('#keyword_comment').show();
	});

	$('#keyword_container').mouseout(function(){
		$('#keyword_comment').hide();
	});
});

/*
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
*/

$("input[last_name], input[first_name]").blur(function(){
	if($(this).val() == ""){
		alert('名前を入力してください')
	} else if(!$(this).val().match(/^[ァ-ンヴー]*$/)) {
		alert('全角カタカナで入力してください')
	}
});



