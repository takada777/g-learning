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


<div id="sql">

</div>
<div id="classselect">

</div>
<script>

var socket = io.connect("http://10.16.152.10:8081/subject");
socket.on("connected", function(name){});
//socket.on("sql2", function(rows){addSql2(rows);});
socket.on("student", function(){});
socket.on("disconnect", function(){});
socket.on("classselect", function(rows){classselect(rows);});
//start(roomid);
//c/onsole.log(roomid);

	function classselect(rows){
	$("#classselect").html("");
	//console.log(rows.length);
	//var table = '<span id="span3"></span><table border="1">'+'<tr><th>科目ID</th><th>科目名</th><th></th></tr>';
		var test ='<select id="select" name="select" class="validate[required]">'+'<option value="0">クラスを選んでください</option>';
		for(var i = 0;i < rows.length;i++) {
		test+=	 '<option id="select" name="select" value='+rows[i].class_id+'>'+rows[i].class_name+'</option>';
		}
$("#classselect").append(test);
	//table += '</table>';
//	$("#classselect").append(table);
	//canvas.renderAll();
//console.log(rows.length);
$('select').change(function() {
	   val = $(this).val();

		   console.log('This is ' + val);



});
socket.emit("student");
};



socket.emit("classselect");





</script>
</body>
</html>