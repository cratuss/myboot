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
		$("#comments_contents").attr("style", "display: none");
		$("#contentsadd_btn").attr("style", "display: none");
	}
});

$(document).ready(function(){
	$("#contentsadd_btn").on("click", function(){//ajax로그인
		$.ajax({
			url : "/semiproject/commentsadd",
			data : {"comments_contents" : $("#comments_contents").val(), "comments_iboard_id" : $("#comments_iboard_id").val()},
			type : "post",
			dataType : "json",
			success : function(serverdata){
				alert(serverdata.process);
				location.reload();
			}
		});
	});
});


$(document).ready(function(){
	$("#movemain").on("click", function(){
		$(location).attr("href", "http://localhost:9090/semiproject/boardmain");
	});
});


$(document).ready(function(){
	if("${iuser.iuser_id}" != "${boarddetail.iboard_iuser_id}"){
		$("#contentsdelete_btn").attr("style", "display: none");
	}
});

$(document).ready(function(){
	$("#contentsdelete_btn").on("click", function(){
		$(location).attr("href", "http://localhost:9090/semiproject/contentsdelete?iboard_id=" + ${boarddetail.iboard_id });
		alert("삭제되었습니다.");
	});
});



</script>

</head>
<body>
<div class="container">
<div class="center-block">
<h1 class="display-4">OKKYD.CO.KR</h1>
<hr>
<table class="table table-striped table-hover table-sm" style="margin-left: auto; margin-right: auto;">
<tr>
	<th><h2>${boarddetail.iboard_type }</h2></th>
</tr>
<tr>
	<th scope="col">${boarddetail.iboard_title }<br>
		${boarddetail.iboard_iuser_name}&nbsp;&#124;&nbsp;${boarddetail.iboard_time}
	</th>
</tr>
<tr>
	<td>${boarddetail.iboard_contents }</td>
</tr>

</table>
<input type="text" style="display: none" id="comments_iboard_id" value="${boarddetail.iboard_id }"/>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<button class='btn btn-outline-primary' id="contentsdelete_btn">삭제</button>
<hr>






<table class="table table-striped table-sm w-75">
<tr>
<th scope="col" colspan="3"><h4>전체 댓글</h4></th>
<th></th>
<th></th>
</tr>
<c:forEach  items="${commentlist }" var="list" varStatus="status">

				<tr>
					<td>${list.comments_iuser_name }</td>
					<td>${list.comments_contents }</td>
					<td id="${status.index}">${list.comments_time }</td>
	<script>
		$(document).ready(function(){
			if("${iuser.iuser_id}" == "${list.comments_iuser_id}"){
				$("#${status.index}").after(
						"<td id='commentsdelete_btn'><a href='http://localhost:9090/semiproject/commentsdelete?comments_id=${list.comments_id }&"
						+ "comments_iboard_id=${list.comments_iboard_id }'><ins>삭제</ins></a></td>"	 
				);
			}
		});
	</script>
				</tr>
</c:forEach>
</table>
<hr>
<textarea id="comments_contents" rows="1" cols="112"></textarea>&emsp;
<button class='btn btn-outline-primary' id="contentsadd_btn">댓글 등록</button>
<hr>
<button class='btn btn-outline-primary' id="movemain">목록으로</button>


</div>
</div>
</body>
</html>