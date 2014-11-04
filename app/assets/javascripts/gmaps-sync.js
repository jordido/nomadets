var default_map_center_latitude = 41.3810212;
var default_map_center_longitude = 2.1681336;
var default_general_zoom = 14
var default_place_zoom = 20
var map;
var ROOT_URL = 'http://localhost:3000';
var infowindow;
var places = [];

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
  infowindow = new google.maps.InfoWindow();
	map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
	var i;
	for (i in places) { 
		var marker = new google.maps.Marker( {
	    position: places[i].coords,
	    draggable: true,
	    map: map,
	    // icon: 'map-pin-green.png',
	    title: places[i].name
		});
		makeInfoWindowEvent(map, infowindow, places[i].name, places[i].url, marker);
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

//$(document).ready(loadScript);
$(window).load(loadScript);

function get_coords() {
  $.ajax({
      type: "GET",
      url: 'map'

    }).done(function(data,textStatus, jqXHR) {
    		var i;
//        var places = [];
        for (i in data) { 
          var place = {};
          place["id"] = data[i].id
          place["url"] = data[i].website_url;
          place["name"] = data[i].name + " " + data[i].last_name 
          // place["lat"] = data[x].latitude;
          // place["lng"] = data[x].longitude;
//         var coords = new google.maps.LatLng(data[x].latitude, data[x].longitude);
          place["coords"] = new google.maps.LatLng(data[i].latitude, data[i].longitude);
          places.push(place);
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
        bounds.extend(markersArray[i].coords);
    }
    map.fitBounds(bounds);
}

function makeInfoWindowEvent(map, infowindow, contentString, url, marker) {
  google.maps.event.addListener(marker, 'click', function() {
  	content = '<p id="hook">' + contentString + '</p>';
  	whole_content = '<a href='+ url + '>' + content + '</a>';
    infowindow.setContent(whole_content);
    infowindow.open(map, marker);
  });
}