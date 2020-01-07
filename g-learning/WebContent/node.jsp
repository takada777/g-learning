
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科目</title>
<script type="text/javascript" src="./jquery-3.3.1.js"></script>
<script src="./jquery.validationEngine.js"></script>
<script src="./jquery.validationEngine-ja.js"></script>
<link rel="stylesheet" href="./validationEngine.jquery.css">
<script  src="./jquery.focused.min.js"></script>
<script src="./iscroll.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script src="./drawer.js"></script>
</head>
<input type="hidden" id="roomid" value="room1">
<select name="select">
 <option value=0>選択してください</option>
  <option value=1>S1A1</option>
  <option value=2>S2A1</option>



</select>
<div id="sql2">

</div>

<script type="text/javascript">
var roomid = document.getElementById("roomid").value;
var test = 0;
//10.16.152.6
//192.168.2.131
var socket = io.connect("http://10.16.152.10:8081");
socket.on("connected", function(name){});
socket.on("sql2", function(rows){addSql2(rows);});
socket.on("sql", function(rows){addSql(rows);});
socket.on("disconnect", function(){});
start(roomid);
console.log(roomid);
function start(room){
	socket.emit("connected", room);
}
function sql(room){
	socket.emit("sql",room);
}
function sql2(room){
	socket.emit("sql2",room);
}
function addSql(rows){
	$("#sql").html("");
	for(var i = 0;i < rows.length;i++) {
		 	$("#sql").append('id: ' + rows[i].subject_id + '<br>');
		 	$("#sql").append('pass: ' + rows[i].subject_name + '<br>');
			console.log(rows.length);
				}
	//canvas.renderAll();
};
function addSql2(rows){
	$("#sql2").html("");
	for(var i = 0;i < rows.length;i++) {
		 	$("#sql2").append(': ' + rows[i].student_id + '<br>');
		 	$("#sql2").append(': ' + rows[i].student_name + '<br>');
			console.log(rows.length);
				}
	//canvas.renderAll();
};
$(function() {
	  //セレクトボックスが切り替わったら発動
	  $('select').change(function() {
		  var val = $(this).val();
		  console.log(val);
		  socket.emit("sql2", roomid,val);
	  });
	});
socket.emit("sql2");
</script>
</body>
</html>