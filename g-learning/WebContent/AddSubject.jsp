<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科目登録</title>
<script type="text/javascript" src="./jquery-3.3.1.js"></script>
<script  src="./jquery.focused.min.js"></script>
<script src="./iscroll.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/socket.io/2.0.3/socket.io.js"></script>
<script src="./drawer.js"></script>
<link rel="stylesheet" href="./drawer.css">
<style type="text/css">
table{
  width: 100%;
  border-collapse:separate;
  border-spacing: 0;
}

table th:first-child{
  border-radius: 5px 0 0 0;
}

table th:last-child{
  border-radius: 0 5px 0 0;
  border-right: 1px solid #3c6690;
}

table th{
  text-align: center;
  color:white;
  background: linear-gradient(#829ebc,#225588);
  border-left: 1px solid #3c6690;
  border-top: 1px solid #3c6690;
  border-bottom: 1px solid #3c6690;
  box-shadow: 0px 1px 1px rgba(255,255,255,0.3) inset;
  width: 25%;
  padding: 10px 0;
}

table td{
  text-align: center;
  border-left: 1px solid #a8b7c5;
  border-bottom: 1px solid #a8b7c5;
  border-top:none;
  box-shadow: 0px -3px 5px 1px #eee inset;
  width: 25%;
  padding: 10px 0;
}

table td:last-child{
  border-right: 1px solid #a8b7c5;
}

table tr:last-child td:first-child {
  border-radius: 0 0 0 5px;
}

table tr:last-child td:last-child {
  border-radius: 0 0 5px 0;
}
</style>
</head>
<input type="button" value="科目登録">
<body class="drawer drawer--right">

	<header role="banner">
		<button type="button" class="drawer-toggle drawer-hamburger">
			<span class="sr-only">toggle navigation</span>
			<span class="drawer-hamburger-icon"></span>
		</button>
		<nav class="drawer-nav" role="navigation">
			<ul class="drawer-menu">
				<li><a class="drawer-brand" href="#">メニュー</a></li>
				<li><a class="drawer-menu-item" href="Oshirase.jsp">おしらせ</a></li>
				<li><a class="drawer-menu-item" href="Mondaiichiran.jsp">問題一覧</a></li>
				<li><a class="drawer-menu-item" href="Homework.jsp">宿題</a></li>
				<li><a class="drawer-menu-item" href="Groupwork.jsp">グループワーク</a></li>
				<li><a class="drawer-menu-item" href="User.jsp">ユーザ情報</a></li>
				<li><a class="drawer-menu-item" href="Login.jsp">ログアウト</a></li>
			</ul>
		</nav>
	</header>
	<main role="main">
		<!-- コンテンツ -->
	</main>
	<div id="sql3">

</div>
	<script>
$(document).ready(function() {
	 $('.drawer').drawer();
});


var socket = io.connect("http://10.16.152.10:8081");
socket.on("connected", function(name){});
socket.on("sql3", function(rows){addSql3(rows);});

socket.on("disconnect", function(){});
function start(room){
	socket.emit("connected", room);f
}

function sql(room){
	socket.emit("sql3",room);
}
function deletesubject(room){
	socket.emit("deletesubject",room);
}
function addSql3(rows){
	$("#sql3").html("");
	var table = '<table border="1">'+'<tr><th>科目ID</th><th>科目名</th><th><div><input type="button" value="削除" onclick="function(rows){deletesubject(room);});" ></div></th></tr>';
	for(var i = 0;i < rows.length;i++) {
		table += '<tr><td>'+rows[i].subject_id+'</td>'+'<td>'+rows[i].subject_name+'</td><td>'+
				'<input type="checkbox" name="riyu" value=i></td>';
		// 	$("#sql3").append('科目ID ' + rows[i].subject_id );
		 //	$("#sql3").append('科目名 ' + rows[i].subject_name + '<br>');
			console.log("sql3");
	}
	table += '</table>';
	$("#sql3").append(table);
	//canvas.renderAll();
};
socket.emit("sql3");
</script>

</body>
</html>