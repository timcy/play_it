$("#list_item").append('<li id = "<%=@task.id%>" class= ""><%=check_box_tag 'task',@task.id,false,class: 'task_class'%><%=@task.name%></li>')