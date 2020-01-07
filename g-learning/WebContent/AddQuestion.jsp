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


<div id="sql3">

</div>
<input type="text" placeholder="問題名" name="question_name" id="question_name" class="validate[required,custom[number]]"/><br><br>
<input type="text" placeholder="問題文" name="sublectid" id="question_text" class="validate[required,custom[number]]"/><br><br>
<input type="text" placeholder="解答" name="sublectid" id="question_answer" class="validate[required,custom[number]]"/><br><br><br>
<input type="text" placeholder="問題文" name="sublectid" id="question_text" class="validate[required,custom[number]]"/><br><br>
<input type="text" placeholder="解答" name="sublectid" id="question_answer" class="validate[required,custom[number]]"/><br><br><br>
<input type="text" placeholder="問題文" name="sublectid" id="question_text" class="validate[required,custom[number]]"/><br><br>
<input type="text" placeholder="解答" name="sublectid" id="question_answer" class="validate[required,custom[number]]"/><br><br><br>
<input type="text" placeholder="問題文" name="sublectid" id="question_text" class="validate[required,custom[number]]"/><br><br>
<input type="text" placeholder="解答" name="sublectid" id="question_answer" class="validate[required,custom[number]]"/><br><br><br><br><br><br><br>
 <input type="button" value="追加" onclick="addquestion()">
<div id="addsubject">

</div>
<script>

var socket = io.connect("http://10.16.152.10:8081/subject");
socket.on("connected", function(name){});
socket.on("sql3", function(rows){addSql3(rows);});
socket.on("disconnect", function(){});
socket.on("addquestion", function(sublect_id,question_name,question_text,question_answer){addquestion(sublect_id,question_name,question_text,question_answer);});

//start(roomid);
//c/onsole.log(roomid);

	function addSql3(rows){
	$("#sql3").html("");
	//console.log(rows.length);
	//var table = '<span id="span3"></span><table border="1">'+'<tr><th>科目ID</th><th>科目名</th><th></th></tr>';
		var test ='<select id="select" name="select" class="validate[required]">'+'<option value="0">クラスを選んでください</option>';
		for(var i = 0;i < rows.length;i++) {
		test+=	 '<option  value='+rows[i].subject_id+'>'+rows[i].subject_name+'</option>';
		}
$("#sql3").append(test);
	//table += '</table>';
//	$("#classselect").append(table);
	//canvas.renderAll();
//console.log(rows.length);

};



socket.emit("sql3");
function addquestion(){
	  // value値を取得する
	  var subject_id=document.getElementById('select').value;
	  var question_name = document.getElementById('question_name').value;
	  var question_text=document.getElementById('question_text').value;
	  var question_answer=document.getElementById('question_answer').value;
	 console.log(subject_id);
	 console.log(question_name);
	 console.log(question_text);
	 console.log(question_answer);


	 // alert("value値は「" + subject_id + "」です");


		 socket.emit("addquestion",subject_id,question_name,question_text,question_answer);
		 location.reload();


	};




</script>
</body>
</html>