function loadMap(places) {
  var handler = Gmaps.build('Google');

  handler.buildMap({ internal: {id: 'map'}}, function(){
    var markers = handler.addMarkers(places);

    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
}
$(document).ready(drawMap);

function drawMap() {
  $.ajax({
      type: "GET",
      url: 'map'

    }).done(function(data,textStatus, jqXHR) {

        var places = [];
        for (x in data) { 
          var place = {};
          place["lat"] = data[x].latitude;
          place["lng"] = data[x].longitude;
          places.push(place);
        }
        console.log(places);
        loadMap(places);

    }).fail(function(jqXHR, textStatus, errorThrown) {
        alert( textStatus );

    }).always(function() { 
        
    });
}
