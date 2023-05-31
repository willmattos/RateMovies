$(".follow").click(function () {
  var div = $(this);
  $.ajax({
    type: "post",
    url: ruta_crear_seguir,
    data: {
      codigo: $(this).attr("class").split(" ")[1],
    },
    dataType: "json",
    success: function (response) {
      var posicion;
      if (usuario_visita) {
        posicion = $(".followers");
      } else {
        posicion = $(".following");
      }
      var actual = parseInt($(posicion).html());
      if (response.respuesta) {
        if (response.tipo == 1) {
          $(div).html("Unfollow");
          actual++;
        } else {
          $(div).html("Follow");
          actual--;
        }
        $(posicion).html(actual);
      }
    },
  });
});
