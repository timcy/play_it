$(document).ready(function(){
    var AvatarCropper,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

jQuery(function() {
  return new AvatarCropper();
});

AvatarCropper = (function() {
  function AvatarCropper() {
    this.updatePreview = __bind(this.updatePreview, this);
    this.update = __bind(this.update, this);
    $('#crop_box').Jcrop({
      aspectRatio: 1,
      setSelect: [0, 0, 600, 600],
      onSelect: this.update,
      onChange: this.update
    });
  }

  AvatarCropper.prototype.update = function(coords) {
    $('#user_crop_x').val(coords.x);
    $('#user_crop_y').val(coords.y);
    $('#user_crop_w').val(coords.w);
    $('#user_crop_h').val(coords.h);
    return this.updatePreview(coords);
  };

  AvatarCropper.prototype.updatePreview = function(coords) {
    return $('#preview').css({
      width: Math.round(100 / coords.w * $('#crop_box').width()) + 'px',
      height: Math.round(100 / coords.h * $('#crop_box').height()) + 'px',
      marginLeft: '-' + Math.round(100 / coords.w * coords.x) + 'px',
      marginTop: '-' + Math.round(100 / coords.h * coords.y) + 'px'
    });
  };

  return AvatarCropper;

})();
});
  


$(document).on("click",".task", function(){
    var data = $(this).text();
    var data_id = $(this).attr('data-id')
    // $(".task_name").val(data);

    $(".modal-body").html("<input type='text' task ="+ data_id +" id='task_id'/>");
    $("#task_id").val(data);
    $("#basicModal").modal('show');

});

$(document).on("click","#save_task",function(){
    var task_id = $("#task_id").attr('task');
    var task_data = $("#task_id").val();

    $.ajax({
        url: '/tasks/update_task/',
        method: 'PUT',
        data: {name: task_data,id: task_id},
        success: function (data) {
            
            $("#basicModal").modal('hide');
            location.reload();

        }
    });
    
});

$(document).on("click",".add_photo",function(){
    $("#photoModel").modal('show');
});