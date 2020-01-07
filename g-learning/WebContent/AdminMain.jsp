<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <%@page import="learning.*"%>
 <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理者メニュー</title>
<script type="text/javascript" src="./jquery-3.3.1.js"></script>
<script src="./iscroll.js"></script>
<script  src="./jquery.focused.min.js"></script>
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
 <class="drawer drawer--right">
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
<body>


<div id="classselect">

</div>
<div id="student">

</div>
	<script>

		var socket = io.connect("http://10.16.152.10:8081/subject");
		socket.on("connected", function(name) {
		});
		socket.on("disconnect", function() {
		});
		socket.on("student", function(rows) {
			student(rows);
		});
		socket.on("classselect", function(rows) {
			classselect(rows);
		});
		$(document).ready(function() {
			$('.drawer').drawer();
		});
		//$('select').change(function() {
		//	  if ($(this).val() != '') {
		//	    window.location.href = $(this).val();
		//	  }
		//});function addSql3(rows){
		function classselect(rows) {
			$("#classselect").html("");
			//console.log(rows.length);
			//var table = '<span id="span3"></span><table border="1">'+'<tr><th>科目ID</th><th>科目名</th><th></th></tr>';
			var test = '<select id="class" name="pulldown1" class="validate[required]">'
					+ '<option value="0">クラスを選んでください</option>';
			for (var i = 0; i < rows.length; i++) {
				test += '<option id="1" value='+rows[i].class_id+'>'
						+ rows[i].class_name + '</option>';
			}
			$("#classselect").append(test);
			//table += '</table>';
			//	$("#classselect").append(table);
			//canvas.renderAll();
		};
		socket.emit("classselect");
		function student(rows) {
			$("#student").html("");
			var table = '<span id="span2"></span><table border="1">'
					+ '<tr><th>生徒ID</th><th>生徒名</th></tr>';
			//console.log(table);
			for (var i = 0; i < rows.length; i++) {
				// test2=rows[i].subject_id;
				table += '<tr><td>' + rows[i].student_id + '</td>' + '<td>'
						+ rows[i].student_name + '</td>';
				// 	$("#sql3").append('科目ID ' + rows[i].subject_id );
				//var test=document.rows[i].subject_id;
				//	$("#sql3").append('科目名 ' + rows[i].subject_name + '<br>');
				//console.log(rows.length);
			}
			table += '</table>';
			$("#student").append(table);

			$('select').change(function() {
				var val = $(this).val();
				//console.log(val);
				console.log(val);
				socket.emit("student", val);
			});
		//	canvas.renderAll();
		};

		socket.emit("student");
	</script>


</body>
</html>