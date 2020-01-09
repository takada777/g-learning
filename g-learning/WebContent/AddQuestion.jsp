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
<div id="mondai">
<select id="kazu" name="kazu" class="validate[required]">
<option value="0">問題数を選んでください</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
</select>
</div>
<div id="sql3">

</div>

<input type="text" placeholder="問題名" name="question_name" id="question_name" class="validate[required,custom[number]]"/><br><br>
<br>
<div id="aaa">

</div>
<br><br><br><br><br><br><br>
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
var kazu = 0;
y=0;
z=0;
	$('select')
			.change(
					function() {
						var test2;
						//$("#aaa").html("");
						val = $(this).val();

						//console.log(val);
						console.log(val);
						val=Number(val);

						if (val > kazu) {

							//	var test2='<input type="text" placeholder="問題名" name="question_name" id="question_name" class="validate[required,custom[number]]"/><br><br>';
							for (var x = 0; x < val - kazu; x++) {
								while(y<val){
								 y+=1;
								test2 = '<p>'+y+'</p>'+'<input type="text" placeholder="問題文" name="sublectid" class="validate[required,custom[number]]"/><br><br>'
										+ '<input type="text" placeholder="解答" name="sublectid"  class="validate[required,custom[number]]"/><br><br>'
								$("#aaa").append(test2);
								}
								//console.log(val + "val");
							//	console.log(kazu + "kazu");


//
							}
						} else if(val <= kazu){

							//console.log("tink");
							$("#aaa").html("");
							for (var x = 0; x < val; x++) {
								while(z<val){
								z+=1;

								test2 = '<p>'+z+'</p>'+'<input type="text" placeholder="問題文" name="sublectid"  class="validate[required,custom[number]]"/><br><br>'
										+ '<input type="text" placeholder="解答" name="sublectid"  class="validate[required,custom[number]]"/><br><br>'
								$("#aaa").append(test2);
								}
								//console.log("tink");
							//	console.log(val + "val2");
								//console.log(kazu + "kazu2");

							}

						}


						y=0;
						z=0;
						kazu = Number(val);
					});
	function addSql3(rows) {
		$("#sql3").html("");
		//console.log(rows.length);
		//var table = '<span id="span3"></span><table border="1">'+'<tr><th>科目ID</th><th>科目名</th><th></th></tr>';
		var test = '<select id="select" name="select" class="validate[required]">'
				+ '<option value="0">クラスを選んでください</option>';
		for (var i = 0; i < rows.length; i++) {
			test += '<option  value='+rows[i].subject_id+'>'
					+ rows[i].subject_name + '</option>';
		}
		$("#sql3").append(test);
		//table += '</table>';
		//	$("#classselect").append(table);
		//canvas.renderAll();
		//console.log(rows.length);

	};

	socket.emit("sql3");
	function addquestion() {
		// value値を取得する
		var subject_id = document.getElementById('select').value;
		var question_name = document.getElementById('question_name').value;
		var question_text = document.getElementById('question_text').value;
		var question_answer = document.getElementById('question_answer').value;
		console.log(subject_id);
		console.log(question_name);
		console.log(question_text);
		console.log(question_answer);

		// alert("value値は「" + subject_id + "」です");

		socket.emit("addquestion", subject_id, question_name, question_text,
				question_answer);
		location.reload();

	};
</script>
</body>
</html>