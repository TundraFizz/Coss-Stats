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
            console.log(res);

            $(".reeee").html("");
            var html                = "";
            var grandUsdTotal       = 0;
            var grandUsdTransferred = 0;
            var grandUsdRemaining   = 0;

            for(token in res){
              grandUsdTotal       += res[token]["valueUsdTotal"];
              grandUsdTransferred += res[token]["valueUsdTransferred"];
              grandUsdRemaining   += res[token]["valueUsdRemaining"];
              html                += `
              <tr>
                <td>${token}</td>
                <td>${res[token]["total"]}</td>
                <td>${res[token]["transferred"]}</td>
                <td>${res[token]["remaining"]}</td>
                <td class="val-total">      ${res[token]["valueUsdTotal"]}</td>
                <td class="val-transferred">${res[token]["valueUsdTransferred"]}</td>
                <td class="val-remaining">  ${res[token]["valueUsdRemaining"]}</td>
              </tr>
              `;
            }

            $(".reeee").html(html);
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
}

function ShowTransferred(){
  $(".val-total").css("display", "none");
  $(".val-transferred").css("display", "block");
  $(".val-remaining").css("display", "none");
}

function ShowRemaining(){
  $(".val-total").css("display", "none");
  $(".val-transferred").css("display", "none");
  $(".val-remaining").css("display", "block");
}
