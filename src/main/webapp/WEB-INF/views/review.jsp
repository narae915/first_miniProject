<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	$(function() {
		$("#starScore").on("change", function(){
			var score = $(this).val();
			console.log(score);
			var hidden = $("input[name=score]").attr("value", $("#starScore").val());
			console.log(hidden);
			
			$(".star-container span").removeAttr("class");
			for (var i=1; i<=score; i++) {
				//span태그에 class추가
				$(".star-container span#star"+i).attr("class", "on");
			}
		});

	});
	
	function formChk(){
		
		if(($("input[name=score]").val()) == 0){
			alert("점수를 매겨주세요.");
			return false;
		}
		
		var revContent = $("#revContent").val();
		if(revContent == "" || revContent == null) {
			alert("후기 내용을 작성해주세요.");
			return false;
		}
			
		var result = confirm("후기 내용은 수정할 수 없습니다. 정말로 등록하시겠습니까?");
		
		if(result) {
			alert("작성해주셔서 감사합니다. 후기 내용은 메인에서 확인가능합니다.");
			return true;
		}
		return false;
	}
	
</script>
<style type="text/css">
	.star-container span{
		font-size:30px;
		letter-spacing:0;
		display:inline-block;
		margin-left:5px;
		color:#ccc;
	}
	.star-container span.on {
		color:red;
	}
</style>
</head>
<body>
	<h2>후기 작성</h2>
	<form action="/review" method="post" onsubmit="return formChk();">
	<input type="hidden" name="resNum" value="${pastOrder.resNum }">
		<table>
				<tr>
					<th>시술 받은 날</th>
					<th>디자이너</th>
					<th>시술 내용</th>
				</tr>
				<tr>
					<td>${pastOrder.resIndate }</td>
					<td>${pastOrder.desNm }</td>
					<td>${pastOrder.hairType }</td>
				</tr>
		</table>
		
		<select name="starScore" id="starScore">
			<option value="0">평점</option>
			<option value="1">1점</option>
			<option value="2">2점</option>
			<option value="3">3점</option>
			<option value="4">4점</option>
			<option value="5">5점</option>	
		</select>
		<input type="hidden" name="score">
		
		<div class="star-container" id="star">
			<span id="star1">★</span>
			<span id="star2">★</span>
			<span id="star3">★</span>
			<span id="star4">★</span>
			<span id="star5">★</span>
		</div>
		
		<textarea rows="10" cols="50" id="revContent" name="revContent"></textarea>
		<input type="submit" value="등록">
	</form>
	
</body>
</html>