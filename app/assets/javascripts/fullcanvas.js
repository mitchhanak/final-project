      var stage = new Konva.Stage({
        container: 'container',
        width: 500,
        height: 500
      });
      
      // layers for the logo, ad to be added, and existing ads (relayer)
      var logolayer = new Konva.Layer();
      var adlayer = new Konva.Layer();
      var relayer = new Konva.Layer();
      var loadedAd = [];
      var thisObj = [];
      stage.add(logolayer);
      stage.add(relayer);
      stage.add(adlayer);

      // image containers for the above
      var logo = new Konva.Image({
        width: 500,
        height: 500
      });
      var ad = new Konva.Image({
        x: 0,
        y: 0,
        draggable: true
      });
      logolayer.add(logo);
      adlayer.add(ad);
      var adObj = new Image();
      var logoObj = new Image();
      
      
      logoObj.onload = function() {
        logo.image(logoObj);

        logolayer.draw();
//      logolayer.moveToBottom();
      };
      
      adObj.onload = function() {
        
        // add or replace the existing the image to the layer
        ad.image(adObj);
        
        // getting current dimensions
        var w = adObj.width;
        var h = adObj.height;
        var wMax = stage.getWidth();
        var hMax = stage.getHeight();
        // calculating ratios
        var wFit = wMax / w;
        var hFit = hMax / h;
        var scale = (wFit > hFit) ? hFit : wFit;
    
        w = parseInt(w * scale, 10);
        h = parseInt(h * scale, 10);
        
        // resizing the ad layer
        ad.size({
          width: w,
          height: h
        });
        ad.position({
          x:0,
          y:0
        })
        
        // passing the dimensions back into the HTML form
        document.getElementById("width").value = w;
        document.getElementById("height").value = h;
        
        // redrawing the layer
        adlayer.draw();
        adlayer.moveToTop();
      };

      function setImage() {
        var adurl = imageList[document.getElementById('adSelect').selectedIndex];

        // load the image
        adObj.src = adurl;
      };

      function updateText(e) {
        document.getElementById("posx").value = e.target.x();
        document.getElementById("posy").value = e.target.y();
      };
      
      // script to rebuild previously placed ads
      function reBuild(ind,thisX,thisY,thisWidth,thisHeight,thisSrc) {
        thisObj[ind] = new Image();
        loadedAd[ind] = new Konva.Image({
          x: thisX,
          y: thisY,
          image: thisObj[ind],
          width: thisWidth,
          height: thisHeight,
          draggable: false
        });
        thisObj[ind].src = thisSrc;
        
        relayer.add(loadedAd[ind]);
        loadedAd[ind].hide();
        relayer.draw();
      };
      
      // functions for showing and hiding ads; executed via html
      function adShower(ind) {
        loadedAd[ind].show();
        relayer.draw();
      }
      function adHider(ind) {
        loadedAd[ind].hide();
        relayer.draw();
      }
      
      // add the listener to update x/y coordinates in HTML form
      ad.on('dragmove', updateText);
      
      // load the logo
      logoObj.src = imgurl;