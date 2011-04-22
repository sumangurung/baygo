$(document).ready(function(){

    // This code is to make the text appear vertically, it should
    // be used with the style in the class 'vertical_text'
    $("p.vertical_text").each(function() {
      var html = $(this).html();
      $(this).html(html.split("").join("<br/> "));
    });
});

