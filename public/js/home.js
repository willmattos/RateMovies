var splide = new Splide(".splide", {
  type: "loop",
  autoplay: true,
  // interval: 2500,
  // drag   : 'free',
  // snap   : true,
  tabindex: "0",
  // pagination: false,
  // arrows: false
});
splide.mount();

$(".categoria_box").on(
  "click",
  ".card",
  function (e) {
    e.preventDefault();
    e.stopPropagation();
    var url = ruta_contenido;
    url = url.replace("numero", $(this).data("codigo"));
    url = url.replace("titulo", $(this).data("nombre"));
    window.location.href = url;
  }
);
$(".splide__slide").on(
  "click",
  ".card-heading,.portada",
  function (e) {
    console.log("click");
    e.preventDefault();
    e.stopPropagation();
    var url = ruta_contenido;
    url = url.replace("numero", $(this).parent().data("codigo"));
    url = url.replace("titulo", $(this).parent().data("nombre"));
    window.location.href = url;
  }
);