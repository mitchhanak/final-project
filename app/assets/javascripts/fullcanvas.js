      var stage = new Konva.Stage({
        container: 'container',
        width: 500,
        height: 500
      });
      
      var logolayer = new Konva.Layer();
      var adlayer = new Konva.Layer();

      // instantiate variables?
      var logo = new Konva.Image();
      var ad = new Konva.Image();
      var adObj = new Image();
      var logoObj = new Image();
      
      logoObj.onload = function() {
        var logo = new Konva.Image({
          x: 0,
          y: 0,
          image: logoObj,
          width: 500,
          height: 500
        });
      
      logolayer.add(logo);
      stage.add(logolayer);
      };

//      adObj.onload = function() {
        
//      };
      
      function setImage() {
        adlayer.destroy(ad);
        var adurl = imageList[document.getElementById('adSelect').selectedIndex];
        var adObj = new Image();
        adObj.src = adurl;
        var imageAspectRatio = adObj.width / adObj.height;
        var width, height;
        if(imageAspectRatio > 1) {
          width = 500;
          height = adObj.height * 500 / adObj.width;
        }
        else if(imageAspectRatio < 1) {
          height = 500;
          width = adObj.width * 500/ adObj.height;
        }
        else {
          width = 250;
          height = 250;
        }
            
        var ad = new Konva.Image({
          x: 0,
          y: 0,
          image: adObj,
          width: width,
          height: height,
          draggable: true
        });
        ad.on('dragmove', updateText);        
        adlayer.add(ad);
        stage.add(adlayer);
      };

      logoObj.src = imgurl;
      adObj.src = adurl;

      function updateText(e) {
      //  text.text('Position: x = ' + e.target.x() + '   y = ' + e.target.y());
      //  layer.batchDraw();
        document.getElementById("posx").value = e.target.x();
        document.getElementById("posy").value = e.target.y();
      };
      
      function populateStartTime() {
        document.getElementById("start").value = player.currentTime;
      }

      function populateEndTime() {
        document.getElementById("end").value = player.currentTime;
      }