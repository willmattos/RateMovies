let contador;
$("#select").change(function () {
  if ($(this).val() == 1) {
    $(".pelicula").css("display", "block");
    $(".serie").css("display", "none");
  } else {
    $(".pelicula").css("display", "none");
    $(".serie").css("display", "block");
    $(".contenido").remove();
    contador = 1;
    agregarTemporada();
  }
});
$("#temporada").click(function () {
  agregarTemporada();
});
function agregarTemporada() {
  $(".main").append(
    $(`<div class="row contenido">
        <label for="">Temporada</label>
        <input type="number" name="temporada" value="${contador++}" min="1">
    </div>
    <div class="row contenido">
    <label for="">Nº Episodios</label>
    <input type="number" min="1">
    </div>
    <div class='column contenido'>
        <label for="">Descripcion</label>
        <textarea name="" id="" cols="30" rows="10"></textarea>
    </div>
    <div class="row contenido">
        <label for="">Trailer</label>
        <input type="url" placeholder="https://example.com" pattern="https://.*"/>
    </div>`)
  );
}
$("input[class='file_upload']").on("change", function () {
  $(this).parent().next().attr("src", URL.createObjectURL($(this)[0].files[0]));
  // if ($(this).attr("name") == "poster") {
  // } else {
  //   $(".portada").attr("src", URL.createObjectURL($(this)[0].files[0]));
  // }
  $(this).next($("<button class='file_delete'>Eliminar</button>"));
  // $(this)
  //   .prev()
  //   .attr("src", URL.createObjectURL($(this)[0].files[0]));
});
$(".file_delete").click(function () {
  $(this).prev().val("");
  $(this).remove();
});
$('#genero').on('keyup', function(event) {
  if (event.key === ',') {
    var genero = $(this).val().replace(",","");
    $(this).val("")
    console.log(genero);
    $(".generos").append($(`<div>${genero}</div>`))
  }
});