$(document).ready(function(){
  $("#clue-answer-form").submit(function(e){
    e.preventDefault();

    getLocation(function(location){
      // debugger
      $("#longitude").val(location.coords.longitude);
      $("#latitude").val(location.coords.latitude);
      // debugger
      $('#clue-answer-form').unbind("submit").submit();
    });
  });
});

$(document).ready(function(){
    // $("#answer-button").click(function(e){
    //     e.preventDefault();
    //     getLocation();
    // });

    $("#new-clue-button").click(function(e){
        e.preventDefault();
        getCoords();
    });
});

function getLocation(callback) {
    // callback
    if (navigator.geolocation) {
       navigator.geolocation.getCurrentPosition(callback);
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

// function sendPosition(position) {
//
//     var latitude = position.coords.latitude;
//     var longitude = position.coords.longitude;
//     $('#test').append("<div>Latitude:  " + latitude + "</div");
//     $('#test').append("<div>Longitude:  " + longitude + "</div");
//     $.ajax({
//       type: "POST",
//       url: "/lists/:list_id/clues/:id",
//       data: {latitude: latitude, longitude: longitude, answer: $("#answer").val(), clue_id: $("#clue_id").val(), current_list_id: $("#current_list_id").val()}
//   })
//   .done(function(response){
//     $('#clue-form').html(response);
//   });
// }
//
// function sendCluePosition(position) {
//
//     var latitude = position.coords.latitude;
//     var longitude = position.coords.longitude;
//     $.ajax({
//       type: "POST",
//       url: "/lists/" + $("#current_list_id").val() + "/clues",
//       data: {latitude: latitude, longitude: longitude, text: $("#text").val(), answer: $("#answer").val(), current_list_id: $("#current_list_id").val()}
//   }).done(function(response){
//     $('#new-clue-form').html(response);
//   });
// }
