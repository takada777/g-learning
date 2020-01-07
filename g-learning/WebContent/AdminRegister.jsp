<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理者登録</title>
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
ul li {
list-style: none;
text-align: left;
}

}
label {
   margin: 16px auto;
	text-align: center;
	display: block;
	border: 1px solid #000;
	float: left;
}
ul {
   float:left;
   position:relative;
   left:50%;
}

body {
  background-image: url("haikei.jpg");
  background-size: cover;
}
.btn-register {
  display: inline-block;
  padding: 0.5em 1em;
  text-decoration: none;
  background: #668ad8;/*ボタン色*/
  color: #FFF;
  border-bottom: solid 4px #627295;
  border-radius: 3px;
}
.btn-register:active {
  /*ボタンを押したとき*/
  -webkit-transform: translateY(4px);
  transform: translateY(4px);/*下に動く*/
  border-bottom: none;/*線を消す*/
}

</style>


  </head>

 <body class="drawer drawer--right">
	<header role="banner">
		<button type="button" class="drawer-toggle drawer-hamburger">
			<span class="sr-only">toggle navigation</span>
			<span class="drawer-hamburger-icon"></span>
		</button>
		<nav class="drawer-nav" role="navigation">
			<ul class="drawer-menu">
				<li><a class="drawer-brand" href="#">メニュー</a></li>
				<li><a class="drawer-menu-item" href="AdminMain.jsp">クラス</a></li>
				<li><a class="drawer-menu-item" href="Subject.jsp">科目</a></li>
				<li><a class="drawer-menu-item" href="AddQuestion.jsp">問題追加</a></li>
				<li><a class="drawer-menu-item" href="GiveHomework.jsp">宿題を出す</a></li>
				<li><a class="drawer-menu-item" href="#">宿題提出状況</a></li>
				<li><a class="drawer-menu-item" href="AdminRegister.jsp">管理者登録</a></li>
				<li><a class="drawer-menu-item" href="#">アカウント</a></li>
				<li><a class="drawer-menu-item" href="Login.jsp">ログアウト</a></li>
			</ul>
		</nav>
	</header>
	<main role="main">
		<!-- コンテンツ -->
	</main>


<h5 >管理者登録</h5>




<div id="form">
<table>

<tr>
<th>ユーザID
</th>
<th>
    <input type="text" placeholder="ID" id="admin_id" name="id" class="validate[required]"/>
</th>
</tr>
<tr>
<th>氏名
</th>
<th>
	<input type="text" placeholder="情報太郎" id="admin_name" name="name" class="validate[required]"/>
</th>
</tr>
<tr>
<th>パスワード
</th>
<th>
    <input type="password" placeholder="PASSWORD" id="admin_pass" name="pass" class="validate[required]"/>
</th>
</tr>
<tr>
<th>パスワード確認
</th>
<th>
    <input type="password" placeholder="PASSWORD" id="admin_pass2" name="pass2" class="validate[required]"/>
</th>
</tr>

</table>
<div><input type="submit" class="gradientButton" value="登録" onclick="addsubject()"></div>
</div>
<div id="adminregister">

</div>


<script type="text/javascript">


$(document).ready(function() {
	 $('.drawer').drawer();
});
 $(document).ready(function(){
        $("#form").validationEngine();
      });
 var socket = io.connect("http://10.16.152.10:8081/subject");
 socket.on("connected", function(name){});
 socket.on("adminregister", function(admin_id, admin_name,admin_pass){adminregister(admin_id, admin_name,admin_pass);});
 function start(room){
		socket.emit("connected", room);
	}
 function addsubject(){
	  // value値を取得する
	  var admin_id = document.getElementById('admin_id').value;
	  var admin_name=document.getElementById('admin_name').value;
	  var admin_pass=document.getElementById('admin_pass').value;
	  var admin_pass2=document.getElementById('admin_pass2').value;
		if(admin_id==""){
			 window.alert('IDを入力してください');
		}else if(admin_name==""){
			 window.alert('氏名を入力してください');


		}else if(admin_pass==""){
			window.alert('パスワードを入力してください');

		}else if(admin_pass!=admin_pass2){
			window.alert('パスワードが一致しません');
		}else{
	 if(window.confirm('この内容で登録しますか？\n管理者ID:'+admin_id+'\n氏名:'+admin_name)){




	//  var admin_id = document.getElementById('admin_id').value;
	 // var admin_name=document.getElementById('admin_name').value;
	 // var admin_pass=document.getElementById('admin_pass').value;

	  socket.emit("adminregister",admin_id, admin_name,admin_pass);
	  location.reload();
	  window.alert('登録されました');
	 }else{

			window.alert('キャンセルされました'); // 警告ダイアログを表示

		}
		}
		// location.reload();
	// console.log(subject_id);
 };


 </script>


  </body>
</html>