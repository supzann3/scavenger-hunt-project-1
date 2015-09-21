// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree ../../../vendor/assets/javascripts/.
//= require_tree .

$(document).ready(function(){
    $("#answer-button").click(function(e){
        e.preventDefault();
        getLocation();
    });
});

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(sendPosition);
    } else {
        $("#test").html("Geolocation is not supported by this browser.");
    }
}
function sendPosition(position) {

    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    $('#test').append("<div>Latitude:  " + latitude + "</div")
    $('#test').append("<div>Longitude:  " + longitude + "</div")
    $.ajax({
      type: "POST",
      url: "/lists/:list_id/clues/:id",
      data: {latitude: latitude, longitude: longitude, answer: $("#answer").val(), clue_id: $("#clue_id").val(), current_list_id: $("#current_list_id").val()}
  }).done(function(response){
    // debugger
    $('#clue-form').html(response)
  })
}
