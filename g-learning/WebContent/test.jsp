<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

      <%@page import="learning.*"%>
 <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
  <head>
  <style type="text/css">
  body {
  margin: 0;
  font-family: "Hiragino Kaku Gothic ProN";
}

a {
  text-decoration: none;
}

.container {
  width: 1170px;
  padding: 0 15px;
  margin: 0 auto;
}

.top-wrapper {
  padding: 180px 0 100px 0;
  background-image: url("1.jpg");
  background-size: cover;
  color: white;
  text-align: center;
}

.top-wrapper h1 {
  opacity: 0.7;
  font-size: 45px;
  letter-spacing: 5px;
}

.top-wrapper p {
  opacity: 0.7;
}

.btn {
  padding: 8px 24px;
  color: white;
  display: inline-block;
  opacity: 0.8;
  border-radius: 4px;
}

.btn:hover {
  opacity: 1;
}

.signup {
  background-color: #239b76;
}

.facebook {
  background-color: #3b5998;
  margin-right: 10px;
}

.twitter {
  background-color: #55acee;
}

.btn-wrapper {
  margin: 20px 0;
}

.btn-wrapper p {
  margin: 10px 0;
}

/* faクラスのmargin-rightを5pxに指定してください */
.fa{
  margin-right:5px;
}

  </style>
    <meta charset="utf-8">
    <title>チトる</title>
    <link rel="stylesheet" href="stylesheet.css">
    <!-- ここでFont Awesomeを読み込みましょう -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
  </head>
  <body>
    <header>
    </header>
    <div class="top-wrapper">
      <div class="container">

        <h1>G-Learning</h1>
        <p>G-Learningはオンライン学習サービスです。</p>
        <p>初心者にもやさしいせかいで、学んでいきましょう。</p>
        <div class="btn-wrapper">
          <a href="#" class="btn signup">ログインはこちら</a><br>
          <br>
          <a href="#" class="btn signup">新規登録はこちら</a>


        </div>
      </div>
    </div>
    <div class="lesson-wrapper">
    </div>
    <div class="message-wrapper">
    </div>
    <footer>
    </footer>
  </body>
</html>