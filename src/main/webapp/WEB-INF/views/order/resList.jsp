<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 예약 리스트</title>
<script type ="text/javascript" src ="/resources/js/jquery-3.6.0.min.js"></script>
<script type = "text/javascript">

// 예약 취소
function deleteOrder(resNum){
	
	var result = confirm("정말 취소하겠습니까?");

	if(result){
		location.href="/order/deleteOrder?resNum="+resNum; 
	}
}

//예약 수정
function updateOrder(userId){  //  userNm가 같으면 수정 페이지로
	location.href="/order/updateRes?userId="+userId;
}

</script>
</head>
<body>
<h1>나의 예약 리스트</h1>
<h3>(예약 완료)</h3>

<c:if test = "${empty orderList }">
	예약 내역이 없습니다.
</c:if> 

 <c:if test="${not empty orderList }"> 
	<table border="1" >
			<tr>
				<th>예약 번호</th>
				<th>디자이너&nbsp;시술&nbsp;가격</th>
				<th colspan="2">수정&nbsp; 삭제</th>
			</tr>
	<c:forEach items ="${orderList }" var="order">
		 <tr>
			<td>${order.resNum }</td>
			<td>${order.desNm }&nbsp;${order.hairType }&nbsp;${order.price}</td>
			<td><input type="button" value="수정" onclick="updateOrder(${sessionScope.userId });"></td>
			<td><input type="button" value="예약 취소" onclick="deleteOrder(${order.resNum });"></td>
		</tr>
	</c:forEach>		
	</table>
</c:if>
	
<hr color="green" size="5px" width="75%" align="left">
<h3>과거 이용 내역</h3>
<c:if test = "${empty pastList }">
	과거 이용 내역이 없습니다.
</c:if>

<c:if test="${not empty pastList }">
	<table border="1">
		<tr>
			<th>디자이너</th>
			<th>시술</th>
			<th>이용 날짜</th>
			<th>리뷰 작성</th>
		</tr>
		<c:forEach items ="${pastList }" var="past">
			<tr>
				<td>${past.desNm }</td>
				<td>${past.hairType }</td>
				<td>${past.resIndate }</td>
				<td><button onclick="window.open('/review?resNum=${past.resNum }','리뷰 작성',
									'width=500,height=480,location=no,status=no,scrollbars=yes');">리뷰 작성</button></td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>