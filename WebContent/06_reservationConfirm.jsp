<%@page import="vo.VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/6confirm.css">
<link rel="stylesheet" href="./style/footer.css">



<!-- ======================================================== -->

<meta charset="UTF-8">
<title>여기,좋은데 : 결제 내역 확인 </title>
</head>
<body>
   <!-- ====================================================== -->
<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");    
	response.setDateHeader("Expires", 1L);              

	request.setCharacterEncoding("utf-8");
	String sid =(String)session.getAttribute("sid");%>
	
	<%if(sid==null){%>
		
	
	<nav class=" navbar navbar-expand-lg bg-body-tertiary fixed-top">
		<div class="container-fluid d-inline-flex ">

	
			<a class="navbar-brand mg-l" href="00_main.jsp"> <img
				src="./pic/logo4.png" width="140px" height="58px"></a>

			<div class="">
				<div>
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
				</div>

				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item mg"><a class="nav-link active b" aria-current="page" href="01_Login.jsp">로그인</a></li>
						<li class="nav-item mg"><a class="nav-link b"  href="01_register.jsp">회원가입</a></li>
				</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<div class="displayco  lnfo2" style="margin-top:120px;">
	<div>로그인 후 이용 하실 수 있습니다.<br></div>	
	<a href="01_Login.jsp" class="mt-2"><input class="Lobox mt-3" type="button" value="로그인하러 가기"></a>
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
							<li class="nav-item dropdown mg-r"><a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<img src="./pic/pp.png" width="30px" height="30px"> </a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="getMyInfo.do">내정보 수정</a></li>
								<li><a class="dropdown-item" href="PaySearch.do">예약 내역</a></li>
								<li><a class="dropdown-item" href="02_jangbaguni.jsp">장바구니</a></li>
								<li><a class="dropdown-item" href="02_jjim.jsp">찜 목록</a></li>
								<li><a class="dropdown-item" href="ReviewSearch.do"> 리뷰</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>			
		</div>
	</nav>


	<!-- ---------------------------------------------------------------------- -->

	<div class="COcontainer displaypop " >
	<div  class="TitleConfirm tway1">📝 주문 상세  </div>	
	<hr>	
	 <div class="displayco ">	 
	 <hr class="brline">
	 
	<div class="displayc conbox2">
	<div class=" displayb conbox">	
		 <div class="">	
		 <div class=" " style="color:gray;"> 주문 번호 : ${stv.imp_uid }</div>
		  <div class="" style="color:gray;"> 주문자 : ${stv.buyer_name }</div>
		  </div>
	 	<form action="PayDelete.do" class="mr-4" style="margin-right:20px;">
	 	    <input type="hidden" class="conDbox"  name ="merchant_uid" value="${stv.merchant_uid }">
	 		<input type="submit" class="conDbox" value="내역삭제">
	 	</form>
         </div>	 
	  <hr class="brline2">
	  <div class="displayco conbox3">
	  <div class=" displays">
	  <div id="img1"></div>
	  <div class="conbox4 ">
	    <div class="Title2 tway2"> <span style="font-weight:bold;"> 구매 상품 : </span>${stv.buyer_addr }</div>
	    <div style="margin-bottom:8px;"> 여행 예정일 : ${stv.merchant_uid }</div>
	  	 <div style="margin-bottom:8px;"> 여행자 전화번호 : ${stv.buyer_tel }</div>
	  	<div> 여행자 이메일 : ${stv.buyer_email }</div>
	   </div>
	   </div> 
	  </div>
	   <div class=" conbox5" style="margin:20px 10px;">
	  <div class="Title1 tway3"> 결제 정보 </div>
	  <hr class="brline2">
	  <div class="displays conbox3">
	  <div id="img1"></div>
	  <div class="conbox4">
	  
	   	<div id="oriprice"></div>
	  	<div id="mile" style="display:none;"> ${stv.buyer_postcode} </div>
	  	<div id="realmile"> ${stv.buyer_postcode}</div>
	  	<div id="price" style="display:none;"> ${stv.amount }</div>
	  	<div id="realprice"> ${stv.amount }</div>
	   </div>
	  </div>
	 </div>
	 </div>
	  <div>
	   <div class="mt-3 displaye" style="width:1000px; padding-right:100px;"> 
	<button class="btn btn-success" id="paySearchButton">돌아가기</button>
	 </div>
	 </div>		
	 </div>
	
	</div>
	
	
	
	
	<%} %>
	
   <!-- ---------------------------------------------------------------------- -->

	<footer>
		<div class="container ">
			<div class="footer-menu">
				<div class="first-box">
					<div class="column">
						<div class="sub-title">Category</div>
						<form id="myForm" action="AllListInfo.do" method="post">
							<input class="menu-item" type="submit" value="상품 전체 보기" >
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
				<p>Seoul, Korea</p>
				<br>
				<div class="secon-last">© 2024 Here, Good-Day</div>

			</div>
		</div>
	</footer>




	<!-- ---------------------------------------------------------------------- -->
	<script src="./script/Allist.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 	crossorigin="anonymous"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>  
 	<script src="./js/jquery-3.7.1.js"></script>
	<script>
	
	
	var randomNumber = Math.floor(Math.random() * 40) + 1;
	var imagePath = "./allist/" + randomNumber + ".jpg";
	var dynamicHTML = "<div><img src='" + imagePath + "' class='conIMbox'></div>";
	document.getElementById('img1').innerHTML = dynamicHTML;
	
	function formatNumber(num) {
	    return new Intl.NumberFormat('ko-KR').format(num);
	}

	// 결제 최종 금액 
	var price2Element = document.getElementById("price");
	var price = parseFloat(price2Element.innerText.replace("원", "").replace(",", "")); // 숫자로 변환, 콤마와 원 제거
	var realprice = document.getElementById('realprice');
	realprice.innerText = "최종 결제 금액 : " + formatNumber(price) + "원";
	
	// 마일리지, 주문 금액 포맷팅
	var mile1 = document.getElementById("mile");
	var mileValue = parseFloat(mile1.innerText.replace("M", "").replace(",", "")); // "M"과 콤마 제거 후 숫자로 변환
	var realmile = document.getElementById('realmile');
	realmile.innerText = "사용 마일리지 : " + formatNumber(mileValue) + "M";
	

	// 기존 주문금액 계산 및 포맷팅
	var oriprice1 = price + mileValue;
	var oriprice = formatNumber(oriprice1) + "원";
	document.getElementById('oriprice').innerText = "주문금액 : " + oriprice;

	
	</script>
	
	<script>
    // 버튼 클릭 시 실행할 함수
    function executePaySearch() {
         window.location.href = 'PaySearch.do';
        console.log('PaySearch.do를 실행합니다.');
    }

    // 버튼에 이벤트 리스너 추가
    document.getElementById('paySearchButton').addEventListener('click', executePaySearch);
</script>
	
	
	
</body>
</html>