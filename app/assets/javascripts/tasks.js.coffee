$ ->
  $("a[data-task-link]").click ->
    taskid = $(this).data("task-link")
    $("#task-content-" + taskid).slideToggle()
