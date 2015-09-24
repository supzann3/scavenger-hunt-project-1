$(document).ready(function(){
  $(".switch-lists-button").click(function(){
    //slide toggle both and change the text of the div button;

    $("#your-lists-button").click(function(e){
      $("#your-lists").slideDown(700);
      $("#all-lists").slideUp(700);
    });
    $("#all-lists-button").click(function(e){
      $("#all-lists").slideDown(700);
      $("#your-lists").slideUp(700);
    });
  });
});
