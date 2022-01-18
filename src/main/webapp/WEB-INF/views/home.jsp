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
<head>
	<title>메인화면</title>
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
	</head>
<body>
	<br>
	<br>
	<br>
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
                                <p>H<em>arvard Hair Salon</em></p>
                            </a>
                        </div>  
                    </div>
                    <div class="collapse navbar-collapse" id="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><span></span><a href="/" class="home">Home</a></li>
                            <li><span></span><a href="/order/reserve" class="about">예약하기</a></li>
                            <li><span></span><a href="#second-section" class="portfolio">Projects</a></li>
                            <li><span></span><a href="#map" class="map">Location</a></li>
                            <li><span></span><a href="#third-section" class="contact">Contact</a></li>
                        </ul>
                    </div>
                </div> 
            </div>
        </nav>
    </header>
    <div>
	<br>
	<br>
	<c:if test="${loginName != null}">
		<h2>
		${sessionScope.loginName}(${sessionScope.loginId})님 환영합니다 !!!<br>
		</h2>
	</c:if>
	
	
	<c:if test="${loginName == null}">
		<a href="/user/login"><p align="right">로그인</p></a>
	</c:if>
	<c:if test="${loginName != null}">
		<a href="/user/logout">로그아웃</a>
	</c:if>
	<p> 
	저희 광주우산로지점은 건강하고 좋은 재료로 사용하기 위해 항상연구하고 고민합니다.<br>
	하버드 헤어 살론에서는 고객 한분 한분에게 정성을 다하여 최고의 서비스와 퀄리티를 드리기 위해 노력합니다.
	<br>
        그레이스펌, 매직, 볼륨매직, 빌드펌, 웨이브펌, 허쉬펌, 히피펌, 염색, 탈색, 하이라이트, <br>
        컷트 전문브랜드 / 유기농 클린펌 / 유기농 클린컬러 / 크리닉모발두피 케어전문 / 모든 미용기기 살균소독 / 일회용 얼굴솜 사용 / 브런치 서비스 / 음료서비스 / 발렛가능 / 무선인터넷</p>
	<input type="button" value="예약버튼" style="font-weight : bold ;" onclick="location.href='/order/reserve';">
