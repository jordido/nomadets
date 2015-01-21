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
    scrollwheel: true,
    minZoom: 2,
    styles: [{"featureType":"administrative.country","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"administrative.province","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"administrative.locality","elementType":"labels","stylers":[{"visibility":"simplified"}]},{"featureType":"administrative.neighborhood","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"administrative.land_parcel","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#e0efef"}]},{"featureType":"poi","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"hue":"#1900ff"},{"color":"#c0e8e8"}]},{"featureType":"poi","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"all","stylers":[{"visibility":"off"}]},{"featureType":"road","elementType":"geometry","stylers":[{"lightness":100},{"visibility":"simplified"}]},{"featureType":"road","elementType":"labels","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"all","stylers":[{"visibility":"on"}]},{"featureType":"transit.line","elementType":"geometry","stylers":[{"visibility":"on"},{"lightness":700}]},{"featureType":"water","elementType":"all","stylers":[{"color":"#7dcdcd"}]}]
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
        for (i in data) { 
          var place = {};
          place["id"] = data[i].id
          place["url"] = "show/" + data[i].id;
          place["name"] = data[i].name + " " + data[i].last_name 
          place["coords"] = new google.maps.LatLng(data[i].latitude, data[i].longitude);
          places.push(place);
        }
        initialize(places);

    }).fail(function(jqXHR, textStatus, errorThrown) {
        // alert( textStatus );
      
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