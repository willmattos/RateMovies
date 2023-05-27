$(".crearComentario").click(function () {
  var texto = $(this).prev().val();
  if (texto) {
    $.ajax({
      type: "post",
      url: ruta_crear_comentario,
      data: {
        codigo: 3,
        texto: texto,
      },
      dataType: "json",
      success: function (response) {
        console.log(response.respuesta);
        if (response.respuesta) {
          $(this).prev().val("");
          console.log(1);
        } else {
          console.log(2);
          $(this)
            .prev()
            .css("border-color", "red")
            .delay(1500)
            .queue(function (next) {
              $(this).css("border-color", "initial");
              next();
            });
        }
      },
    });
  } else {
    $(this)
      .prev()
      .css("border-color", "red")
      .delay(1500)
      .queue(function (next) {
        $(this).css("border-color", "initial");
        next();
      });
  }
});
