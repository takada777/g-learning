<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./jquery-3.3.1.js"></script>
<link rel="stylesheet" href="./drawer.css">
<style type="text/css">
<!--
body {
  background-image: url("haikei.jpg");
  background-size: cover;
}
ul.jquery-menu {
    background-color: silver;
    list-style-position: inside;
    width: 500px;
    border: 1px darkgray solid;
    border-bottom: none;
}
ul.jquery-menu li {
    padding-bottom: 5px;
    border-bottom: 1px darkgray solid;
    list-style-type: none;
}
ul.jquery-menu li div.jquery-menu-title-box {
    padding: 5px 10px 0 10px;
    cursor: pointer;
}
ul.jquery-menu li div.menu-title {
    float: left;
    font-weight: bold;
}
ul.jquery-menu li div.menu-triangle {
    float: right;
    text-align: right;
    color: darkgray;
    border-left: 1px darkgray solid;
}
ul.jquery-menu-sub {
    display: none;
    background-color: lightgrey;
    list-style-position: inside;
    margin: 5px;
}
ul.jquery-menu-sub li {
    padding: 5px 10px 5px 10px;
    border: none;
    list-style-type: square;
}
-->
</style>
<meta charset="UTF-8">
<title>Insert title here-</title>
<script type="text/javascript" src="./jquery-3.3.1.js"></script>

</head>
<body>




<script type="text/javascript">

<!--
$( function() {
    $( '#jquery-menu-1-title' ) . click( function() {
        $( "#jquery-menu-1-sub" ) . slideToggle( 'fast' );
    } );
    $( '#jquery-menu-2-title' ) . click( function() {
        $( "#jquery-menu-2-sub" ) . slideToggle( 'fast' );
    } );
    $( '#jquery-menu-3-title' ) . click( function() {
        $( "#jquery-menu-3-sub" ) . slideToggle( 'fast' );
    } );
} );
// -->
</script>

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

<ul class="jquery-menu">
    <li id="jquery-menu-1">
        <div id="jquery-menu-1-title" class="jquery-menu-title-box">
            <div class="menu-title">オブジェクト指向プログラミング</div>
            <div class="menu-triangle">　▼</div>
            <div style="clear: both;"></div>
        </div>
        <ul class="jquery-menu-sub" id="jquery-menu-1-sub">
            <li><a href="#">基本問題</a></li>
            <li><a href="#">基本問題2</a></li>
            <li><a href="#">応用問題</a></li>

        </ul>
    </li>
    <li id="jquery-menu-2">
        <div id="jquery-menu-2-title" class="jquery-menu-title-box">
            <div class="menu-title">androidⅠ</div>
            <div class="menu-triangle">　▼</div>
            <div style="clear: both;"></div>
        </div>
        <ul class="jquery-menu-sub" id="jquery-menu-2-sub">
            <li><a href="#">基本問題</a></li>
            <li><a href="#">基本問題2</a></li>
            <li><a href="#">基本問題3</a></li>
            <li><a href="#">応用問題</a></li>


        </ul>
    </li>
    <li id="jquery-menu-3">
        <div id="jquery-menu-3-title" class="jquery-menu-title-box">
            <div class="menu-title">SEA/J</div>
            <div class="menu-triangle">　▼</div>
            <div style="clear: both;"></div>
        </div>
        <ul class="jquery-menu-sub" id="jquery-menu-3-sub">
            <li><a href="#">基本問題</a></li>
            <li><a href="#">基本問題2</a></li>


        </ul>
    </li>
</ul>

</body>
</html>