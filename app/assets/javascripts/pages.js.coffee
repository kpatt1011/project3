# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


function ajaxRequest(){
  $.ajax(
    url: "/users/1.json"
    type: "POST"
    dataType: "json"
    data: data
  ).success (data) ->
    if data.active
      alert(data)
    else
      alert("Fail")
)
}

$(document).ready(function() {
	ajaxRequest();
});
