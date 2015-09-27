$(document).ready(function(){
  $("#clue-answer-form").submit(function(e){
    e.preventDefault();

    getLocation(function(location){
      $("#longitude").val(location.coords.longitude);
      $("#latitude").val(location.coords.latitude);
      $('#clue-answer-form').unbind("submit").submit();
    });
  });

  $('#new-from-address-submit-button').click(function(e){
    debugger
    e.preventDefault();
    fetchAddressLocation();
  });

  $('#new-clue-form-submit-button').click(function(e){
    e.preventDefault();
    createClue();
  });

  $('.delete').click(function(e){
    e.preventDefault();
    // debugger
    $(this).parent().parent()
    var clueId = $(this).parent().parent().children('.clue-info').children('.clue-id').text();
    var listId = $(this).parent().parent().children('.clue-info').children('.list-id').text();
    deleteClue(clueId, listId);
  });

  $('.edit').click(function(e){
    // debugger
    $(this).parent().parent().children(".edit_clue").slideToggle(1000);
  });

  $('.edit-clue-form').submit(function(e){
    e.preventDefault();
    var listId = $(this).parent().parent().children('.clue-info').children('.list-id').text();
    var clueId = $(this).parent().parent().children('.clue-info').children('.clue-id').text();
    var text = $(this).children('#text').val();
    var answer = $(this).children('#answer').val();
    editClue(clueId, list_id, text, answer);
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
  debugger
    var listId = $('#list_id').val();
    $.ajax({
      url: "/lists/" + listId + "/newcluefromaddress",
      type: 'POST',
      data: { address: {

        street: $('#add-clue-wrapper').find('#street').val(),
        city: $('#add-clue-wrapper').find('#city').val(),
        state: $('#add-clue-wrapper').find('#state').val(),
        zip: $('#add-clue-wrapper').find('#zip').val()}
      },
      success: function(message){
        $("#longitude").val(message['latitude']);
        $("#latitude").val(message['longitude']);
        createClue(message);
      }
    });
  }

function addClueToList(clueId, listId){
  $('#all-clues').append("<div class= 'clue-wrapper' id='clue-'" + clueId + ">" +
    "<div class='clue-info'>" +
      "<div class='hidden clue-id'>" +
        clueId +
      "</div>" +
      "<div class='hidden list-id'>" +
        listId +
      "</div>" +
      "<div class='clue-text'>" +
        $('#new-clue-form').find('#text').val() +
      "</div>" +
      "<div class='clue-answer'>" +
        $('#new-clue-form').find('#answer').val() +
      "</div>" +
    "</div>" +
    "<div class= 'icons'>" +
      "<div class='edit'>" +
        '<img src="/assets/edit-05d072d1050f88951c524fe5efad2a6f6d5d73fb041df2d86d29be4656354d79.png" alt="Edit 05d072d1050f88951c524fe5efad2a6f6d5d73fb041df2d86d29be4656354d79" />' +
      "</div>" +
      "<div class='delete'>" +
        '<img src="/assets/delete-a35ffca5b9902c9a6167c37ad835a83127b7ee8070c0b8436a68137df206c07d.png" alt="Delete a35ffca5b9902c9a6167c37ad835a83127b7ee8070c0b8436a68137df206c07d" />' +
      "</div>" +
    "</div>" +
  "</div>");
}

function createClue(){
  var listId = $('#list_id').val();
  $.ajax({
    url: "/lists/" + listId + "/clues",
    type: 'POST',
    data: {
      answer: $('#new-clue-form').find('#answer').val(),
      text: $('#new-clue-form').find('#text').val(),
      latitude: $('#new-clue-form').find('#latitude').val(),
      longitude: $('#new-clue-form').find('#longitude').val(),
      list_id: $('#new-clue-form').find('#list_id').val()
      },
    success: function(message){
      addClueToList(message, listId);
      $('form').trigger('reset');
      $('#new-clue-address-form').html('<button id="toggle-address" class="btn btn-small btn-success">Let me fill in the address for the location of my clue.</button>');
      $("#new-from-address-submit-button").hide();
      $("#new-clue-form-submit-button").show();
    }
  });

}

function deleteClue(clueId, listId){

  $.ajax({
    // /lists/:list_id/clues/:id(.:format)
    url: "/lists/" + listId + "/clues/" + clueId,
    type: 'DELETE',
    data: {
      clue_id: clueId
      },
    success: function(message){
      $( "#clue-" + clueId ).remove();
    }
  });
}

function editClue(clueId, listId, text, answer){

  $.ajax({
    url: "/lists/" + listId + "/clues/" + clueId,
    type: 'PATCH',
    data: {
      text: text,
      answer: answer
      },
    success: function(message){
      $( "#clue-" + clueId ).children('.clue-info').children('.clue-text').text(text);
      $( "#clue-" + clueId ).children('.clue-info').children('.clue-answer').text(answer);
      $( "#clue-" + clueId ).children('.edit_clue').slideToggle(1000);
    }
  });
}
// //validations for address
