$(".comentar").click(function (e) {
  e.preventDefault();

});
//critica
$.ajax({
    type: "method",
    url: ruta,
    data: "data",
    dataType: {
        codigo_contenido: codigo,
        texto: texto
    },
    success: function (response) {
        
    }
});
//comentario
$.ajax({
    type: "method",
    url: "url",
    data: {
        codigo_critica: codigo,
        texto: texto
    },
    dataType: "dataType",
    success: function (response) {
        
    }
});