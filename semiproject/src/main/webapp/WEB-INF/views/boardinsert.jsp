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
	$("#contentscancel_btn").on("click", function(){
		$(location).attr("href", "http://localhost:9090/semiproject/boardmain");
	});
});

/* $(document).ready(function(){
	$("#category").on("change", function(){//ajax로그인
		result = $("#category").val();
	});
}); */


/* $(document).ready(function(){
	$("#contentsadd_btn").on("click", function(){
		$.ajax({
			url : "/semiproject/boardinsertaccess",
			data : {"iboard_title" : $("#iboard_title").val(), "iboard_type" : result, "iboard_contents" : $("#iboard_contents").val()},
			type : "post",
			dataType : "json",
			success : function(serverdata){
				alert(serverdata.process);
			}
		});
	});
}); */
</script>
</head>
<body>

<div class="container" style="margin-left:400px;">
<div class="center-block" style="display:inline-block; margin:auto;">
<h1 class="display-4">OKKYD.CO.KR</h1>
<hr>
<form action="/semiproject/boardinsertaccess" method="get" style="margin:20px; width:800px;">
<div class="mb-3">
  <label>제목</label>
  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
  <select name="iboard_type">
	<option value="게임">게임</option>
	<option value="여행">여행</option>
	<option value="음악">음악</option>
</select>
  <input type="text" class="form-control" name="iboard_title" >
</div>

<label>내용</label><br>
<textarea name="iboard_contents" rows="5" cols="108" class="form-control"></textarea><br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<button class='btn btn-outline-primary' type="button" id="contentscancel_btn">취소</button>
<input class='btn btn-outline-primary' type="submit" value="등록">
</form>
</div>
</div>

</body>
</html>