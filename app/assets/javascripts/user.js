$(document).ready(function(){
  $(".wei").on('click', function (){
    $(this).addClass("active");
    $(this).parent().parent().addClass("active")
  });
  if (location.search == "?request_wei=true") {
    $(".btn-right").addClass("active-tab")
    $(".nav").css({'margin-top': '0px'})
    $(".btn-right").find("a").css({color: 'black'})
  } else {
      $(".btn-left").addClass("active-tab")
      $(".nav").css({'margin-top': '0px'})
      $(".btn-left").find("a").css({color: 'black'})
  }
});
