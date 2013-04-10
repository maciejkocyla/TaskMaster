$ ->
  $("a.open-left-side-task").click ->
    contentid = $(this).data("show-element-id")
    $("##{contentid}").slideToggle()
