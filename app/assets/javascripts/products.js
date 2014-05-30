// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

//edit product

$( document ).ready(function(){
	$("#edit-form").hide();
//clicking edit and cancel to hide and show form for product update
var showing = false;
  	$("#edit").on('click', function(){
  		if(showing){
  			$("#edit-form").hide();
	  		$(this).html("Edit This Listing");
	  		showing = false; 
		}
		else{
			$("#edit-form").show();
	  		$(this).html("Cancel");
	  		showing = true;
		}
  });
});