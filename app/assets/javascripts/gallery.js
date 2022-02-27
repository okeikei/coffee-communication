let map
let geocoder
let centerp = {lat: 33.60639, lng: 130.41806}

function initMap(){
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('target'), {
    center: centerp,
    zoom: 12,
  });

  marker = new google.maps.Marker({
    position: centerp,
    map: map
  });
}

function codeAddress(){
  let inputAddress = document.getElementById('address').value;

  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('該当する結果がありませんでした：' + status);
    }
  });   
}
