
    function crearCritica(comentarioTxt) {
        $.ajax({
            url: ruta_critica,
            type: "POST",
            data: {
                codigo:1,
                texto: "prueba"
            },
            success: function(response) {
                console.log(response);
                alert("Crítica publicada");
            },
            error: function(xhr, status, error) {
                console.error(error);
                alert("Error al publicar la crítica");
            }
        });
    }

    $("#crearCritica").click(function() {
        var comentarioTxt = $("#CriticaTxt").val();
        crearCritica(comentarioTxt);
    });
