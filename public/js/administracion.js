function filtrar(nombre) {
    $.ajax({
      type: "post",
      url: ruta_filtrar_usuarios,
      data: {
        nombre: nombre,
      },
      dataType: "json",
      success: function (response) {
        console.log(response);
        $(".usuarios_box").empty();
        response.forEach((element) => {
          var div =
            $(`<div class="row usuarios ${element.codigo}" data-codigo="${element.codigo}">
                  <img src="/ratemovies/public/Usuario/u${element.codigo}/${element.foto}" alt="foto usuario" class="foto">
                  <div class="enlace nombre_usuario">${element.usuario}</div>
                  <div class="eliminar btn">Eliminar</div>
              </div>`);
          if (element.rol) {
            $(div).append(`<div class="admin btn">Quitar Admin</div>`);
          } else {
            $(div).append(`<div class="admin btn">Admin</div>`);
          }
          $(".usuarios_box").append($(div));
          if (!element.foto.length) {
            $(`[data-codigo="${element.codigo}"] img`).attr("src", userfoto);
          }
        });
      },
    });
  }
  filtrar("");
$(".filtrar").keyup(function (e) {
  var nombre = $(this).val();
  filtrar(nombre);
});

