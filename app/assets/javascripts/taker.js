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
  
  // successful add of option
  $('.add_options').on('ajax:success', 'form', function(event, data) {
    $('.options_list').append(data.option);
    $text_box = $('.option_text_field')
    $text_box.val("");
    $text_box.focus();
  });
  // error on add of option
  $('.add_options').on('ajax:error', 'form', function(event, data) {
    $('.options_list').append(data.responseText);
  });
  
  // remove option from list
  $('a.remove_option').click(function() {
    //$(this).parent('p').fadeOut
    if (confirm("Are you sure")) {
      $option = $(this).parent();
      $option.hide();
      $.post($this.href, {method:"delete"}, null, "script");
      return false;
    } else {
      return false;
    }
  });
  
  // hide alert/notice bar when empty
  $('p.alert:empty').remove();
  $('p.notice:empty').remove();
  
});
