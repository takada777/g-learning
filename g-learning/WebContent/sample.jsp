<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css"></style>
<title>Insert title here</title>
</head>

<body>
<select name="select">
  <option value=1>1</option>
  <option value=2>2</option>

</select>
<script type="text/javascript">

var socket = io.connect("http://10.16.152.10:8081/subject");
socket.on("connected", function(name){});
socket.on("sql", function(rows){addSql(rows);});
</script>
</body>
</html>