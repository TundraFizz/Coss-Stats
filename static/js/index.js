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

  if(localStorage.getItem("page") !== null){
    var page = localStorage.getItem("page");
    $(`.page[page=${page}]`).css("display", "block");
    $(`.page-button[page=${page}]`).attr("current-page", "");
  }else{
    var page = "volume-tracker";
    $(`.page[page=${page}]`).css("display", "block");
    $(`.page-button[page=${page}]`).attr("current-page", "");
    localStorage.setItem("page", page);
  }

  if(localStorage.getItem("calc-page") !== null){
    var calcPage = localStorage.getItem("calc-page");
    $(`.calc-page[calc-page=${calcPage}]`).css("display", "block");
    $(`.page-button[calc-page=${calcPage}]`).attr("current-page", "");
  }else{
    var calcPage = "calc-fsa";
    $(`.calc-page[calc-page=${calcPage}]`).css("display", "block");
    $(`.page-button[calc-page=${calcPage}]`).attr("current-page", "");
    localStorage.setItem("calc-fsa", calcPage);
  }

  if(localStorage.getItem("fsa-coss-held")         !== null) $("#fsa-coss-held"        ).val(localStorage.getItem("fsa-coss-held"        ));
  if(localStorage.getItem("fsa-volume")            !== null) $("#fsa-volume"           ).val(localStorage.getItem("fsa-volume"           ));
  if(localStorage.getItem("fsa-fee-percentage")    !== null) $("#fsa-fee-percentage"   ).val(localStorage.getItem("fsa-fee-percentage"   ));
  if(localStorage.getItem("fsa-average-buy-price") !== null) $("#fsa-average-buy-price").val(localStorage.getItem("fsa-average-buy-price"));
  if(localStorage.getItem("coss-expected-roi")     !== null) $("#coss-expected-roi"    ).val(localStorage.getItem("coss-expected-roi"    ));
  if(localStorage.getItem("coss-volume")           !== null) $("#coss-volume"          ).val(localStorage.getItem("coss-volume"          ));
  if(localStorage.getItem("coss-fee-percentage")   !== null) $("#coss-fee-percentage"  ).val(localStorage.getItem("coss-fee-percentage"  ));

  if(localStorage.getItem("show-math") !== null){
    $(".show-math .button").attr("on", "");
    $(".math").css("display", "table");
  }

  // Investigate this
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

    if(i == 0 || hour == 23)
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
      <td><a href="https://etherscan.io/block/${weeklyRewards[i]['ethBlock']}" target="_blank">${weeklyRewards[i]["ethBlock"]}<span class="aaa"></span></a></td>
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
    "cossHeld"     : $($("#fsa-coss-held")[0]),
    "volume"       : $($("#fsa-volume")[0]),
    "feePercentage": $($("#fsa-fee-percentage")[0])
  };

  var failed = false;

  for(i in data){
    var self = data[i];
    var val  = $(self).val().trim();

    // Encapsulate self and val because of the delayed function inside
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
    })(self, val);

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

  $(".calc-page .totals").css("display", "table");
  $($(".calc-page .totals       .weekly-volume-total")[0]).text(`Total weekly volume (millions): ${weeklyVolume}`);
  $($(".calc-page .explanations .weekly-volume-total")[0]).text(`${weeklyVolume} = ${volume} * 7 | The weekly volume, which is daily volume multiplied by seven`);

  // The COSS exchange gets half of the volume
  weeklyVolume /= 2;

  $($(".calc-page .totals       .weekly-volume-community")[0]).text(`Community weekly volume (millions): ${weeklyVolume}`);
  $($(".calc-page .explanations .weekly-volume-community")[0]).text(`${weeklyVolume} = ${weeklyVolume*2} / 2 | Half of the total weekly volume because the COSS exchange gets half, while the other half goes to the community that holds the COSS tokens`);

  // Multiply weekly volume by average fee% to get the community's payout
  var communityPayout = weeklyVolume * feePercentage;

  $($(".calc-page .totals       .community-payout")[0]).text(`Community payout: ${communityPayout}m`);
  $($(".calc-page .explanations .community-payout")[0]).text(`${communityPayout}m = ${weeklyVolume}m * ${feePercentage} | The community's total payout is their volume * fee%`);

  var communityPayoutM = communityPayout;
  // Expand from "millions" notation to the actual value
  communityPayout *= 1000000;

  // There is about 100,000,000 (100 million) COSS in circulation
  var cossInCirculation = 100000000;

  // Divide by the coss in circulation to find out how much 1 coss will get you in USD per week
  communityPayout /= cossInCirculation;

  $($(".calc-page .totals       .one-coss-income")[0]).text(`1 COSS Income: ${communityPayout}`);
  $($(".calc-page .explanations .one-coss-income")[0]).text(`${communityPayout} = ${communityPayoutM}m / ${cossInCirculation} | This is how much income one COSS token generates. Divide the community's payout by the number of COSS tokens in circulation (100,000,000)`);

  var weeklyIncome   = (communityPayout * cossHeld);
  var yearlyIncome   = (weeklyIncome  * 52).toFixed(2);
  var monthlyIncome  = (weeklyIncome  * 4).toFixed(2);
      weeklyIncome   = (weeklyIncome).toFixed(2);
  var totalCossWorth = (cossHeld * cossValue).toFixed(2);

  $($(".fsa-calculator .fsa-weekly")[0]).text(weeklyIncome);
  $($(".fsa-calculator .fsa-monthly")[0]).text(monthlyIncome);
  $($(".fsa-calculator .fsa-yearly")[0]).text(yearlyIncome);
  $($(".fsa-calculator .total-coss-value")[0]).text(totalCossWorth);

  var averageBuyPrice = $($("#fsa-average-buy-price")[0]).val();

  if(isNaN(averageBuyPrice) || averageBuyPrice == 0){
    $($(".calculated-roi")[0]).text("-----");
    return;
  }

  var yearlyPayoutFromOneCoss = communityPayout * 52;

  var calculatedRoi = (yearlyPayoutFromOneCoss / averageBuyPrice) * 100;
  calculatedRoi = calculatedRoi.toFixed(0);

  $($(".calculated-roi")[0]).text(calculatedRoi);
});

