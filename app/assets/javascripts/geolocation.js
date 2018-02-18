function getLocation() {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successCallback, errorCallback)
  } else {
    console.log("NG")
  }
}

function successCallback(position) {
  console.log(position)
}

function errorCallback(errors) {
  console.log(errors)
}
