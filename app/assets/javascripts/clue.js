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
//   $("#clue-submit-button").click(function(e){
//     e.preventDefault();
//
//     getLocation(function(location){
//       $("#longitude").val(location.coords.longitude);
//       $("#latitude").val(location.coords.latitude);
//       $("#continue").val('true');
//       $('#clue-submit-button').unbind("submit").submit();
//     });
//   });
//   $("#new-clue-form").submit(function(e){
//     e.preventDefault();
//
//     getLocation(function(location){
//       // debugger
//       $("#longitude").val(location.coords.longitude);
//       $("#latitude").val(location.coords.latitude);
//       $("#continue").val('false');
//       $('#view-all-clue').unbind("submit").submit();
//     });
//   });
});

function getLocation(callback) {
    // callback
    if (navigator.geolocation) {
       navigator.geolocation.getCurrentPosition(callback);
    } else {
        $("#test").html("Geolocation is not supported by this browser.");
    }
}
