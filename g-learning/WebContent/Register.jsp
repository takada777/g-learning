<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
HttpSession httpSession=request.getSession();
String error=(String)session.getAttribute("error");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="./jquery-3.3.1.js"></script>
<script src="./jquery.validationEngine.js"></script>
<script src="./jquery.validationEngine-ja.js"></script>
<link rel="stylesheet" href="./validationEngine.jquery.css">
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

  <body>
<script type="text/javascript">
 $(document).ready(function(){
        $("#form").validationEngine();
      });



    </script>
<h5 >新規登録</h5>

<%
if(error!=null){
%>
<font color="red"><%=error%></font>
<%
}
%>

<form id="form" method="get" action="RegisterServlet">
<table>
<tr>
<th>

 <% //<li class="class">%>
 <label for="class">クラス</label>
 </th>
 <th>
  <select name="class" id="class" class="validate[required]">
  <option value="">選択してください</option>
  <option value="S1A1">S1A1</option>
  <option value="S2A1">S2A1</option>
  <option value="S3A1">S3A1</option>
  <option value="S1G1">S1G1</option>
  <option value="R1A1">R1A1</option>
</select>

</th>
</tr>
<tr>
<th>ユーザID
</th>
<th>
    <input type="text" placeholder="ID" name="id" class="validate[required]"/>
</th>
</tr>
<tr>
<th>氏名
</th>
<th>
	<input type="text" placeholder="情報太郎" name="name" class="validate[required]"/>
</th>
</tr>
<tr>
<th>パスワード
</th>
<th>
    <input type="password" placeholder="PASSWORD" name="pass" class="validate[required]"/>
</th>
</tr>
<tr>
<th>パスワード確認
</th>
<th>
    <input type="password" placeholder="PASSWORD" name="pass2" class="validate[required]"/>
</th>
</tr>
<tr>
<th>メールアドレス
</th>
<th>
	<input type="text" placeholder="joho@gmail.com" name="adress" class="validate[required]"/>
</th>
</tr>
</table>
<div><input type="submit" class="gradientButton" value="登録"></div>
  </form>

  </body>
</html>