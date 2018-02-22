$(document).ready(function(){
  $(".wei").on('click', function (){
    $(this).addClass("active");
    $(this).parent().parent().addClass("active")
  });
  if (location.search == "?request_wei=true") {
    $(".right").addClass("active-tab")
    $(".nav").css({'padding-top': '0px'})
    $(".right").find("a").css({color: 'black'})
  } else {
      $(".left").addClass("active-tab")
      $(".nav").css({'padding-top': '0px'})
      $(".left").find("a").css({color: 'black'})
  }
});
