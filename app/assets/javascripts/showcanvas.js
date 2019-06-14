      var stage = new Konva.Stage({
        container: 'container',
        width: 500,
        height: 500
      });
      
      // layers for the logo, ad to be added, and existing ads (relayer)
      var logolayer = new Konva.Layer();
      var relayer = new Konva.Layer();
      var loadedAd = [];
      var thisObj = [];
      stage.add(logolayer);
      stage.add(relayer);

      // image containers for the above
      var logo = new Konva.Image({
        width: 500,
        height: 500
      });
      logolayer.add(logo);
      var adObj = new Image();
      var logoObj = new Image();
      
      
      logoObj.onload = function() {
        logo.image(logoObj);

        logolayer.draw();
//      logolayer.moveToBottom();
      };
      
      // script to rebuild previously placed ads
      function reBuildPlus(ind,thisX,thisY,thisWidth,thisHeight,thisSrc,thisTarget) {
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
        
        // mouse events - very fancy stuff
        loadedAd[ind].on('click', function() { window.open(thisTarget) });
        loadedAd[ind].on('mouseenter', function() {
          stage.container().style.cursor = 'pointer';
        });
        loadedAd[ind].on('mouseleave', function() {
          stage.container().style.cursor = 'pointer';
        });

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
      
      // load the logo
      logoObj.src = imgurl;