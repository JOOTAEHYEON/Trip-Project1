<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- ======================================================== -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- ======================================================== -->
<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/footer.css">
<link rel="stylesheet" href="./style/1login.css">
<!-- ======================================================== -->
<meta charset="UTF-8">
<title>여기,좋은데: 로그인</title>

</head>
<body>
	<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store"); // 일부파이어폭스버그관련
	response.setDateHeader("Expires", 1L); //응답결과의만료일지정
	%>
	<!-- ======================================================= -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top ">
		<div class="container-fluid d-inline-flex ">
			<a class="navbar-brand mg-l" href="00_main.jsp"> <img
				src="./pic/logo4.png" width="140px" height="58px"></a>
		</div>
	</nav>


	<!-- ---------------------------------------------------------------------- -->

	<div class="Lcontainer">
	<h2 class="mid tway1">Login</h2>

	<form class="Lcontainer2 " action="Login" method="post" align="center">
		<table>
			<tr >
				<td><input class="Ltext " type="text" name="tid" required autofocus placeholder="ID"></td>
			</tr>

			<tr>
				<td><input class="Ltext " type="password" name="pw" required
					placeholder="password"></td>
			</tr>

		</table>

		<div class="display Loboxm nannum">
			<a href="01_IdFind.jsp"> 아이디 | 비밀번호 찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="01_userInsertForm.jsp"> 회원가입 </a>
		</div>

		<div class="display Loboxm ">
			<input class="Lobox " type="submit" value="Login">
		</div>

	</form>
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
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

	<!-- ---------------------------------------------------------------------- -->

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>