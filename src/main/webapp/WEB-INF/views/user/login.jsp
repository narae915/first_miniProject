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
<meta charset="UTF-8">
<title>로그인</title>
<style>
	#r {
		color:red;
		font-weight:bold;
	}
</style>
<script type="text/javascript">
	function loginCheck() {
		var checkId = document.getElementById("checkId").value;
		var checkPw = document.getElementById("checkPw").value;
		var result = false;
		
		if(checkId == "" || checkId.length == 0){
			alert("ID를 입력해주세요");
			return result;
		}else if(checkId.length < 3 || checkId.length > 10){
			alert("ID는 3~10글자 사이로 입력해주세요");
			return result;
		}
		
		if(checkPw == "" || checkPw.length == 0){
			alert("비밀번호를 입력해주세요");
			return result;
		}else if(checkPw.length < 4 || checkPw.length > 12){
			alert("비밀번호는 4~12글자 사이로 입력해주세요");
			return result;
		}
		
		result = true;
		return result;
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
 <h1> [로그인]</h1>
	<form action="/user/login" method="post" onsubmit="return loginCheck();">
		<table>
			<tr>
				<td class="bold">ID</td>
				<td><input type="text" name="userId" id="checkId"/></td>
			</tr>
			<tr>
				<td class="bold">비밀번호</td>
				<td><input type="password" name="userPw" id="checkPw"/></td>
			</tr>
				<c:if test="${not empty errorMessage}">
					<tr id="r">
						<td colspan="2"> ${errorMessage } </td>
					</tr>
				</c:if> 
			<tr>
				<td colspan="2" class="center white">
					<input type="submit" value="로그인" style="font-weight : bold ;"/>
				</td>
			</tr>
		</table>
		
		<p>회원이 아니신가요?</p>
		<input type="button" value="회원가입 후 로그인 " style="font-weight : bold;" onclick="location.href='/user/join';">
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
</body>
</html>