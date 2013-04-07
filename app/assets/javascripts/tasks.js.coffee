$ ->
  
  $("a[data-show-content]").click ->
    contentid = $(this).data("show-content");
    $("#" + contentid).slideToggle();
    
    
