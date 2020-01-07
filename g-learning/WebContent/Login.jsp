<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="learning.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ログイン</title>
<script src="./jquery-3.3.1.js"></script>
<script src="./jquery.validationEngine.js"></script>
<script src="./jquery.validationEngine-ja.js"></script>
<link rel="stylesheet" href="./validationEngine.jquery.css">
<link rel="stylesheet" type="text/css" href="button_gradient.css" />
<style type="text/css">
body {
  background-image: url("haikei.jpg");
  background-size: cover;
}
.box {
  /*親要素*/
  position: relative;
  background: orange;
  height: 200px;
}


.btn-square {
  display: inline-block;
  padding: 0.5em 1em;
  text-decoration: none;
  background: #668ad8;/*ボタン色*/
  color: #FFF;
  border-bottom: solid 4px #627295;
  border-radius: 3px;
}
.btn-square:active {
  /*ボタンを押したとき*/
  -webkit-transform: translateY(4px);
  transform: translateY(2px);/*下に動く*/
  border-bottom: none;/*線を消す*/
}
input {
	margin: 6px 0;
	}
	h4 {
  text-align:center;
}
div { text-align : center ; }
</style>
</head>
<body>

<script type="text/javascript">
 $(document).ready(function(){
        $("#form").validationEngine();
      });



    </script>

<div >



<h4 >学習支援システム</h4>

	<form id="form" method="get" action="LoginServlet">
    <input type="text" placeholder="ID" name="id" class="validate[required]"/>
    <br>
    <input type="password" placeholder="PASSWORD" name="pass" class="validate[required]"/>
    <br>
  <% //<div><a href="LoginServlet"  class="btn-square">ログイン</a></div>%>
  <div><input type="submit" class="gradientButton" value="ログイン"></div>
    </form>

  <br>
  <br>
  <a href= "Register.jsp" >アカウントをお持ちでない場合</a>
</div>

</body>
</html>