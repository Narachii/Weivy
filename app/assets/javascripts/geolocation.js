function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successCallback, errorCallback)
  } else {
    console.log("NG")
  }
}

function successCallback(position) {
  console.log(position)
  $.ajax({
    url: location.origin + '/user_locations',
    type: 'POST',
    data: { latitude: position["coords"]["latitude"], longitude: position["coords"]["longitude"] }
  }).done(function(data) {
    // serchWeier()
  })
}

function errorCallback(errors) {
  console.log(errors)
}

function sarchWeier() {
  $.ajax({
    url: location.origin + '/users/weier',
    type: 'GET',
    data: { dist: 200 } // TODO 可変にする
  }).done(function(data) {
  })
}
