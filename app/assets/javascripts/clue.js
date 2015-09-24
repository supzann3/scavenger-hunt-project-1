$(document).ready(function(){
  $("#clue-answer-form").submit(function(e){
    e.preventDefault();

    getLocation(function(location){
      $("#longitude").val(location.coords.longitude);
      $("#latitude").val(location.coords.latitude);
      $('#clue-answer-form').unbind("submit").submit();
    });
  });

  $('#new-from-address').submit(function(e){
    e.preventDefault();
    fetchAddressLocation();
  });

  $('#new-clue-form').submit(function(e){
    e.preventDefault();
    createClue()
  });

  $('.delete').click(function(e){
    e.preventDefault();
    deleteClue().bind(this)
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

function fetchAddressLocation(callback){
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
        $("#longitude").val(message['latitude']);
        $("#latitude").val(message['longitude']);
        createClue()
      }
    });
  }

function addClueToList(){
  $('#ol-clues').append(
    "<li>" + $('#text').val() + "<br>" +
    $('#answer').val() + "</li>"
  )
}

function createClue(){
  var listId = $('#list_id').val();
  $.ajax({
    url: "/lists/" + listId + "/clues",
    type: 'POST',
    data: {
      answer: $('#answer').val(),
      text: $('#text').val(),
      latitude: $('#latitude').val(),
      longitude: $('#longitude').val(),
      list_id: $('#list_id').val()
      },
    success: function(message){
      addClueToList()
      $('form').trigger('reset')
    }
  });

}

function deleteClue(){
  debugger
  $.ajax({ 
    // /lists/:list_id/clues/:id(.:format)
    url: "/lists/" + listId + "/clues",
    type: 'POST',
    data: {
      answer: $('#answer').val(),
      text: $('#text').val(),
      latitude: $('#latitude').val(),
      longitude: $('#longitude').val(),
      list_id: $('#list_id').val()
      },
    success: function(message){
      addClueToList()
      $('form').trigger('reset')
    }
  });
}
//validations for address
