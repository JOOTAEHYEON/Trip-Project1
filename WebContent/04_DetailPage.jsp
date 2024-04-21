
<%@page import="dao.Dao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.VO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- ======================================================== -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ======================================================== -->
<script src="./script/DetailPage.js"></script>
<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/footer.css">
<link rel="stylesheet" href="./style/4detail.css">



<!-- ======================================================== -->
<meta charset="UTF-8">
<title>여기,좋은데: 상세페이지</title>

</head>
<body>


	<!-- ======================================================= -->
	<%
		response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
	request.setCharacterEncoding("utf-8");
	String sid = (String) session.getAttribute("sid");
	DecimalFormat df = new DecimalFormat("###,###");
	Dao stv = new Dao();
	%>


	<!-- ======================================================= -->
	<nav class="  navbar navbar-expand-lg bg-body-tertiary fixed-top ">
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
					<form action="SelectArea.do " class="d-flex" role="search">
						<input class="form-control " placeholder="여행지를 검색하세요"
							type="search" name="area"
							style="height: 40px; margin-right: 10px;"> <input
							type="hidden" name="pageNumber" value="1" />
						<!-- 페이징! -->
						<button type="submit" class="btn btn-success "
							style="width: 150px; height: 40px;">검색</button>
					</form>
					<ul class="navbar-nav ">
						<li class="nav-item mg">
							<%
								if (sid == null) {
							%> <a class="nav-link active b" aria-current="page"
							href="01_Login.jsp">로그인</a>
						<li class="nav-item mg"><a class="nav-link b"
							href="01_userInsertForm.jsp">회원가입</a></li>
						<%
							} else {
						%>
						<a class="nav-link active b" aria-current="page" href="logout">로그아웃</a>
						<li class="nav-item dropdown mg-r"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> <img
								src="./pic/pp.png" width="30px" height="30px">
						</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="getMyInfo.do">내정보 수정</a></li>
								<li><a class="dropdown-item" href="PaySearch.do">예약 내역</a></li>
								<li><a class="dropdown-item" href="02_jangbaguni.jsp">장바구니</a></li>
								<li><a class="dropdown-item" href="02_jjim.jsp">찜 목록</a></li>
								<li><a class="dropdown-item" href="ReviewSearch.do"> 리뷰</a></li>
							</ul></li>
						<%
							}
						%>

					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- ---------------------------------------------------------------------- -->
	<div class="Dcontainer ">
		<div class="row   mt-2">
			<div class="col-7 display">
				<img src="./allist/${stv.soo}.jpg" class="img-fluid img">
			</div>
			<div class=" mt-4 col-5 ">
				<div style="margin: 30px 0px;">📍${stv.area} 가족 여행 필수 상품</div>
				<table style="text-align: center;">
					<tr>
						<td colspan=2><div class="tway1">[${stv.area }]
								${stv.name}</div></td>
						<br>
					</tr>
					<tr>
						<th><div class="nannum">상품 가격</div></th>
						<td><input type="hidden" value="${stv.price }" id="price"><input
							type="text" id="realprice" value="" readonly
							style="border: none;"></td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="text" name="i_cnt" id="i_cnt" size="3"
							maxlength="3" value="1" oninput="setQuantity()" autofocus
							oninput="setQuantity()">개</td>
					</tr>
					<tr>
						<th>이용 날짜</th>
						<td><input type="date" id="Ddate" max="2077-06-20"
							min="2024-02-08" value="날짜를 선택해주세요" onchange="setDate()">
						</td>
					</tr>
				</table>

				<div class="row  displayb ">
					<div class="col-6 displayb mt-3">
						<form name="form3" id="form3" method="post" action="Wishlist.do">
							<input type="hidden" name="soo" value="${stv.soo}"> <input
								type="hidden" name="area" value="${stv.area}"> <input
								type="hidden" name="name" value="${stv.name}"> <input
								type="hidden" name="price" value="${stv.price}"> <input
								type="submit"
								style="margin-right: 5px; width: 70px; height: 55px;"
								class="btn btn-dark" value="찜❤︎">
						</form>

						<form name="form1" id="form1" method="post" action="addToCart.do"
							onsubmit="return addToCart()">
							<input type="hidden" name="t_id" value="${sid}"> 
							<input type="hidden" name="soo" value="${stv.soo}"> 
							<input type="hidden" name="name" value="${stv.name}"> 
							<input type="hidden" name="price" value="${stv.price}"> 
							<input type="hidden" name="i_cnt" id="hiddenCnt" value="1"> 
							<input type="submit" class="btn btn-dark" style="width: 130px; 
								height: 55px;" value="장바구니 담기">
						</form>
					</div>
					<div class="col-6 mt-3 ml-2 ">
						<form name="fomr2" id="form2" method="post"
							action="05_confirm.jsp">
							<input type="hidden" name="productName" value="${stv.name}">
							<input type="hidden" name="productPrice" value="${stv.price}">
							<input type="hidden" name="productArea" value="${stv.area}">
							<input type="hidden" name="productSoo" value="${stv.soo}">
							<input type="hidden" name="i_cnt" id="hiddenCnt1" value="1">
							<input type="hidden" name="selectedDate" id="hiddenDate"
								value="미사용"> <input type="submit" class="btn btn-dark"
								style="width: 100%; height: 55px;" value="구매하기"
								onclick="gopay()">
						</form>
					</div>
				</div>


			</div>

		</div>
		<!-- ==============================이미지============================================================= -->
		<br class="br mt-4">
		<div class=" row swiper mySwiper ">
			<div class="m-4 titleFont tway1">다른 여행자들이 함께 본 상품</div>
			<div class="swiper-wrapper" style="position: relative;">

				<div class="swiper-slide display" style="width: 360px;">
					<a href="view.do?name=제주민속촌 체험"><img
						style="width: 360px; height: 250px;" src="./allist/36.jpg"></a>
				</div>
				<div class="swiper-slide  display"
					style="width: 360px; margin-left: 5px;">
					<a href="view.do?name=다대포 해수욕장"><img
						style="width: 360px; height: 250px;" src="./allist/27.jpg"></a>
				</div>
				<div class="swiper-slide  display"
					style="width: 360px; margin-left: 5px;">
					<a href="view.do?name=제주올레길 투어"><img
						style="width: 360px; height: 250px;" src="./allist/35.jpg"></a>
				</div>
				<div class="swiper-slide  display"
					style="width: 360px; margin-left: 5px;">
					<a href="view.do?name=태종대유원지 투어"><img
						style="width: 360px; height: 250px;" src="./allist/29.jpg"></a>
				</div>
				<div class="swiper-slide  display"
					style="width: 360px; margin-left: 5px;">
					<a href="view.do?name=삼성라이온즈파크 투어"><img
						style="width: 360px; height: 250px;" src="./allist/38.jpg"></a>
				</div>
				<div class="swiper-slide  display"
					style="width: 360px; margin-left: 5px;">
					<a href="view.do?name=한라산 등산"><img
						style="width: 360px; height: 250px;" src="./allist/9.jpg"></a>
				</div>
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-next ">
				<img src=" ./pic/Rpointer2.png" />
			</div>
			<div class="swiper-button-prev ">
				<img src=" ./pic/Lpointer2.png" />
			</div>
		</div>
	</div>
	<!-- ======================================================== -->

	<div class="Dcontainer2 ">
		<br class="br mt-2">
		<div class="m-4 titleFont tway1">
			📍<span id="spanname2" class="titleFont tway1"></span> ${stv.name }위치
		</div>
		<div class="m-4" id="map" style="width: 90%; height: 350px;"></div>
	</div>

	<div class="row  displayco Dcontainer2 ">
		<br class="br">
		<div class="m-4 titleFont tway1">상세 보기</div>
		<img src=" ./pic/ex1.jpg" />
	</div>

	<div class="Dcontainer2 displaycol mt-3 ">
		<div class="m-4 titleFont2 tway1">Review✏️</div>
		<div class="m-2 p-2 " style="width: 90%;">
			<c:forEach var="review" items="${reviews}">
				<div class="mt-3 mb-3 review ">
					<div class="displayb m-2">
						<div class="displays ml-3">
							<img src="./pic/test1.jpg" class="imgradius3">
							<div style="font-weight: bold; font-size: 18px">${review.tid}</div>
						</div>
						<div class="cgray mr-5">${review.writedate}</div>
						<div style="display: none;" class="cgray mr-5">${review.articleNO}</div>
					</div>

					<div class="m-3  ">
						<c:forEach begin="1" end="${review.jum}">
							<img src="./pic/3.png" class="imgradius2">
						</c:forEach>
						(${review.jum})
					</div>


					<div class="mb-3 displays">
						<img src="./pic/${review.imgFileName}" class="imgradius4">
						<div style="margin-left: 10px;">${review.rcontent}</div>
					</div>


					<div class="mt-4">
						<div class="btn02">
							<img class="imgradius5" src="./pic/coin.png">
							&nbsp;&nbsp;가격은 ${review.hp}!
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img class="imgradius5"
								src="./pic/case.png"> &nbsp;&nbsp;여행은 ${review.ht}!
						</div>
					</div>

					<!--durl  -->


					<c:forEach var="reply" items="${review.replies}">
						<div class="review1 " style="margin: 10px 10px 5px 90px;">
							<div style="color: lightgray; font-size: 14px">
								${reply.tid} :</div>
							<br>
							<div class="textarea1 ">${reply.content}</div>
							<div class="  displaye">

								<%--  <div style="color:lightgray; font-size:14px"  > ${reply.articleNo} </div>     --%>
								<%--     <div style="color:lightgray; font-size:14px"  >  ${reply.rwritedate}</div>     --%>
							</div>


							<%
								if (sid != null) {
							%>
							<form action="delete.ro">
								<input type="hidden" name="articleNo"
									value="${review.articleNO}"> <input type="hidden"
									name="soo" value="${stv.soo}"> <input type="hidden"
									name="date" value="${reply.rwritedate}"> <input
									type="hidden" name="name" value="${stv.name}"> <input
									type="submit"
									style="background-color: transparent; color: gray; border: none; padding: 0; cursor: pointer;"
									value="[삭제]">
							</form>
							<%
								}
							%>

						</div>
					</c:forEach>
					<!--  -->
					<%
						if (sid != null) {
					%>

					<form class="mt-3 displays " style="margin: 10px 2px 5px 70px;"
						name="insertForm" action="insert.ro">
						<textarea class="textarea2 " id="content" name="content"
							placeholder="해당 리뷰가 도움이 되었다면 따뜻한 의견을 남겨주세요."></textarea>
						&nbsp;&nbsp;&nbsp; <input type="hidden" name="articleNo"
							value="${review.articleNO}"> <input type="hidden"
							name="s_id" value="${sid}"> <input type="hidden"
							name="soo" value="${stv.soo}"> <input type="hidden"
							name="name" value="${stv.name}"> <input type="submit"
							class="btn btn-success" value="의견 달기">
					</form>
					<%
						}
					%>
				</div>

			</c:forEach>

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
							<input class="menu-item" type="submit" value="상품 전체 보기">
							<input type="hidden" name="pageNumber" value="1" />
							<!-- 페이징! -->
						</form>

						<form id="myForm" action="JejuListInfo.do" method="post">
							<input class="menu-item" type="submit" value="제주여행">
						</form>

						<form id="myForm" action="SeoulListInfo.do" method="post">
							<input class="menu-item" type="submit" value="서울여행">
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Category</div>
						<form id="myForm" action="BusanListInfo.do" method="post">
							<input class="menu-item" type="submit" value="부산 여행">
						</form>
						<form id="myForm" action="DaejunListInfo.do" method="post">
							<input class="menu-item" type="submit" value="대전 여행">
						</form>

						<form id="myForm" action="DaegooListInfo.do" method="post">
							<input class="menu-item" type="submit" value="대구 여행">
						</form>
					</div>


					<div class="column">
						<div class="sub-title">Customer Service</div>
						<div class="menu-item-1">운영시간: 09:00~18:00</div>
						<div class="menu-item-1">Tel: 02-1234-5667</div>

					</div>
				</div>
				<div class="second-box">
					<div class="icon-box">
						<img class="icon" src="./pic/00_insta.png" width=30px height=24px>
					</div>
					<div class="icon-box">
						<img class="icon" src="./pic/00_twiter.png" width=30px height=24px>
					</div>
					<div class="icon-box">
						<img class="icon" src="./pic/00_face.png" width=30px height=24px>
					</div>
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous">
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<script>
		function formatNumber(num) {
			return new Intl.NumberFormat('ko-KR').format(num);
		}
		var priceElement = document.getElementById('price');
		var price = parseFloat(priceElement.value); // 문자열을 숫자로 변환
		var realprice = document.getElementById('realprice');
		realprice.value = formatNumber(price) + "원";

		document.addEventListener("DOMContentLoaded", function() {
			var swiper = new Swiper(".mySwiper", {
				slidesPerView : 1,
				centeredSlides : false,
				slidesPerGroupSkip : 1,
				grabCursor : true,
				keyboard : {
					enabled : true,
				},
				breakpoints : {
					769 : {
						slidesPerView : 3,
						slidesPerGroup : 2,
					},
				},
				scrollbar : {
					el : ".swiper-scrollbar",
				},
				navigation : {
					nextEl : ".swiper-button-next",
					prevEl : ".swiper-button-prev",
				},
				pagination : {
					el : ".swiper-pagination",
					clickable : true,
				},
			});
		});
	</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dddf6d5373373b1943e071a19d860b49">
		
	</script>
	<script>
		var xdo = $
		{
			stv.xdo
		};
		var ydo = $
		{
			stv.ydo
		};
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(xdo, ydo),
			level : 4
		// 지도의 확대 레벨(작을수록 확대됨)
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치
		var markerPosition = new kakao.maps.LatLng(xdo, ydo);

		// 마커 생성
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">도착지입니다. <br>'
				+ '<a href="https://map.kakao.com/link/map/도착지입니다.,' + xdo + ',' + ydo + '" style="color:blue" target="_blank">큰지도보기 </a>'
				+ '<a href="https://map.kakao.com/link/to/도착지입니다.,' + xdo + ',' + ydo + '" style="color:blue" target="_blank"> 길찾기</a></div>';
		// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능
		iwPosition = new kakao.maps.LatLng(xdo, ydo); //인포윈도우 표시 위치

		// 인포윈도우를 생성
		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시함 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시
		infowindow.open(map, marker);
	</script>

	<script>
		function decreaseQuantity() {
			var quantityInput = document.getElementById('i_cnt');
			var currentQuantity = parseInt(quantityInput.value, 10);
			if (currentQuantity > 1) {
				quantityInput.value = currentQuantity - 1;
				setQuantity(); // 감소할 때마다 업데이트
			}
		}

		function increaseQuantity() {
			var quantityInput = document.getElementById('i_cnt');
			var currentQuantity = parseInt(quantityInput.value, 10);
			quantityInput.value = currentQuantity + 1;
			setQuantity(); // 증가할 때마다 업데이트
		}

		function setQuantity() {
			// 동적으로 현재 수량 값을 hidden field에 설정
			var quantityInput = document.getElementById('i_cnt').value;
			var hiddenCntInput = document.getElementById('hiddenCnt');
			var hiddenCntInput1 = document.getElementById('hiddenCnt1');
			hiddenCntInput.value = quantityInput;
			hiddenCntInput1.value = quantityInput;
		}

		function setDate() {
			// 선택된 날짜 가져오기
			var selectedDateInput = document.getElementById('Ddate');
			var selectedDate = selectedDateInput.value;

			// "미사용"이 아닌 경우에만 값을 설정
			if (selectedDate !== "미사용") {
				// 원하는 input 엘리먼트에 값을 설정
				var hiddenDateInput = document.getElementById('hiddenDate');
				hiddenDateInput.value = selectedDate;

			}
		}

		function addToCart() {

			var memberId =
	<%=sid%>
		;

			// 만약 memberId가 null이라면 로그인 창으로 이동
			if (memberId === null || memberId === "") {
				alert('로그인 후 이용하실 수 있습니다.\n확인 버튼을 누르면 로그인 창으로 이동합니다.');
				window.location.href = '01_Login.jsp';
				return false;
			}

			// 현재 수량 값 불러오기
			var quantityInput = document.getElementById('i_cnt');
			var quantityValue = quantityInput.value;

			// 상품명 값 불러오기
			var productNameInput = document.getElementsByName('name')[0];
			var productName = productNameInput.value;

			// 가격 값 불러오기
			var productPriceInput = document.getElementsByName('price')[0];
			var productPrice = productPriceInput.value;

			// 상품번호 불러오기
			var productNumInput = document.getElementsByName('soo')[0];
			var productNum = productNumInput.value;

			// 아이디 불러오기
			var member = document.getElementsByName('t_id')[0];
			var memberId = member.value;

			// form1에 위 값을 설정
			var form1 = document.forms['form1'];
			form1.elements['t_id'].value = memberId;
			form1.elements['i_cnt'].value = quantityValue;
			form1.elements['name'].value = productName;
			form1.elements['price'].value = productPrice;
			form1.elements['soo'].value = productNum;

			// form1을 submit하여 add.jsp로 이동
			form1.submit();

			// 수량 값을 활용하여 다양한 작업 수행 가능
			alert('장바구니에 담았습니다.!');

			return false;
		}

		function gopay() {
			var memberId =
	<%=sid%>
		;

			// 만약 memberId가 null이라면 로그인 창으로 이동/* 
			if (memberId === null || memberId === "") {
				alert('로그인 후 이용하실 수 있습니다.\n확인 버튼을 누르면 로그인 창으로 이동합니다.');
				window.location.href = '01_Login.jsp';
				document.getElementById("form2").action = "01_Login.jsp";
				return false;
			}

			var quantityInput = document.getElementById('i_cnt');
			var quantityValue = quantityInput.value;

			// 상품명 값 불러오기
			var productNameInput = document.getElementsByName('productName')[0];
			var productName = productNameInput.value;

			// 가격 값 불러오기
			var productPriceInput = document.getElementsByName('productPrice')[0];
			var productPrice = productPriceInput.value;

			// 가격 값 불러오기
			var productSooInput = document.getElementsByName('productSoo')[0];
			var productSoo = productSooInput.value;

			// 날짜 가져오기
			var selectedDate = document.getElementById('Ddate').value;
			var hiddenDateInput = document.getElementById('hiddenDate');
			hiddenDateInput.value = selectedDate;

			// 지역 가져오기
			var productAreaInput = document.getElementsByName('productArea')[0];
			var productArea = productAreaInput.value;

			// form2에 값을 설정
			var form2 = document.forms['form2'];
			form2.elements['i_cnt'].value = quantityValue;
			form2.elements['productName'].value = productName;
			form2.elements['productPrice'].value = productPrice;
			form2.elements['productArea'].value = productArea;
			form2.elements['productSoo'].value = productSoo;
			form2.elements['selectedDate'].value = selectedDate;

			// form2를 submit하여 05_confirm.jsp로 이동
			form2.submit();
			// 수량 값을 활용하여 다양한 작업 수행 가능
			alert('구매 확인 창으로 이동합니다.');
			window.location.href = '05_confirm.jsp';
		}
	</script>

</body>
</html>