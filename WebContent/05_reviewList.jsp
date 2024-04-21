
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- ======================================================== -->
<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/footer.css">
<link rel="stylesheet" href="./style/1MyList.css">

<!-- ======================================================== -->
<meta charset="UTF-8">
<title>여기,좋은데: My page : 리뷰 </title>

</head>
<body>
	<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");    // 일부파이어폭스버그관련
	response.setDateHeader("Expires", 1L);              //응답결과의만료일지정

	request.setCharacterEncoding("utf-8");
	String sid =(String)session.getAttribute("sid");%>
	<%if(sid==null){%>
		
	
	<nav class=" navbar navbar-expand-lg bg-body-tertiary fixed-top">
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

				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item mg"><a class="nav-link active b"
							aria-current="page" href="01_Login.jsp">로그인</a></li>
						<li class="nav-item mg"><a class="nav-link b"
							href="01_register.jsp">회원가입</a></li>


						
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<div class="displayco  lnfo2" style="margin:300px 0px;">
	<div>로그인 후 이용 하실 수 있습니다.<br></div>	
	<a href="01_Login.jsp"><input class="Lobox" type="button" value="로그인하러 가기"></a>
	</div>
	<%}else{%>


	<!-- ======================================================= -->
	<nav class=" navbar navbar-expand-lg bg-body-tertiary fixed-top ">
		<div class="container-fluid d-inline-flex ">


			<a class="navbar-brand mg-l" href="00_main.jsp"> <img src="./pic/logo4.png" width="140px" height="58px"></a>
				<div class="mg-r ">
					<button class="navbar-toggler " type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
							 aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">						
					<span class="navbar-toggler-icon"></span>
					</button>
				

					<div class="collapse navbar-collapse" id="navbarNavDropdown">
						<form action="SelectArea.do "class="d-flex" role="search">
							<input class="form-control "placeholder="여행지를 검색하세요" type="search"  name = "area" style= "height:40px; margin-right:10px;"> 
							<input type="hidden" name="pageNumber" value="1" /> <!-- 페이징! -->	
							<button type="submit" class="btn btn-success " 	style="width:150px; height:40px;" >검색</button>
						</form>	
						<ul class="navbar-nav">
							<li class="nav-item mg">
								<a class="nav-link active" aria-current="page" href="logout">로그아웃</a>
							</li>
						</ul>
					</div>
				</div>			
		</div>
	</nav>

	<!-- ---------------------------------------------------------------------- -->

	<div class="row REcontainer ">

			<div class="col-3 ">
			<div class="titleRE"></div>
			<div class="list-group "style="max-width: 350px;" >
				
   				<div class="list-group-item list-group-item-action tway1" style="font-size:30px; font-weight:bold;">My Page</div>
   				 <a href="getMyInfo.do" class="list-group-item list-group-item-action"style="height:60px">내 정보</a>     			
      			 <a href="PaySearch.do" class="list-group-item list-group-item-action" style="height:60px">예약내역</a>
      			 <a href="02_jangbaguni.jsp" class="list-group-item list-group-item-action" style="height:60px">장바구니</a>
      			 <a href="02_jjim.jsp" class="list-group-item list-group-item-action" style="height: 60px">찜 목록</a>
      			  <a href="ReviewSearch.do" class="list-group-item list-group-item-success active" aria-current="true"style="height:60px">리뷰</a>
    			</div>
			</div>



		<div class="col-9 ">
    <div class="REform ">
        <div class="titleRE tway1 "> Review</div>		
       <table class="table1 " style="text-align: left;">
    <thead>
        <tr style="font-size: 18px;">
            <th scope="col">순번</th>
            <th scope="col">이미지</th>
            <th scope="col">상품명</th>  
            <th scope="col">결제 가격</th> 
            <th scope="col">리뷰쓰기</th>            
            <th scope="col">확인 하기</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="vo1" items="${alist1}" varStatus="loop">          
    <tr style="font-size: 18px;">
        <td scope="col" class="">${loop.index + 1}</td>
         <td scope="col"><img src="./allist/${vo1.soo}.jpg" class="Rphoto"></td>
        <td scope="col" class=""><a href="view.do?name=${vo1.name}">${vo1.name}</a></td> 
        <c:set var="amountWithoutComma" value="${fn:replace(vo1.amount, ',', '')}" />
           		 <c:set var="amountInt" value="${amountWithoutComma ne '' ? 
           		 Integer.parseInt(amountWithoutComma) : 0}" />
            
          		  <td scope="col" id="amount" style="vertical-align: middle;">
                <!-- 정수값을 한국 원화로 형식화 -->
              		 <fmt:formatNumber type="currency" currencyCode="KRW" 
              		   value="${amountInt}" pattern="###,###원"/>
           		 </td>
        <td scope="col">
            <form action="05_reviewpopup.jsp" name="form2" method="post" id="form2">                                 
                <input type="hidden" id="soo" name="soo" value="${vo1.soo}">
                 <input type="hidden" id="name" name="name" value="${vo1.name}">  
                 <input type="hidden" id="date" name="date" value="${vo1.writedate}" >              
                <input type="submit" class="btn btn-dark" id="Rpopup1" value="리뷰쓰기">
            </form>
        </td>
        <td scope="col">
            <form name="form1" id="form1" method="post" action="select_review.do">    
                 <input type="hidden" id="soo" name="soo" value="${vo1.soo}">
                  <input type="hidden" id="name" name="name" value="${vo1.name}">
                  <input type="hidden" id="date" name="date" value="${vo1.writedate}" >                 
                <input type="submit" class="btn btn-dark" id="Rpopup2" value="내가 쓴 글">
            </form>
        </td>
    </tr>
</c:forEach>
    </tbody>
</table>
    </div>
</div>
</div>
	<%} %>
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
	<!-- ---------------------------------------------------------------------- -->
	

	<!-- ======================================================== -->	
	<script src="./script/Allist.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
	<!-- ======================================================== -->
</body>
</html>