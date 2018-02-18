function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successCallback, errorCallback)
  } else {
    console.log("NG")
  }
}

function successCallback(position) {
  console.log(position)
  // url = location.origin + '/user_locations?latitude=' + position["coords"]["latitude"] + '&longitude=' + position["coords"]["longitude"]
  $.ajax({
    url: location.origin + '/user_locations',
    type: 'POST',
    data: {latitude: position["coords"]["latitude"], longitude: position["coords"]["longitude"] }
  }).done(function(data) {
  })
}

function errorCallback(errors) {
  console.log(errors)
}

function sarchWeier() {
  $.ajax({
    url: url,
    type: 'GET'
  }).done(function(data) {
  })
}
