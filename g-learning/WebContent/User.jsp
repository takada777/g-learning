<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="./jquery-3.3.1.js"></script>
<link rel="stylesheet" href="./drawer.css">
<style type="text/css">
body {
  background-image: url("haikei.jpg");
  background-size: cover;
}
a.cp_btn {
	position: relative;
	display: block;
	width: 160px;
	padding: 0.8em;
	text-align: center;
	border: 3px solid #9C27B0;
	text-decoration: none;
	outline: none;
	transition: all .4s;
}
a.cp_btn::before,
a.cp_btn::after {
	position: absolute;
	top: -3px;
	right: -3px;
	bottom: -3px;
	left: -3px;
	z-index: 2;
	content: '';
	transition: all .4s;
}
a.cp_btn::before {
	border-top: 3px solid #FF5722;
	border-bottom: 3px solid #FF5722;
	transform: scale(0, 1);
}
a.cp_btn::after {
	border-right: 3px solid #FF5722;
	border-left: 3px solid #FF5722;
	transform: scale(1, 0);
}
a.cp_btn:hover {
	color: #FF5722;
}
a.cp_btn:hover::after,
a.cp_btn:hover::before {
	transform: scale(1);
}
body, h1, p {
margin: 0;
padding: 0;
}

header {
background-color: #CEF6D8;
}
</style>
<script src="./iscroll.js"></script>

<script src="./drawer.js"></script>

</head>
<body>
<header>
<h1>学習支援システム</h1>
<h1>dddd</h1>

</header>
</body>
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
	<script>
$(document).ready(function() {
	 $('.drawer').drawer();
});
</script>

</body>
<body>
<a href="#" class="cp_btn">ユーザー情報</a>
</body>
</html>l>