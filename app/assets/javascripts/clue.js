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

  //listener function to validate address

  //listener function on submit to controller and lat and longitude
  //success - put lat and log as values in hidden fields and submit form

  });

  $('#new-from-address').submit(function(e){
    e.preventDefault();

    fetchAddressLocation()
  })
});
function getLocation(callback) {
    // callback
    if (navigator.geolocation) {
       navigator.geolocation.getCurrentPosition(callback);
    } else {
        $("#test").html("Geolocation is not supported by this browser.");
    }
}

function fetchAddressLocation(){
    var listId = $('#list_id').val();
    $.ajax({
      url: "/lists/" + listId + "/newcluefromaddress",
      type: 'POST',
      data: { address: {
        street: $('#street').val(),
        city: $('#city').val(),
        state: $('#state').val(),
        zip: $('#zip').val()}
      },
      success: function(message){
        debugger
        $("#longitude").val(data.longitude);
        $("#latitude").val(data.latitude);
      }
    });
  }

//validations for address
