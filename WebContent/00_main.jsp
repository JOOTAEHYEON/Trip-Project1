
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>


<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"	rel="stylesheet"	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"	crossorigin="anonymous">
<link rel="stylesheet"	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/0main.css">
<link rel="stylesheet" href="./style/footer.css">

<meta charset="UTF-8">
<title>여기,좋은데이</title>


</head>

<body>

	<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");    // 일부파이어폭스버그관련
	response.setDateHeader("Expires", 1L);              //응답결과의만료일지정

	request.setCharacterEncoding("utf-8");
	String sid =(String)session.getAttribute("sid");
	Integer mileage = (Integer) session.getAttribute("mileage");
	   if (mileage == null) {
	       mileage = 0; 
	   }
	
	%>
		<!-- ==========================nav============================= -->	
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top  ">
		<div class="container-fluid d-inline-flex displayb  ">
			<a class="navbar-brand mg-l" href="00_main.jsp"><img src="./pic/logo4.png" width="140px" height="58px"></a>				
					
			<div>
				<button class="navbar-toggler" type="button"data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
				</button>
			</div>

			<div class="collapse navbar-collapse  displaye " id="navbarNavDropdown">	
					<ul class="navbar-nav mg-r">
						<%if(sid==null){%>		
							<li class="nav-item mg "><a class="nav-link active b" aria-current="page" href="01_Login.jsp">로그인</a></li>
							<li class="nav-item mg"> <a class="nav-link b " href="01_userInsertForm.jsp">회원가입</a></li>
							<li class="nav-item mg"> <a class="nav-link b" href="02_jjim.jsp"><img src="./pic/00_heart.png" width="30px" height="30px"></a></li>
						<%}else{%>
							<li class="nav-item mg"><a class="nav-link active b  " aria-current="page" href="logout">로그아웃</a></li>
							<li class="nav-item dropdown mg-r"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<img src="./pic/pp.png" width="30px" height="30px"> </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item  " href="getMyInfo.do">내정보</a></li>
									<li><a class="dropdown-item  " href="PaySearch.do">예약 내역</a></li>
									<li><a class="dropdown-item  " href="02_jangbaguni.jsp">장바구니</a></li>
									<li><a class="dropdown-item  " href="02_jjim.jsp">찜 목록</a></li>
									<li><a class="dropdown-item  " href="ReviewSearch.do"> 리뷰</a></li>
								</ul>
							</li>
						<% }%>												
					</ul>
				</div>		
		</div>
	</nav>


	<!-- ---------------------------------------------------------------------- -->

	<div id="carouselExampleSlidesOnly" class="carousel slide  display navm topm" data-bs-ride="carousel">
		<div class="carousel-inner">		
			<div class="m-4 " style="position: relative; height:520px">
				<div class="carousel-item active">
					<img src="./pic/00_002.jpg" class="d-block w-100" height="510px">
				</div>

				<div class="carousel-item">
					<img src="./pic/00_001.jpg" class="d-block w-100" height="510px">
				</div>

				<div class="carousel-item">
					<img src="./pic/00_003.jpg"  class="d-block w-100" height="510px">
				</div>
					<form action="SelectArea.do "class=" card-img-overlay d-flex  searchbox"  style="position: absolute; top: 450px;"role="search">
						<input class="form-control " id="line" type="search"  name = "area" placeholder="도시나 상품을 검색하세요"> 
						<input type="hidden" name="pageNumber" value="1" /> <!-- 페이징! -->					
						<button type="submit" style="height:70px; width:180px; font-size:20px;font-weight:bold;"class="btn btn-success  ">검색 하기</button>								
					</form>			
			</div>
		</div>
	</div>
	

	<!-- ---------------------------------------------------------------------- -->
	<div class="main-mr">
		<div>
			<h2 class="letter tway1"> 다시 돌아온 여행! 지금 뜨는 곳!</h2>
		</div>
		<br>
			<div class="display">
				<div class="card " style="width: 18rem; height:100%; position: relative; margin-right:22px;">
  				<img src="./pic/00_010.jpg" class="card-img-top " style="height:360px;">
  				<div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">  					
   					 <h1 class="card-title tway1">서울</h1>
   					 <p class="card-text tway1"> Best 상품만 모아! </p>
   				</div>
  				<div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
   					 <a href="SeoulListInfo.do" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
  				</div>
				</div>
			
			
			<div class="card mr-2" style="width: 18rem; height:100%; position: relative; margin-right:22px;">
  			<img src="./pic/00_012.jpg" class="card-img-top " style="height:360px;">
  			<div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">  		
   			 <h1 class="card-title tway1">부산</h1>
   			 <p class="card-text tway1"> All Time Legend </p>
   			 </div>
   			<div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
   					 <a href="BusanListInfo.do" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
  			</div>
			</div>
	
			<div class="card" style="width: 18rem; height:100%; position: relative; margin-right:22px;">
  			<img src="./pic/00_011.jpg" class="card-img-top " style="height:360px;">
  			<div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">  		
   			 <h1 class="card-title tway1">제주도</h1>
   			 <p class="card-text tway1">Dynamic Island</p>
   			 </div>
   			<div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
   					 <a href="JejuListInfo.do" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
  			</div>
			</div>
			
			<div class="card shadow" style="width: 18rem; height:100%; position: relative; margin-right:22px;">
  			<img src="./pic/00_013.jpg" class="card-img-top " style="height:360px;">
  			<div class="card-body" style="position: absolute; top: 20%; left: 30%; transform: translate(-50%, -50%);  color: white;">  		
   			 <h1 class="card-title tway1">대전</h1>
   			 <p class="card-text tway1">Chill and Fun</p>
   			 </div>
   			<div class="card-body" style="position: absolute; width:100%;top: 80%; left: 30%; transform: translate(-50%, -50%); text-align: center; color: white;">
   				 <a href="DaejunListInfo.do" class="btn btn-light  " style="width:100px; height:50px; padding:12px 16px;">둘러보기</a>
  			</div>
			</div>
  		</div>	
  		</div>
  			
  
	<div class="main-mr">
		<div>
			<h2 class="letter tway1"> 우리 동네 서울 ,BEST 상품</h2>
		</div>
		<br>

		<div class="text-center contents  ">
    			<div class="image-container mt-3">
     		    <a href="view.do?name=광장시장 투어"> <img style="width: 350px; height: 200px;" src="./pic/00_03SM.jpg" class="rounded"></a>
       			 <p class="image-text mt-2">[서울] 광장시장 투어</p>
   			 </div>

			
			<div class="image-container mt-3">
				<a href="view.do?name=청와대 관람"> <img style="width: 350px;  height: 200px;"	src="./pic/00_02SB.jpg" class="rounded" ></a>			
				<p class="image-text mt-2">[서울] 청와대 관람</p>
			</div>
			<div class="image-container mt-3">
				<a href="view.do?name=경복궁 투어 ">  <img style="width: 350px; height: 200px;"	src="./pic/00_02SBC.jpg" class="rounded"></a>			
				<p class="image-text mt-2">[서울] 경복궁 투어</p>
			</div>
			<div class="image-container mt-3">
				<a href="view.do?name=청계천 투어"> <img style="width: 350px;  height: 200px;"	src="./pic/00_03SC.jpg" class="rounded" >	</a>			
				<p class="image-text mt-2">[서울] 청계천 투어</p>
			</div>
			
		</div>
	</div>

	<div class="main-mr1">
		<div>
			<h2 class="letter tway1">국내 여행,BEST 상품</h2>
		</div>
		<br>

		<div class="text-center contents ">
			<div class="image-container">
				<a href="view.do?name=해운대 해수욕장"> <img style="width: 350px; height: 200px;"src="./pic/00_02B.jpg" class="rounded"></a>			
				<p class="image-text mt-2">[부산] 해운대 해수욕장</p>
			</div>
			<div class="image-container">
				<a href="view.do?name=83타워 투어"> <img style="width: 350px; height: 200px;" src="./pic/00_03D.jpg" class="rounded" ></a>		
				<p class="image-text mt-2">[대구]83타워 투어</p>
			</div>
			<div class="image-container">
				<a href="view.do?name=한밭수목원 관람"> <img style="width: 350px; height: 200px;"src="./pic/00_03DJ.jpg" class="rounded"></a>				
				<p class="image-text mt-2">[대전] 한밭수목원 관람 </p>
			</div>
			<div class="image-container">
				<a href="view.do?name=성산일출봉 투어"> <img style="width: 350px; height: 200px;" src="./pic/00_02JS.jpg" class="rounded">	</a>
				<p class="image-text mt-2">[제주] 성산일출봉 투어</p>
			</div>
			
			
		</div>
	</div>

	<!-- ---------------------------------------------------------------------- -->
	
	<footer>
		<div class="container ">
			<div class="footer-menu">
				<!-- ------------------------------- 상자1 시작-------------------------------- -->
				<div class="first-box">
					<div class="column">
						<div class="sub-title">Category</div>
						<form id="myForm" action="SelectArea.do" method="post">
							<input class="menu-item" type="submit" value="상품 전체 보기" >
							<input type="hidden" name="pageNumber" value="1" /> <!-- 페이징! -->
						</form>

						<form id="myForm" action="JejuListInfo.do" method="post">
							<input class="menu-item" type="submit" value="제주여행" >
						</form>
						
						<form id="myForm" action="SeoulListInfo.do" method="post">
							<input class="menu-item" type="submit" value="서울여행" >
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Category</div>
						<form id="myForm" action="BusanListInfo.do" method="post">
							<input class="menu-item" type="submit" value="부산 여행" >
						</form>
						<form id="myForm" action="DaejunListInfo.do" method="post">
							<input class="menu-item" type="submit" value="대전 여행" >
						</form>
						
						<form id="myForm" action="DaegooListInfo.do" method="post">
							<input class="menu-item" type="submit" value="대구 여행" >
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Customer Service</div>
						<div class="menu-item-1">운영시간: 09:00~18:00</div>
						<div class="menu-item-1">Tel: 02-1234-5667</div>
						
					</div>
				</div>
				<div class="second-box">
					<div class="icon-box"><img class="icon" src="./pic/00_insta.png" width=30px height=24px></div>
					<div class="icon-box"> <img class="icon" src="./pic/00_twiter.png" width=30px height=24px></div>
					<div class="icon-box"> <img class="icon" src="./pic/00_face.png" width=30px height=24px></div>
				</div>
			</div>

			<div class="second-head">
				<p>Seoul, Korea</p> <br>
				<div class="secon-last">© 2024 Here, Good-Day</div>
			</div>
		</div>
	</footer>

<!-- ======================================================== -->
	<script src="./script/Allist.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	
</body>
</html>