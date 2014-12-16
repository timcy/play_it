$.ajax '/tasks',
  type: 'GET'
  dataType: 'json'
  error: (jqXHR, textStatus, errorThrown) ->
    alert ("error")
  success: (data, textStatus, jqXHR) ->
    $("#task_list").append("<%= render(partial: 'tasks/task' ,locals: {task: "+data+"}%>")