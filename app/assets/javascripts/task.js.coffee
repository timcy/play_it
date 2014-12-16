$(document).ready ->
  $(document).on "change", ".task_class", ->
    val = $(this).val()
    $.ajax '/tasks/'+val,
    type: 'PUT'
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      alert("error")
    success: (data, textStatus, jqXHR) ->
      if data.deleted == true
        $("#"+val).addClass('selected')
      else
        $("#"+val).removeClass('selected')
    return

  return