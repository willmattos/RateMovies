var posicion_estrella = 0;
$(".svg").mouseover(function (e) {
  e.preventDefault();
  $(".estrella").removeClass("estrella_seleccionada");
  var posicion = $(this).prev().val();
  for (let index = 0; index < posicion; index++) {
    $(".estrella").eq(index).addClass("estrella_seleccionada");
  }
});
$(".svg").mouseout(function (e) {
  e.preventDefault();
  $(".estrella").removeClass("estrella_seleccionada");
  for (let index = 0; index < posicion_estrella; index++) {
    $(".estrella").eq(index).addClass("estrella_seleccionada");
  }
});
$(".svg").click(function (e) {
  var puntuacion = $(this).prev().val();
  $.ajax({
    type: "post",
    url: ruta_puntuar_contenido,
    data: {
      codigo: $(".contenido_datos").data("codigo"),
      puntuacion: puntuacion,
    },
    dataType: "json",
    async: true,
    success: function (response) {
      console.log(response);
      if (response.respuesta) {
        posicion_estrella = response.cantidad;
        console.log(posicion_estrella);
        $(".estrella").removeClass("estrella_seleccionada");
        for (let index = 0; index < posicion_estrella; index++) {
          $(".estrella").eq(index).addClass("estrella_seleccionada");
          console.log(index);
        }
      }
    },
  });
});
