
     var singleLatLng = {lat: 40.74135, lng: -73.99802};
     var vallarta = {lat: 20.604725, lng: -105.234562};
     var map;

    //  var myLatlng = new google.maps.LatLng(40.74135, -105.234562);
     var mapOptions = {
      zoom: 15,
      center: vallarta,
      mapTypeId: 'roadmap'
      };


     function initMap() {
       map = new google.maps.Map(document.getElementById('map'), mapOptions);


       // TODO: Create a single marker appearing on initialize -
       // Create it with the position of the singleLatLng,
       // on the map, and give it your own title!

       var vallarta_river_cafe = {lat: 20.6055000, lng: -105.2364000};
       var marker_vallarta_river_cafe = new google.maps.Marker({
         position: vallarta_river_cafe,
         map: map,
         title: 'The River Cafe!'
       });

       var infowindow = new google.maps.InfoWindow({
         content: 'An excellent place for dinner or breakfast. Live entertainment nightly'
       });

       marker_vallarta_river_cafe.addListener('click', function(){
         infowindow.open(map, marker_vallarta_river_cafe);
       });

       // TODO: create a single infowindow, with your own content.
       // It must appear on the marker

       // TODO: create an EVENT LISTENER so that the infowindow opens when
       // the marker is clicked!
     }
