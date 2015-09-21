$(document).ready(function(){
    $("#answer-button").click(function(e){
      // debugger
        e.preventDefault();
        getLocation();
    });
});

function getLocation() {
  debugger
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(sendPosition);
    } else {
        $("#test").html("Geolocation is not supported by this browser.");
    }
}
function sendPosition(position) {
    var latitude = position.coords.latitude
    var longitude = position.coords.longitude;
    $('#test').append("<div>Latitude:  " + latitude + "</div")
    $('#test').append("<div>Longitude:  " + longitude + "</div")
    $.ajax({
      type: "POST",
      url: "/lists/:list_id/clues/:id",
      data: {latitude: latitude, longitude: longitude, answer: $("#answer").val()},
    })
}
