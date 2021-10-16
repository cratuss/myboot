<%@page import="edu.spring.semiproject.UserVO"%>
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

<script>

$(document).ready(function(){
	if("${iuser}" == ""){
		$("#boardinsert").attr("style", "display: none");
	}
});

$(document).ready(function(){
	if("${iuser}" != ""){
		$("#movelogin").detach();
		$("select").before("<div class='d-grid gap-2 d-md-flex justify-content-md-end h3 d-inline-block mt-3'>${iuser.iuser_name}님 "
		+ "&nbsp;<button type='button' class='btn btn-outline-primary' id='movelogout'>로그아웃</button>"
		+ "</div><hr>");

	}
	
});

$(document).ready(function(){
	$("#movelogin").on("click", function(){
		$(location).attr("href", "http://localhost:9090/semiproject/login");
	});
	
});

$(document).ready(function(){
	$("#movelogout").on("click", function(){
		$(location).attr("href", "http://localhost:9090/semiproject/logout");
	});
});




$(document).ready(function(){
	$("#category").on("change", function(){//ajax로그인
			$(location).attr("href", "http://localhost:9090/semiproject/boardtype?category=" + $("#category").val());
	});
});

$(document).ready(function(){
	if("${category}" == "게임"){
		$("#category").val("1").prop("selected", true);
	}else if("${category}" == "여행"){
		$("#category").val("2").prop("selected", true);
	}else if("${category}" == "음악"){
		$("#category").val("3").prop("selected", true);
	}
});


$(document).ready(function(){
	$("#movelogout").on("click", function(){
		$(location).attr("href", "http://localhost:9090/semiproject/logout");
	});
});

$(document).ready(function(){
	$("#boardinsert").on("click", function(){
		$(location).attr("href", "http://localhost:9090/semiproject/boardinsert");
	});
});

</script>



</head>
<body>
<div class="container">
<div class="center-block" >
<h1 class="display-4">OKKYD.CO.KR</h1>
<hr>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
<button type="button" class="btn btn-primary m-2" id="movelogin">로그인</button>
</div>

<select  class="form-select mb-2" id="category" required="required" >
	<option selected>분야</option>
	<option id="1" value="게임">게임</option>
	<option id="2" value="여행">여행</option>
	<option id="3" value="음악">음악</option>
</select>


<table class="table table-striped table-hover table-sm w-100" style="margin-left: auto; margin-right: auto;">
<tr>
	<th scope="col">분야</th>
	<th scope="col">제목</th>
	<th scope="col">글쓴이</th>
	<th scope="col">작성시간</th>
</tr>
<c:forEach items="${boardlist }" var="list" varStatus="status">
	<tr>
		<td>${list.iboard_type }</td>
		<td><a href="http://localhost:9090/semiproject/boarddetail?iboard_id=${list.iboard_id }"><ins>${list.iboard_title }</ins></a></td>
		<td>${list.iboard_iuser_name }</td>
		<td>${list.iboard_time }</td>
	</tr>	
</c:forEach>

</table>

<hr>
<button type="button" class="btn btn-outline-primary" id="boardinsert">글쓰기</button>

</div>
</div>
</body>
</html>