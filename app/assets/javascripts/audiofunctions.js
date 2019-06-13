      const player = new Plyr('#player');
      
      // script for the start time / end time buttons
      function populateStartTime() {
        document.getElementById("start").value = player.currentTime;
      };
      function populateEndTime() {
        document.getElementById("end").value = player.currentTime;
      };
      
      // auto-update current time in hidden input - to be used for animating layers
//      player.on('timeupdate', function(event) {
//          document.getElementById("currentTime").value = player.currentTime;
//      });