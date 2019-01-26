$(document).on('ready page:load', function () {
  $(".items").sortable({
    update: function(e, ui){
      Rails.ajax({
        url: $(this).data("url"),
        type: "PATCH",
        data: $(this).sortable('serialize')
      });
    }
  });
});
