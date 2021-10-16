<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/semiproject/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="/semiproject/resources/css/bootstrap.css">
</head>
<body>

<div class="container" style="margin-top:100px; margin-left:650px;">
<div class="center-block border border-dark rounded" style="display:inline-block; margin:auto;" >

<form action="/semiproject/loginaccess" method="post" style="margin:20px; width:400px;">
<h3>OKKY 로그인</h3>
<hr>
  <div class="mb-3">
    <label class="form-label">아이디</label>
    <input type="text" class="form-control" name="iuser_id">
  </div >
  <div class="mb-3">
    <label class="form-label">비밀번호</label>
    <input type="password" class="form-control" name="iuser_pw">
  </div>

<!-- 	아이디 : <input type="text" name="iuser_id"><br>
	비밀번호 : <input type="password" name="iuser_pw"><br> -->
	<input type="submit" id="submit" class="btn btn-primary" value="로그인"><br>

</form>
</div>
</div>

<script>
var i = function(){
	if("${result}" == "로그인 실패하였습니다."){
		alert("${result}");
	}
}();
</script>

</body>
</html>