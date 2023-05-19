$(".modificar").click(function () {
  $(".contenido_agregar").css("display", "none");
  $(".contenido_modificar").css("display", "block");
});
$(".aniadir").click(function () {
  $(".contenido_modificar").css("display", "none");
  $(".contenido_agregar").css("display", "block");
});
$(".tipo").click(function () {
  if ($(this).attr("id") == "1") {
    $(".pelicula").css("display", "block");
    $(".serie").css("display", "none");
  } else {
    $(".serie").css("display", "block");
    $(".pelicula").css("display", "none");
  }
});
let contador = 1;
$("#temporada").click(function () {
  $(".serie").append(
    $(`<div>
    <div>
        <label for="">Temporada</label>
        <input type="number" name="temporada" value="${contador++}" min="1">
    </div>
    <div>
    <label for="">Nº Episodios</label>
    <input type="number" min="1">
    </div>
    <div>
        <label for="">Descripcion</label>
        <textarea name="" id="" cols="30" rows="10"></textarea>
    </div>
    <div>
        <label for="">Trailer</label>
        <input type="url" placeholder="https://example.com" pattern="https://.*"/>
    </div>
</div>`)
  );
});
$("input[class='file_upload']").on("change", function () {
    if($(this).attr("name") == "poster"){
        $(".poster").attr("src", URL.createObjectURL($(this)[0].files[0]));
    }else{
        $(".portada").attr("src", URL.createObjectURL($(this)[0].files[0]));

    }
    $(this).next($("<button class='file_delete'>Eliminar</button>"))
    // $(this)
    //   .prev()
    //   .attr("src", URL.createObjectURL($(this)[0].files[0]));
  });
  $(".file_delete").click(function(){
    $(this).prev().val("")
    $(this).remove()
  })