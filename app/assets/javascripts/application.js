//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .

$( document ).ready(function(){

	//set active status on navbar depending on which page user is on
	var page = window.location.pathname;
	var pageSplit = page.split('/');
	if (page == "/products") {
		$("#products-nav").addClass("active");
	} else if (page == "/products/new") {
		$("#new-nav").addClass("active");
	} else if (pageSplit[1] == "users") {
		$("#listings-nav").addClass("active");
	}

	//clicking edit and cancel to hide and show form for product update
	$("#edit-form").hide();
	$("#edit").on('click', function(){
		var showing = false;
		if(showing){
			$("#edit-form").hide();
			$(this).html("Edit This Listing");
			showing = false; 
		} else {
			$("#edit-form").show();
			$(this).html("Cancel");
			showing = true;
		}
  });

});