
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.NumberFormat"%>



<!-- ======================================================== -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- ======================================================== -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->

<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/footer.css">
<link rel="stylesheet" href="./style/Allist.css">


<!-- ======================================================== -->


<meta charset="UTF-8">
<title>상품 선택</title>
</head>
<!-- ---------------------------------------------------------------------- -->
<body>
	<%
   response.setHeader("pragma", "No-cache");  
   response.setHeader("Cache-Control", "no-cache");  
   response.addHeader("Cache-Control", "no-store");   
   response.setDateHeader("Expires", 1L);              
    request.setCharacterEncoding("utf-8");
	String sid =(String)session.getAttribute("sid");
	
%>
	<!-- ======================================================= -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top  ">
		<div class="container-fluid d-inline-flex ">
			<a class="navbar-brand mg-l" href="00_main.jsp"> <img
				src="./pic/logo4.png" width="140px" height="58px"></a>

			<div class="">
				<div>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
						aria-controls="navbarNavDropdown" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>
				

				<div class="collapse navbar-collapse  displaye " id="navbarNavDropdown">
				<form action="SelectArea.do "class="d-flex" role="search">
							<input class="form-control "placeholder="여행지를 검색하세요" type="search"  name = "area" style= "height:40px; margin-right:10px;"> 
							<input type="hidden" name="pageNumber" value="1" /> <!-- 페이징! -->	
							<button type="submit" class="btn btn-success " 	style="width:150px; height:40px;" >검색</button>
			</form>		
					<ul class="navbar-nav ">
						<%if(sid==null){%>		
							<li class="nav-item mg "><a class="nav-link active b  " aria-current="page" href="01_Login.jsp">로그인</a></li>
							<li class="nav-item mg"> <a class="nav-link b  " href="01_userInsertForm.jsp">회원가입</a></li>
							
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
		</div>
	</nav>

	<!-- ---------------------------------------------------------------------- -->
	<br>
	<br>
	<div class="Acontainer " style="height:1000px;">

    <h1 class="row mb-4">검색 결과</h1>
    <c:forEach var="vo1" items="${alist1}" varStatus="loopStatus">
        <c:if test="${loopStatus.index % 4 == 0}">
            <div class="row display  mt-4">
        </c:if>

        <a class="card cardsize " href="view.do?name=${vo1.name}">
            <img src="./allist/${vo1.soo}.jpg" width="300" height="150" class="card-img-top mt-2">
            <div class="card-body">
                <p class="card-text">
                    <input type="hidden" value="${vo1.soo}">
                    <div>[${vo1.area}]</div>
                    <div style="font-size:16px;">${vo1.name}</div>
                    <div>${vo1.price}원</div>
                </p>
            </div>
        </a>

        <c:if test="${(loopStatus.index + 1) % 4 == 0 or loopStatus.last}">
            </div>
        </c:if>
    </c:forEach>
    
    
   
   
   <div class="test display">
      <button onclick="onPage('first')">첫페이지</button>
      <button onclick="onPage('prev')">이전</button>

      <c:forEach begin="${startPage}" end="${endPage}" var="pageNumber">
         <button  onclick="onPage(${pageNumber})" class = pageNumber value = "${pageNumber}">[${pageNumber}]</button>
      </c:forEach>

      <button onclick="onPage('next')">다음</button>
      <button onclick="onPage('last')">마지막페이지</button>
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



	<script src="./script/Allist.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<!-- ======================================================== -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"	crossorigin="anonymous"></script>
	<script>
   function onPage(type) {
      const nowPage = Number("${param.pageNumber}"); 
       var num = 1;
       
       switch (type) {
           case 'first': num = 1; break;
           case 'prev':
            num = nowPage - ${pageLimit} >= 1 ? nowPage - ${pageLimit} : 1;
            break;
            case 'next':
            num = nowPage + ${pageLimit} <= ${totalPages} ? nowPage + ${pageLimit} : ${totalPages};
            break; 
           case 'last': num = ${totalPages}; break;
           default: num = type; break;
           
       }    
       location = 'SelectArea.do?area=' + "${param.area}" + '&pageNumber=' + num;
   }
</script>
</body>
</html>