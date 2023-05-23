var splide = new Splide(".splide", {
    type: "loop",
    autoplay: true,
    interval: 2500,
    pagination: false,
    tabindex: "0",
    arrows: false
  });
  splide.mount();

  $("#check").change(()=>{
    console.log($(".splide__arrow").css("z-index"));
    
    if($(".splide__arrow").css("z-index") == 0){
      $(".splide__arrow").css("z-index","1")
    }else{
      $(".splide__arrow").css("z-index","0")
    }
  })