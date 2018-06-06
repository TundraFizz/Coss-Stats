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
  $(".dropzone").hide();
}

$(document).ready(function(){
  if(localStorage.getItem("fsa") !== null){
    var fsa = JSON.parse(localStorage.getItem("fsa"));
    LoadTable(fsa);
  }else{
    $(".fsa-stats").hide();
    $(".dropzone").show();
  }

  var filename   = "";
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
        success: function(fsa){
          if("error" in fsa){
            console.log(fsa["error"]);
          }else{
            // Save the result into localStorag
            localStorage.setItem("fsa", JSON.stringify(fsa));

            LoadTable(fsa);
          }
        }
      });
    }
  });

  $(".delete").click(DeleteFsaData);
});

function DeleteFsaData(){
  localStorage.removeItem("fsa");
  $(".fsa-stats").hide();
  $(".dropzone").show();
  $(".fsa-value").html("$0.00");
  $(".net-value").html("$0.00");
}
