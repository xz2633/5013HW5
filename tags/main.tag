<main>
  <div style="height:50px; width:1000px;" align="center">
    <button onclick={ resetAll }>RESET THE ATTACK</button>
  </div>
  <div style="height:600px; width:1000px;" align="center">
        <div style="width:500px; float:left">
            <speakbox each={ msg in teachList }></speakbox>
            <workout></workout>
            <div style="width:500px">
                <h3>Please type in what you want to teach me to say!</h3>
                <textarea ref="sentenceBody" rows="8" cols="50"></textarea>
                <button type="button" onclick={ sendMessage }>Teach!</button>
            </div>
            <pastsentence each={ msg in teachList }></pastsentence>
        </div>
        <div style="width:500px; float:left">
            <speakbox2 each={ msgz in teachListz }></speakbox2>
            <workout2></workout2>
          <div style="width:500px">
              <h3>Please type in what you want to teach me to say!</h3>
              <textarea ref="sentenceBodyz" rows="8" cols="50"></textarea>
              <button type="button" onclick={ sendMessagez }>Teach!</button>
          </div>
            <pastsentence2 each={ msgz in teachListz }></pastsentence2>
        </div>
  </div>

  	<script>
  		var that = this;





  		this.teachList = [];
  		this.remove = function(event) {
  			var trainObj = event.item;
  			var index = that.teachList.indexOf(trainObj);
  			that.teachList.splice(index, 1);
  			that.update();
  		};

      this.unmountPastsentence = function(event) {
      this.unmount();
      };


      resetAll(event) {
  			observable.trigger('reset');
  		}
//////////////////////////////////////////////////////
      var messagesRef = rootRef.child('teachList');
      this.sendMessage = function(){
        var key = messagesRef.push().key;
        var msg = {
          body: this.refs.sentenceBody.value
        };

        messagesRef.push(msg);
      }
      // Listen for data changes (READ)
      // See 0-dataRead
      messagesRef.on('value', function(snap){
        let dataAsObj = snap.val();


        var tempData = [];

        for (key in dataAsObj) {
          tempData.push(dataAsObj[key]);
        }

        that.teachList = tempData;

        that.update();
      });
///////////////////////////////////////////////////

  		this.teachListz = [];

  		this.removez = function(event) {
  			var trainObjz = event.item;
  			var indexz = that.teachListz.indexOf(trainObjz);
  			that.teachListz.splice(indexz, 1);
  			that.update();
  		};

      this.unmountPastsentence = function(event) {
      this.unmount();
      };
      //////////////////////////////////////////////////////
            var messageszRef = rootRef.child('teachListz');
            this.sendMessagez = function(){
              var key = messageszRef.push().key;
              var msgz = {
                bodyz: this.refs.sentenceBodyz.value
              };

              messageszRef.push(msgz);
            }
            // Listen for data changes (READ)
            // See 0-dataRead
            messageszRef.on('value', function(snap){
              let dataAsObj = snap.val();


              var tempData = [];

              for (key in dataAsObj) {
                tempData.push(dataAsObj[key]);
              }

              that.teachListz = tempData;

              that.update();
            });
      ///////////////////////////////////////////////////



  	</script>

</main>
