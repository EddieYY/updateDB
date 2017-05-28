<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <script type="text/javascript" src="/static/js/jquery.min.js"></script>
    <script type = "text/javascript" src="/static/js/bootstrap.min.js" ></script>
    <script type="text/javascript" src="/static/js/bootstrap-filestyle.min.js"> </script>
<link href="/static/css/style.css" rel="stylesheet">
<link href="/static/css/style-responsive.css" rel="stylesheet">
<link rel="shortcut icon" href="/static/img/upload.ico" type="image/png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
.inputstl { 
    padding: 9px; 
    border: solid 1px #173955; 
    outline: 0; 
    background: -webkit-gradient(linear, left top, left 25, from(#FFFFFF), color-stop(4%, #AACCE8), to(#FFFFFF)); 
    background: -moz-linear-gradient(top, #FFFFFF, #AACCE8 1px, #FFFFFF 25px); 
    box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -moz-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 
    -webkit-box-shadow: rgba(0,0,0, 0.1) 0px 0px 8px; 

    } 

form { 
margin: 0 auto ; 
padding-left: 200px;
    padding-right: 0px;
    width: 1000px;
}
  
body {
    background: #ffcccc;

}


 
</style>

</head>

<body>
</br>
<div class="container">
<h2>
 <img style="display:block; margin:auto;" alt="" src="/static/img/upload_data.png">
 </h2>
</br>
</br>
</br>
    <form class="form-horizontal" role="form" action="/" method="post" enctype="multipart/form-data">
      <div class="form-group">
        <label for="name1" class="col-sm-2 control-label"><font color="white" >上傳檔案者:</font></label>
        <div class="col-sm-4">
          <input type="email" class="form-control inputstl" id="name1" placeholder="請輸入姓名">
        </div>
      </div>

      <div class="form-group">
        <label for="selfile" class="col-sm-2 control-label"><font color="white">選擇上傳的檔案:</font></label>
        <div class="col-sm-5">
          <input type="file" class="inputstl" id="selfile" name="selfile">
        </div>
      </div>

     <!-- <div class="form-group">
        <div class="col-sm-5">
        <font color="white">目前時間:</font>

         <font color="white"><span id="time"></span></font>
        </div>
      </div> -->
           
      <div class="form-group">
        <div class="col-sm-offset-2 col-sm-4">
          <button type="submit" class="btn btn-lg btn-block btn-primary" style = "background-color: #990000;">確認上傳</button>
        </div>
      </div>
    </form>
   </div> 
<script>
      $('#selfile').filestyle({
        buttonName : 'btn-info',
                buttonText : ' Upload your File',
                iconName : 'glyphicon glyphicon-upload',
      });
function formatDate(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var ampm = hours >= 12 ? 'pm' : 'am';
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? '0'+minutes : minutes;
  var strTime = hours + ':' + minutes + ' ' + ampm;
  return date.getMonth()+1 + "/" + date.getDate() + "/" + date.getFullYear() + " " + strTime;
}

var d = new Date();
var today = formatDate(d);
document.getElementById('time').innerHTML=today;
</script>   
</body>
</html>

