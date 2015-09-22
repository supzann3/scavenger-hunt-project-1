$(document).ready(function(){
    $("#answer-button").click(function(e){
        e.preventDefault();
        getLocation();
    });
});

$(document).ready(function(){
    $("#answer-button").click(function(e){
        e.preventDefault();
        getLocation();
    });

    $("#new-clue-button").click(function(e){
        e.preventDefault();
        getCoords();
    });
});

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(sendPosition);
    } else {
        $("#test").html("Geolocation is not supported by this browser.");
    }
}

function getCoords() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(sendCluePosition);
    } else {
        $("#test").html("Geolocation is not supported by this browser.");
    }
}

function sendPosition(position) {

    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    $('#test').append("<div>Latitude:  " + latitude + "</div");
    $('#test').append("<div>Longitude:  " + longitude + "</div");
    $.ajax({
      type: "POST",
      url: "/lists/:list_id/clues/:id",
      data: {latitude: latitude, longitude: longitude, answer: $("#answer").val(), clue_id: $("#clue_id").val(), current_list_id: $("#current_list_id").val()}
  }).done(function(response){
    // debugger
    $('#clue-form').html(response);
  });
}

function sendCluePosition(position) {

    var latitude = position.coords.latitude;
    var longitude = position.coords.longitude;
    $.ajax({
      type: "POST",
      url: "/lists/" + $("#current_list_id").val() + "/clues",
      data: {latitude: latitude, longitude: longitude, text: $("#text").val(), answer: $("#answer").val(), current_list_id: $("#current_list_id").val()}
  }).done(function(response){
    $('#new-clue-form').html(response);
  });
}
