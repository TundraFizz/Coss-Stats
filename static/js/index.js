$(document).ready(function(){
  var filename = "";
  var image_data = "";

  $.event.props.push("dataTransfer");

  $(".dropzone").on({
    dragenter: function(e){
      e.stopPropagation();
      e.preventDefault();
      $(this).css("background-color", "lightBlue");
    },
    dragover: function(e){
      e.stopPropagation();
      e.preventDefault();
      $(this).css("background-color", "lightBlue");
    },
    dragleave: function(e){
      e.stopPropagation();
      e.preventDefault();
      $(this).css("background-color", "");
    },
    drop: function(e){
      e.stopPropagation();
      e.preventDefault();

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
        success: function(res){
          if("error" in res){
            console.log(res["error"]);
          }else{
            // Default values for variables
            var html                = "";
            var grandUsdTotal       = 0;
            var grandUsdTransferred = 0;
            var grandUsdRemaining   = 0;

            for(token in res){
              grandUsdTotal       += parseFloat(res[token]["valueUsdTotal"]);
              grandUsdTransferred += (res[token]["valueUsdTransferred"] == "") ? 0 : parseFloat(res[token]["valueUsdTransferred"]);
              grandUsdRemaining   += parseFloat(res[token]["valueUsdRemaining"]);
              html                += `
              <tr>
                <td>${token}</td>
                <td>${res[token]["total"]}</td>
                <td>${res[token]["transferred"]}</td>
                <td>${res[token]["remaining"]}</td>
                <td class="val-total"       style="display: none;">${res[token]["valueUsdTotal"]}</td>
                <td class="val-transferred" style="display: none;">${res[token]["valueUsdTransferred"]}</td>
                <td class="val-remaining"   style="display: block;">${res[token]["valueUsdRemaining"]}</td>
              </tr>
              `;
            }

            grandUsdTotal       = grandUsdTotal.toFixed(2);
            grandUsdTransferred = grandUsdTransferred.toFixed(2);
            grandUsdRemaining   = grandUsdRemaining.toFixed(2);

            $(".fsa-stats tbody").html(html);
            $(".total").html(grandUsdTotal);
            $(".transferred").html(grandUsdTransferred);
            $(".remaining").html(grandUsdRemaining);
          }
        }
      });
    }
  });
});

function ShowTotal(){
  $(".val-total").css("display", "block");
  $(".val-transferred").css("display", "none");
  $(".val-remaining").css("display", "none");
  $($(".fsa-stats table thead tr th:last-child")[0]).text("Value (Total)");
}

function ShowTransferred(){
  $(".val-total").css("display", "none");
  $(".val-transferred").css("display", "block");
  $(".val-remaining").css("display", "none");
  $($(".fsa-stats table thead tr th:last-child")[0]).text("Value (Transferred)");
}

function ShowRemaining(){
  $(".val-total").css("display", "none");
  $(".val-transferred").css("display", "none");
  $(".val-remaining").css("display", "block");
  $($(".fsa-stats table thead tr th:last-child")[0]).text("Value (Remaining)");
}
