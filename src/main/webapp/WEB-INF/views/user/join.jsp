<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> 
<![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" lang="en"> 
<![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<html>
<head>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8">
	
	<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/templatemo-style.css">
	
	<!-- JavaScripts -->
	<script src="/resources/js/vendor/jquery-1.10.2.min.js"></script>
	<script src="/resources/js/vendor/modernizr.min.js"></script>
<title>회원가입</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//ID중복검사를 통과했는지 여부를 저장하는 변수
	var isIdChecked = false;
	
	// AJAX 방식으로 ID 중복검사를 실행하는 함수
	function idChk() {
		
		$.ajax({
			url: "/user/idChk",
			data: {
				idChk: $("#userId").val()
			},
			success: function(res) {
				if(res == "available") {
					isIdChecked = confirm("회원 가입이 가능한 ID입니다. 사용하시겠습니까?");
					
					if (isIdChecked) { // 확인을 누른 경우
					    // 더이상 값을 변경하지 못하게 입력란을 읽기 전용으로 바꾸고 id중복검사 버튼을 비활성화
						$("#userId").attr("readonly","readonly"); 
						$("input:button").attr("disabled","disabled");
					}
				} else {
					alert("이미 가입된 ID입니다.");
				}  
			}
		});
	}

	//회원가입 페이지에서 사용자가 입력한 데이터의 유효성을 검사하는 함수
	function formChk() { 
	 if(!isIdChecked) { //Id중복검사를 통과하지 못한 경우
	 	alert("ID중복검사를 실시해주세요.");
	 	
	 	return false;
	 }
	  
	 var userId =$("#userId").val().trim(); // 사용자가 입력한ID값을 가져와서 공백 제거
	 if(userId.length == 0) { // ID를 입력하지 않은 경우
	    alert("ID를 입력해주세요.");
	 
	    return false;
	 }
	 if(userId.length < 3 || userId.length > 10 ) { // ID를 3~10자리 사이로 입력하지 않은 경우
	    alert("ID를 3~10자리 사이로 입력해주세요.");
	 
	    return false;
	 }
	 
	 var userPw =$("#userPw").val().replaceAll(" ",""); //사용자가 입력한PW 값을 가져와서 모든공백을 제거
	 if(userPw.length == 0) { // PW를 입력하지 않은 경우
	    alert("비밀번호를 입력해주세요.");
	 
	    return false;
	 }
	if(userPw.length < 4 || userPw.length > 12 ) { // Pw를 4~12자리 사이로 입력하지 않은 경우
	    alert("비밀번호는 4~12자리 사이로 입력해주세요.");
	 
	    return false;
	 }
	 
	 var memberPwChk = $("#memberPwChk").val().replaceAll(" ","");
	 if(userPw != memberPwChk) {
	    alert("비밀번호를 확인해주세요.");
	 
	    return false;
	 }
	
	//모든 유효성을 검사를 통과한 경우
	return true;
	}
</script>
</head>
<body>
<header class="site-header" id="top">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="row">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                          <i class="fa fa-bars"></i>
                        </button>
                        <div class="logo-wrapper">
                            <a class="navbar-brand" href="/">
                                <p>T<em>imeline</em></p>
                            </a>
                        </div>  
                    </div>
                    <div class="collapse navbar-collapse" id="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><span></span><a href="/" class="home">Home</a></li>
                            <li><span></span><a href="/order/reserve" class="about">예약하기</a></li>
                            <li><span></span><a href="#map" class="map">Location</a></li>
                            <li><span></span><a href="#third-section" class="contact">Contact</a></li>
                        </ul>
                    </div>
                </div> 
            </div>
        </nav>
    </header>
	<h1>[ 회원가입 ]</h1>
	
	<form action="/user/join" method="post" onsubmit="return formChk();">
		<table>
			<tr>
				<th>ID</th>
				<td>
				  <div style="float:left; margin-right:10px;">
					<input type="text" id="userId" name="userId"> 
				  </div>
				  <div style="float:right; margin-right:10px;">
					<input type="button" value="ID중복검사" style="font-weight : bold;" onclick="idChk();">
				  </div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="userPw" name="userPw"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="memberPwChk"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="userNm"></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><input type="text" name="userTel"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="회원가입" style="font-weight : bold ;"></td>
			</tr>
		</table>
	</form>
	<footer>
        <div class="container">
            <div class="footer-content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="col-md-4">
                            <div class="copyright-text">
                                <p>Copyright &copy; 2084 <a href="#">Company Name</a></p>
                            </div>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
    </footer>
		<script type="text/javascript" src="js/vendor/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/custom.js"></script>
</body>
</body>
</html>