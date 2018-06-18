$(document).ready(function(){

function Start(){
  if(localStorage.getItem("fsa") !== null){
    var fsa = JSON.parse(localStorage.getItem("fsa"));
    LoadTable(fsa);
  }else{
    $(".fsa-stats").hide();
    $(".delete").hide();
    $(".dropzone").show();
  }

  $.event.props.push("dataTransfer");
}

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

function VolumeHistory(){
  var html = "";
  for(var i = 0; i < volumeHistory.length; i++){
    var date = "";
    var hour = moment(volumeHistory[i]["date"]).hour();

    if(i == 0 || hour == 0)
      date = moment(volumeHistory[i]["date"]).format("MMMM DD, YYYY");

    html += `
    <tr>
      <td>${date}</td>
      <td>${hour}</td>
      <td>${volumeHistory[i]["volume"]}</td>
    </tr>`;
  }

  $($(".vh")[0]).html(html);
}

function CountdownTimer(){
  var countdown = moment.duration(moment(nextEthBlock).diff(moment()));

  $($(".next-eth-block .data .days    div")[0]).html(countdown.days());
  $($(".next-eth-block .data .hours   div")[0]).html(countdown.hours());
  $($(".next-eth-block .data .minutes div")[0]).html(countdown.minutes());
  $($(".next-eth-block .data .seconds div")[0]).html(countdown.seconds());
}

function WeeklyRewards(){
  var html = "";
  for(var i = 0; i < weeklyRewards.length; i++){
    var date = moment(weeklyRewards[i]["date"]).format("MMMM DD, YYYY @ HH:mm:ss");

    html += `
    <tr>
      <td><a href="https://etherscan.io/block/${weeklyRewards[i]['date']}" target="_blank">${weeklyRewards[i]["ethBlock"]}<span class="aaa"></span></a></td>
      <td>${date}</td>
      <td>${weeklyRewards[i]["volume"]}</td>
      <td>${weeklyRewards[i]["value"]}</td>
      <td>${weeklyRewards[i]["fee"]}</td>
    </tr>`;
  }

  $($(".wr")[0]).html(html);
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

$(".fsa-calculator .submit").click(function(){
  var data = {
    "cossHeld"     : $($(".fsa-calculator .coss-held")[0]),
    "volume"       : $($(".fsa-calculator .volume")[0]),
    "feePercentage": $($(".fsa-calculator .fee-percentage")[0])
  };

  var failed = false;

  for(i in data){
    var self = data[i];
    var val  = $(self).val().trim();

    // Encapsulate self and val because of the delayed funcation inside
    (function(self, val){
      // If the element isn't animated, animate a glowing red border over the invalid field
      if((isNaN(val) || !val) && !$(self).is(":animated")){
        $(self).animate({
          "border-color": "red"
        }, 500, "easeInQuad", function(){
          $(self).animate({
            "border-color": "transparent"
          }, 500, "easeOutQuad");
        });
      }
    })(data, val);

    if(isNaN(val) || !val){
      failed = true;
    }else{
      data[i] = val;
    }
  }

  if(failed)
    return;

  // All fields are valid
  var cossHeld      = data["cossHeld"];
  var volume        = data["volume"];
  var feePercentage = data["feePercentage"] / 100;
  var weeklyVolume  = volume * 7;

  // Multiply weekly volume by average fee% to get the amount in millions
  var totalFeePayout = weeklyVolume * feePercentage;

  // Multiply the result by 1,000,000 to get the actual value
  totalFeePayout *= 1000000;

  // The COSS exchange gets half of the total fee payout
  userFeePayout = totalFeePayout / 2;

  // There is about 100,000,000 (100 million) COSS in circulation
  var cossInCirculation = 100000000;

  userFeePayout /= cossInCirculation;

  var weeklyIncome   = (userFeePayout * cossHeld).toFixed(2);
  var monthlyIncome  = (weeklyIncome * 4).toFixed(2);
  var yearlyIncome   = (weeklyIncome * 52).toFixed(2);
  var totalCossWorth = (cossHeld * cossValue).toFixed(2);

  console.log("==========================================");
  console.log("coss held:", cossHeld);
  console.log("fee %    :", feePercentage);
  console.log("d volume :", volume);
  console.log("w volume :", weeklyVolume);
  console.log("payout 1 :", totalFeePayout);
  console.log("coss cir :", cossInCirculation);
  console.log("payout 2 :", userFeePayout);
  console.log("w income :", weeklyIncome);
  console.log("m income :", monthlyIncome);
  console.log("y income :", yearlyIncome);

  // Daily volume: 2.4
  // Average fee : 0.12

  // payout per coss: 0.0001008
  // w income       : 2.52

  $($(".fsa-weekly")[0]).text(weeklyIncome);
  $($(".fsa-monthly")[0]).text(monthlyIncome);
  $($(".fsa-yearly")[0]).text(yearlyIncome);
  $($(".total-coss-worth")[0]).text(totalCossWorth);
});

$(".coss-price-calculator .submit").click(function(){
  alert("1");
});

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

Start();
VolumeHistory();
CountdownTimer();
WeeklyRewards();
setInterval(CountdownTimer, 10);

});
