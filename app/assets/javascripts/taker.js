$(document).ready( function() {
  
  // set mp form on page load
  if ($('select').val() === "multiple_choice" || $('select').val() === "checkboxes") {
    $('div.choices').show();
  }
  
  // hide response when taker answers question
  $('.btn').click(function() {
      $(this).parent().parent('.taker_response').fadeOut();
  });
  
  //  show and hide mp options for question
  $('select').change(function() {
      // $(this).parent().parent('.question_form').fadeOut();
      var value = $(this).val();
      if (value === "text") {
        $('div.choices').hide();
      }
      if (value === "multiple_choice") {
        $('div.choices').show();
      }
      if (value === "checkboxes") {
        $('div.choices').show();
      }
  });

});