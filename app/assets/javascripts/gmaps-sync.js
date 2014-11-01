var default_map_center_latitude = 41.3810212;
var default_map_center_longitude = 2.1681336;
var default_general_zoom = 14
var default_place_zoom = 20
var map;
var ROOT_URL = 'http://localhost:3000';

function initialize(places) {
	 var mapOptions = {
      center: new google.maps.LatLng(default_map_center_latitude, default_map_center_longitude),
      zoom: default_general_zoom,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      panControl: true,
      scaleControl: true,
      streetViewControl: true,
      overviewMapControl: true,
      scrollwheel: true
    };

	map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
// var coords = new google.maps.LatLng(parseFloat(default_map_center_latitude), parseFloat(default_map_center_longitude));
	for (x in places) { 
		var marker = new google.maps.Marker( {
	    position: places[x],
	    draggable: true,
	    map: map,
	    // icon: 'map-pin-green.png',
	    title: "prueba de pin"
		});
	}
	setBounds(places);
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&' +
      'callback=get_coords';
  document.body.appendChild(script);
}

$(document).ready(loadScript);

function get_coords() {
  $.ajax({
      type: "GET",
      url: 'map'

    }).done(function(data,textStatus, jqXHR) {

        var places = [];
        for (x in data) { 
          // var place = {};
          // place["lat"] = data[x].latitude;
          // place["lng"] = data[x].longitude;
          var coords = new google.maps.LatLng(data[x].latitude, data[x].longitude);
          places.push(coords);
        }
        console.log(places);
        initialize(places);

    }).fail(function(jqXHR, textStatus, errorThrown) {
        alert( textStatus );
      

    }).always(function() { 
        
    });
}

function setBounds(markersArray) {

    var bounds = new google.maps.LatLngBounds();
    for (var i=0; i < markersArray.length; i++) {
        bounds.extend(markersArray[i]);
    }
    map.fitBounds(bounds);
}