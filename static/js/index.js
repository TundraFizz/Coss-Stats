function LoadTable(fsa){
  var fsaValue = 0;
  var netValue = 0;
  var html     = "";

  for(token in fsa){
    var fV    = parseFloat(fsa[token]["fsaValue"]);
    var nV    = parseFloat(fsa[token]["netValue"]);
    fsaValue += (isNaN(fV)) ? 0 : fV;
    netValue += (isNaN(nV)) ? 0 : nV;
    html     += `
    <tr>
      <td>${token}</td>
      <td>${fsa[token]["remaining"]}</td>
      <td>${fsa[token]["fsaValue"]}</td>
      <td>${fsa[token]["fee"]}</td>
      <td>${fsa[token]["netValue"]}</td>
    </tr>
    `;
  }

  $(".fsa-value").html("$" + fsaValue.toFixed(2));
  $(".net-value").html("$" + netValue.toFixed(2));
  $(".fsa-stats tbody").html(html);
  $(".fsa-stats").show();
  $(".delete").show();
  $(".dropzone").hide();
}

$(document).ready(function(){
  VolumeHistory();
  CountdownTimer();
  setInterval(CountdownTimer, 10);

  if(localStorage.getItem("fsa") !== null){
    var fsa = JSON.parse(localStorage.getItem("fsa"));
    LoadTable(fsa);
  }else{
    $(".fsa-stats").hide();
    $(".delete").hide();
    $(".dropzone").show();
  }

  var filename   = "";
  var image_data = "";

  $.event.props.push("dataTransfer");

  $(".dropzone").on({
    dragenter: function(e){
      Stop(e);
      $(this).css("background-color", "#bbd9ff");
    },
    dragover: function(e){
      Stop(e);
      $(this).css("background-color", "#bbd9ff");
    },
    dragleave: function(e){
      Stop(e);
      $(this).css("background-color", "");
    },
    drop: function(e){
      Stop(e);
      $(this).css("background-color", "");

      var file = e.dataTransfer.files[0];
      var fileReader = new FileReader();
      fileReader.readAsDataURL(file);

      var data = new FormData();
      data.append("files", file);

      $.ajax({
        "url": "upload-fee-split",
        "type": "post",
        "dataType": "json",
        "data": data,
        "processData": false,
        "contentType": false,
        success: function(fsa){
          if("error" in fsa){
            console.log(fsa["error"]);
          }else{
            // Save the result into localStorage and load the table
            localStorage.setItem("fsa", JSON.stringify(fsa));
            LoadTable(fsa);
          }
        }
      });
    }
  });

  $(".delete").click(DeleteFsaData);
});

function VolumeHistory(){
  console.log(volumeHistory);
  // volumeHistory = JSON.parse(volumeHistory);
  console.log(JSON.stringify(volumeHistory));
  var html = "";
  for(var i = 0; i < volumeHistory.length; i++){
    html += `
    <tr>
      <td>${volumeHistory[i]["date"]}</td>
      <td>${volumeHistory[i]["hour"]}</td>
      <td>${volumeHistory[i]["volume"]}</td>
    </tr>`;
  }

  $($(".vh")[0]).html(html);
}

function CountdownTimer(){
  nextEthBlock = moment(nextEthBlock, "ddd MMM D YYYY HH:mm:ss"); // Mon Jun 18 2018 01:00:00 GMT-0700 (Pacific Daylight Time)
  var countdown = moment.duration(nextEthBlock.diff(moment()));

  $($(".next-eth-block .data .days"   )[0]).html(countdown.days());
  $($(".next-eth-block .data .hours"  )[0]).html(countdown.hours());
  $($(".next-eth-block .data .minutes")[0]).html(countdown.minutes());
  $($(".next-eth-block .data .seconds")[0]).html(countdown.seconds());
}

function DeleteFsaData(){
  localStorage.removeItem("fsa");
  $(".fsa-stats").hide();
  $(".delete").hide();
  $(".dropzone").show();
  $(".fsa-value").html("$0.00");
  $(".net-value").html("$0.00");
}

function Stop(e){
  e.stopPropagation();
  e.preventDefault();
}
