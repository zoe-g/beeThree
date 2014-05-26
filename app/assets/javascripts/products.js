// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

//edit product

$( document ).ready(function(){
	$(".field").hide();
//clicking in the paragraph on show page will change to and from form
var showing = false;
  	$("#edit").on('click', function(){
  		if(showing){
  			$(".field").hide();
	  		$(this).html("edit");
	  		showing = false; 
		}
		else{
			$(".field").show();
	  		$(this).html("cancel");
	  		showing = true;
		}
  });
});