$(".coss-price-calculator .submit").click(function(){
  var data = {
    "expectedRoi"  : $($("#coss-expected-roi")[0]),
    "volume"       : $($("#coss-volume")[0]),
    "feePercentage": $($("#coss-fee-percentage")[0])
  };

  var failed = false;

  for(i in data){
    var self = data[i];
    var val  = $(self).val().trim();

    // Encapsulate self and val because of the delayed function inside
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
    })(self, val);

    if(isNaN(val) || !val){
      failed = true;
    }else{
      data[i] = val;
    }
  }

  if(failed)
    return;

  // All fields are valid
  var expectedRoi   = data["expectedRoi"] / 100;
  var volume        = data["volume"];
  var feePercentage = data["feePercentage"] / 100;
  var weeklyVolume  = volume * 7;

  // 100% ROI   ( *1 )
  // 10,000,000 dv
  // 0.1%       af%

  // Multiply weekly volume by average fee% to get the amount in millions
  var totalFeePayout = weeklyVolume * feePercentage;

  // Multiply the result by 1,000,000 to get the actual value
  totalFeePayout *= 1000000;

  // The COSS exchange gets half of the total fee payout
  userFeePayout = totalFeePayout / 2;

  // There is about 100,000,000 (100 million) COSS in circulation
  var cossInCirculation = 100000000;

  // Divide by the coss in circulation to find out how much 1 coss will get you in USD per week
  userFeePayout /= cossInCirculation;

  // Multiply this by 52 to see how much 1 coss will generate in a year
  var yearlyPayoutFromOneCoss = userFeePayout * 52;

  var adjustedForRoi = (yearlyPayoutFromOneCoss * expectedRoi).toFixed(2);

  // Example:
  // Daily volume:  10 million
  // Average Fee :  0.1%
  // =>            $0.0182
  // This is expecting 100% ROI
  //
  // 50% ROI would be $0.0182 / 0.50 = 0.0364
  // 10% ROI would be $0.0182 / 0.10 = 0.182

  $($(".coss-price-calculator .estimated-price")[0]).text(adjustedForRoi);
});

$(".math .totals div").hover(function(){
  var c = $(this).attr("class");
  $(".explanations").css("display", "block");
  $(`.explanations div[class="${c}"]`).css("display", "block");
}, function(){
  var c = $(this).attr("class");
  $(".explanations").css("display", "none");
  $(`.explanations div[class="${c}"]`).css("display", "none");
});

$(".page-button").click(function(){
  var key  = $(this).attr("key");
  var page = $(this).attr(key);

  // Everything with the class of the key gets hidden
  $(`.${key}`).css("display", "none");

  // Show the content that belongs to the button that was pressed
  $(`.${key}[${key}=${page}]`).css("display", "block");

  // Remove current-page from all of the linked buttons
  $(`[${key}]`).removeAttr("current-page");

  // Set current-page to the button that was pressed
  $(this).attr("current-page", "");

  localStorage.setItem(key, page);
});

$(".show-math .button").click(function(){
  if($(this).attr("on") == undefined){
    // If the button is not on (undefined), turn it on
    localStorage.setItem("show-math", "on");
    $(this).attr("on", "");
    $(".math").css("display", "table");
  }
  else{
    // Otherwise turn it off
    localStorage.removeItem("show-math");
    $(this).removeAttr("on");
    $(".math").css("display", "none");
  }
});

$("input").bind("input", function(){
  var id  = $(this).attr("id");
  var val = $(this).val();
  localStorage.setItem(id, val);
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

$(".feedback .submit").click(function(){
  var message = $(".feedback .textarea textarea").val();

  $.post("send-feedback", {"message":message}, function(res){
    if(res["err"] == "false"){
      $(".feedback .textarea textarea").val("");
      $(".feedback .response").css("border-color", "#006b00");
      $(".feedback .response").css("background-color", "#00ce00");
    }else if(res["err"] == "true"){
      $(".feedback .response").css("border-color", "#6b0000");
      $(".feedback .response").css("background-color", "#ff7070");
    }

    $(".feedback .response").css("display", "inline-block");
    $(".feedback .response").text(res["msg"]);

    $(".feedback .response").animate({
      "opacity": "1"
    }, 300, "easeInQuad");
  });
});

$(".feedback .response").click(function(){
  var self = this;

  $(self).animate({
    "opacity": "0"
  }, 300, "easeOutQuad", function(){
    $(self).css("display", "none");
  });
});

Start();
VolumeHistory();
CountdownTimer();
WeeklyRewards();
setInterval(CountdownTimer, 10);

});
