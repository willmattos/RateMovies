$(".card").click(function (e) {
    e.preventDefault();
    var url = ruta_contenido;
    url = url.replace("numero", $(this).data("codigo"));
    url = url.replace("titulo", $(this).data("nombre"));
    window.location.href = url;
  });
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