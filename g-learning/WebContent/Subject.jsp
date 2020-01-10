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

<div id="text-button"><p id="text">クリックfsd</p></div>

  <input type="text" placeholder="科目ID" name="sublectid" id="subject_id" class="validate[required,custom[number]]"/>
  <br>

    <input type="text" placeholder="科目名" name="subjectname" id="subject_name" class="validate[required]"/>
    <br>
    <input type="button" value="科目登録" onclick="addsubject()">

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
<div id="addsubject">

</div>
<div id="deletesubject">

</div>






	<script>
	$(document).ready(function(){
        $("#form").validationEngine();
      });
$(document).ready(function() {
	 $('.drawer').drawer();
});


var socket = io.connect("http://10.16.152.10:8081/subject");
socket.on("connected", function(name){});
socket.on("sql3", function(rows){addSql3(rows);});
socket.on("addsubject", function(subject_id,subject_name){addsubject(subject_id,subject_name);});



socket.on("disconnect", function(){});
socket.on("deletesubject", function(subject_id2){deletesubject(subject_id2);});
function start(room){
	socket.emit("connected", room);
}

function sql(room){
	socket.emit("sql3",room);
}
function deletesubject(subject_id){
	socket.emit("deletesubject",subject_id);

}
function addSql3(rows){
	$("#sql3").html("");
	var table = '<span id="span2"></span><table border="1">'+'<tr><th>科目ID</th><th>科目名</th><th><input type="button" onclick="Click_Sub1(true)" value="全選択"><input type="button" onclick="Click_Sub1(false)" value="全解除"><div><input type="button"  id="button" value="削除" onclick="deletesubject()" ></div></th></tr>';
	//console.log(table);
	for( i = 0;i < rows.length;i++) {
		 test=rows[i].subject_id;
		table += '<tr><td>'+rows[i].subject_id+'</td>'+'<td>'+rows[i].subject_name+'</td><td>'+
				'<input type="checkbox" id=subject_id2 name="riyu" value='+test+'></td>';
		// 	$("#sql3").append('科目ID ' + rows[i].subject_id );
		//var test=document.rows[i].subject_id;
		 //	$("#sql3").append('科目名 ' + rows[i].subject_name + '<br>');
//console.log(test);

	}
	table += '</table>';
	$("#sql3").append(table);
	//canvas.renderAll();
};
socket.emit("sql3");
function addsubject(){
	  // value値を取得する

	  var subject_id = document.getElementById('subject_id').value;
	  var subject_name=document.getElementById('subject_name').value;
	// console.log(subject_id);

	 // alert("value値は「" + subject_id + "」です");
	 if(subject_id==""&&subject_name==""){
		 alert('科目IDと科目名を入力してください');
	 }else if(subject_id==""&&subject_name!=""){
		 alert('科目IDを半角数字で入力してください');


	 }else if(subject_id!=""&&subject_name==""){
		 alert('科目名を入力してください');

	 }else	if(Number.isInteger (parseInt(subject_id))){

		 socket.emit("addsubject",subject_id,subject_name);
		 location.reload();
	}else {
		 alert('科目IDは半角数字で入力してください');
	}

	};
function deletesubject(){

	// subject_id2 = document.getElementById('subject_id2').value;
	 array=[];
	 const subject_id3 = document.getElementsByName("riyu");
	 for (var i = 0; i < subject_id3.length; i++){
		 if(subject_id3[i].checked){
			array.push(subject_id3[i].value);



			for(var j=0;j<array.length;j++){






		 subject_id2=parseInt(array[j]);
			 console.log(subject_id3.length);
			 socket.emit("deletesubject",subject_id2);
			}
		 }
		//location.reload();
	 }
	// document.getElementById("span2").textContent = idarray;
	//socket.emit("deletesubject",subject_id2);
	//console.log(subject_id2);
//console.log(subject_id2);

}
function Click_Sub1(check) {
    for(x = 0; x < document.all.riyu.length; x++){
        document.all.riyu[x].checked = check;
    }
}
</script>

</body>
</html>