</div>
   <div id="first-section">
       <div class="heading">
           <div class="container">
               <div class="row">
                   <div class="col-md-12">
                           <h2 class="header-section-title">What We Can Do</h2>
                   </div> 
               </div>
           </div>
       </div>
   </div>

   <div id="first-section1">
       <div class="container">
           <div class="row">
               <div class="triangle"></div>
           </div>
           <div class="row">
               <div class="col-md-12">
                   <section id="cd-timeline" class="cd-container">
                       <div class="cd-timeline-block">
                           <div class="cd-timeline-img cd-picture">
                               <img src="/resources/image/first-icon.png" alt="Picture">
                           </div>
                           <div class="cd-timeline-content service-box-content">
                                <h2>미용실 소개</h2>
                                <p>저희 미용실은 전 세계 미용대회에서 대상을 수상한 <span class="blue">카나다 원장님</span>과 그 수제자 <span class="green">오키나와</span> 부원장이 여러분을 미를 끌어주는 샵입니다. </p>
                            </div>
                        </div>
                        <div class="cd-timeline-block">
                            <div class="cd-timeline-img cd-movie">
                                <img src="/resources/image/second-icon.png" alt="Picture">
                            </div>

                            <div class="cd-timeline-content service-box-content">
                                <h2>원장 리스트</h2>
                                <p> <strong>change top icons</strong> by looking at guidelines from <a rel="nofollow" href="http://fontawesome.info/font-awesome-icon-world-map/">Font Awesome</a>. Example: <strong>&lt;i class=&quot;fa fa-camera&quot;&gt;&lt;/i&gt;</strong></p>
                            </div>
                        </div>

                        <div class="cd-timeline-block">
                            <div class="cd-timeline-img cd-icon">
                                <img src="/resources/image/third-icon.png" alt="Picture">
                            </div>

                            <div class="cd-timeline-content service-box-content">
                                <h2>시술종류</h2>
                                <table border ="1">
                                	<tr>
                                		<th>컷</th>
                                		<th>가격</th>
                                	</tr>
                                	<tr>
                                		<td>남성컷</td>
                                		<td>15000</td>
                                		
                                	</tr>
                                	<tr>
                                		<td>레이어드</td>
                                		<td>19000</td>
                                	</tr>
                                	<tr>
                                		<td>태슬컷</td>
                                		<td>20000</td>
                                	</tr>
                                	<tr>
                                		<td>페이스라인컷</td>
                                		<td>5000</td>
                                	</tr>
                                	<tr>
                                		<td>허쉬컷</td>
                                		<td>18000</td>
                                	</tr>
                                </table>
                            </div>
                        </div> 

                        <div class="cd-timeline-block">
                            <div class="cd-timeline-img cd-location">
                                <img src="/resources/image/fourth-icon.png" alt="Picture">
                            </div>

                            <div class="cd-timeline-content service-box-content">
                                <h2>시술가격</h2>
                                <p></p>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
    
    <div id="cta">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h4>Projects</h4>
                    <p>What we have done</p>
                </div>   
            </div>
        </div>
    </div>

    <div id="second-section">
        <div class="heading">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                            <h2>Review</h2>
                    </div> 
                </div>
            </div>
        </div>
    </div>
    
    <div id="second-section2">
        <div class="container">
            <div class="row">
                <div class="triangle"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <section id="cd-timeline-2" class="cd-container">
                        <div class="cd-timeline-block">
                            <div class="cd-timeline-img cd-picture">
                                <img src="/resources/image/camera-icon.png" alt="Picture">
                            </div>

                            <div class="cd-timeline-content projects">
                                <img src="/resources/image/project-1.jpg" alt="">
                                <div class="project-content">
                                    <h2>Donec at scelerisque</h2>
                                    <span>18 December 2084</span>
                                </div>
                            </div>
                        </div>

                        <div class="cd-timeline-block">
                            <div class="cd-timeline-img cd-picture">
                                <img src="/resources/image/camera-icon.png" alt="Picture">
                            </div>

                            <div class="cd-timeline-content projects">
                                <img src="/resources/image/project-2.jpg" alt="">
                                <div class="project-content">
                                    <h2>Nullam hendrerit ultrices</h2>
                                    <span>12 December 2084</span>
                                </div>
                            </div>
                        </div>

                        <div class="cd-timeline-block">
                            <div class="cd-timeline-img cd-picture">
                                <img src="/resources/image/camera-icon.png" alt="Picture">
                            </div>

                            <div class="cd-timeline-content projects">
                                <img src="/resources/image/project-3.jpg" alt="">
                                <div class="project-content">
                                    <h2>Quisque mollis diam</h2>
                                    <span>10 December 2084</span>
                                </div>
                            </div>
                        </div>

                        <div class="cd-timeline-block">
                            <div class="cd-timeline-img cd-picture">
                                <img src="/resources/image/camera-icon.png" alt="Picture">
                            </div>

                            <div class="cd-timeline-content projects">
                                <img src="/resources/image/project-4.jpg" alt="">
                                <div class="project-content">
                                    <h2>Etiam a ultricies</h2>
                                    <span>30 November 2084</span>
                                </div>
                            </div>
                        </div>

                        <div class="cd-timeline-block">
                            <div class="cd-timeline-img cd-picture">
                                <img src="/resources/image/camera-icon.png" alt="Picture">
                            </div>

                            <div class="cd-timeline-content projects">
                                <img src="/resources/image/project-5.jpg" alt="">
                                <div class="project-content">
                                    <h2>Curabitur interdum</h2>
                                    <span>22 November 2084</span>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>


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
                        <div class="col-md-4">
                            <div class="back-to-top">
                                <a href="#top">Back To Top</a>
                            </div>
                        </div>
                    </div>    
                </div>
            </div>
        </div>
    </footer>
</body>
</html>