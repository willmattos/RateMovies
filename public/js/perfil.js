var modificarfoto;
var fotohtml;
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
function modificarPerfil() {
  $(".usuario_perfil").html(
    `<input type='text' name='username' value='${username}' >`
  );
  modificarfoto = $(this).attr("src");
  $(this).attr("alt", "cancelar cambios");
  $(this).attr("src", cancelarfoto);
  $(this).addClass("cancelar_modificar");
  $(this).removeClass("editar_perfil");
  $(this).before(
    $(
      `<img class='aceptar_modificar' src='${aceptarfoto}' alt='aceptar cambios'>`
    )
  );
  fotohtml = $(".cabecera .foto").prop("outerHTML");
  $(".cabecera").prepend(
    $(
      `<div class='editar_foto'><img src='${$(".cabecera .foto").attr(
        "src"
      )}' alt='foto usuario' class='foto_fondo'><input type="file" name="nuevafoto" id="nuevafoto" class='nuevafoto'><img src='${img_modificar_foto}' alt='cambiarfoto' class='herramienta'></div>`
    )
  );
  $("input[type='file']").on("change", function () {
    $(this)
      .prev()
      .attr("src", URL.createObjectURL($(this)[0].files[0]));
  });
  $(".cabecera .foto").remove();
}
function aceptarModificar(e) {
  e.preventDefault();
  console.log(ruta_actualizar_perfil);
  var inputFile = $(".nuevafoto")[0].files[0]
    ? $(".nuevafoto")[0].files[0]
    : null;
  var formData = new FormData();
  var cambiofoto = false;
  if (inputFile) {
    cambiofoto = true;
    formData.append("file", inputFile);
  } else {
    formData = null;
  }
  $(".editar_foto").remove();
  $(".cabecera").prepend(fotohtml);
  if (cambiofoto) {
    $.ajax({
      type: "POST",
      url: ruta_actualizar_foto,
      data: formData,
      processData: false,
      contentType: false,
      dataType: "json",
      success: function (response) {
        console.log(response);
      },
    });
    $(".cabecera .foto").attr("src", URL.createObjectURL(inputFile));
  }
  
  $(this).next().attr("alt", "modificar perfil");
  $(this).next().attr("src", modificarfoto);
  $(this).next().addClass("editar_perfil");
  $(this).next().removeClass("cancelar_modificar");
  $(this).remove();
}
function cancelarModificar(e) {
  e.preventDefault();
  $(this).attr("alt", "modificar perfil");
  $(this).attr("src", modificarfoto);
  $(this).addClass("editar_perfil");
  $(this).removeClass("cancelar_modificar");
  $(this).prev().remove();
  $(".editar_foto").remove();
  $(".cabecera").prepend(fotohtml);
}
$(document).on("click", ".editar_perfil", modificarPerfil);
$(document).on("click", ".cancelar_modificar", cancelarModificar);
$(document).on("click", ".aceptar_modificar", aceptarModificar);
