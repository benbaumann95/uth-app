function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var eventAddress = document.getElementById('event_address');

    if (eventAddress) {
      var options = {
        types: [ 'establishment' ],
        componentRestrictions: {country: 'gb'}
      }
      var autocomplete = new google.maps.places.Autocomplete(eventAddress, options);
      google.maps.event.addDomListener(eventAddress, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault();
        }
      });
    }
  });
}


autocomplete()
