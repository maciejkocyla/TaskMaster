$ ->
  
  $(".hiddenContent").fadeIn(3000)
  
  $("a[data-show-content]").click ->
    contentid = $(this).data("show-content");
    $("#" + contentid).fadeToggle();
    
