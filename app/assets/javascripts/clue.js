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

function getLocation(callback) {
    // callback
    if (navigator.geolocation) {
       navigator.geolocation.getCurrentPosition(callback);
    } else {
        $("#test").html("Geolocation is not supported by this browser.");
    }
}
