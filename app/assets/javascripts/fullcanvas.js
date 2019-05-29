      var stage = new Konva.Stage({
        container: 'container',
        width: 500,
        height: 500
      });
      
      var layer = new Konva.Layer();
      var circle = new Konva.Circle({
        x: 150,
        y: 120,
        radius: 50,
        fill: 'red',
        stroke: 'black',
        strokeWidth: 4,
        draggable: true
      });

      // var text = new Konva.Text();

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
      

        // add the logo to the layer FIRST
      layer.add(logo);
      
      // helper text THIRD
      // layer.add(text);
      
      // add the layer to the stage LAST
      stage.add(layer);
      };

      adObj.onload = function() {
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
      
      layer.add(ad);

      stage.add(layer);
      };
      
      function setImage() {
        var x = document.getElementById("adSelect").selectedIndex;
        var adurl = document.getElementsByTagName("option")[x].imgsrc;
      };

      logoObj.src = imgurl;
      adObj.src = adurl;

      function updateText(e) {
      //  text.text('Position: x = ' + e.target.x() + '   y = ' + e.target.y());
      //  layer.batchDraw();
        document.getElementById("posx").value = e.target.x();
        document.getElementById("posy").value = e.target.y();
      };

      ad.on('dragmove', updateText);