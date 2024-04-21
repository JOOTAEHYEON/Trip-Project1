
<%@page import="vo.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰:내가쓴글</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- ======================================================== -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ================= -->
<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/2popup.css">
<!-- ----------------------------------- -->

<!-- ----------------------------------- -->
</head>
<body class="displayco">
<%
response.setHeader("pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.addHeader("Cache-Control", "no-store");    // 일부파이어폭스버그관련
response.setDateHeader("Expires", 1L);              //응답결과의만료일지정

request.setCharacterEncoding("utf-8");
String sid =(String)session.getAttribute("sid");
 String soo = request.getParameter("soo");
 String name = request.getParameter("name");

 VO stv = (VO) session.getAttribute("stv");
%>
	
	
<div class="tway1" style="font-size:43px; text-align:center;"> Review </div>	

<% if(stv == null || stv.getWritedate() == null) {%>
	<script type="text/javascript"> 
	 alert("먼저 리뷰를 작성해주세요.");
	 window.location.href = "ReviewSearch.do"; 
	 </script>
	<% } else {%> 


	<div class="m-2 p-4" style="width:500px; border:1px solid  #3CB371; border-radius:4px;"> <!--  제일 큰 박스  -->
			<div class=" displayb mb-4 ">
				<div class="displays">
				<img src ="./allist/${stv.soo}.jpg" class="imgradius mr-3" style="width:60px; height:60px;">	
				<div class="displaypop2 ">
					<div class="Poptext3 tway1 ">[${stv.area}] </div>
					<div class="Poptext tway1  displayco">${stv.name }</div>
				</div>
				</div>
										
			</div>
<br>

<div class=" mt-3 mb-1 displayb">
		<div class="displays mb-2">		
			<img src ="./pic/test1.jpg" class="imgradius" style="width:40px; height:40px; border-radius:6px;" >
			<div class="ml-1 p-3  displayco" style="font-weight:bold;  font-size:18px; height:40px;"> ${stv.tid}</div>
		</div>
		<div class="cgray displayco  mb-2" style="height:40px; ">${stv.writedate}</div>
</div>
	<div class="mb-3">
 <c:forEach begin="1" end="${stv.jum}" > 
    		<img src="./pic/3.png" style="width:20px; height:20px;">	
 </c:forEach> <span class="Poptext2" id="feedbackText" style="font-size:12px;"></span>
    </div>
    <div class="mb-3"><img src ="./pic/${stv.imgFileName}" class="imgradius4"></div>
    <div style="color:gray;"> ${stv.rcontent}	</div>
    <div class="mt-4 displays ">	   			
			<div class="btn02" > <img class="imgradius5" src="./pic/coin.png"> &nbsp;&nbsp;가격은 ${stv.hp}!  
				&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;   
			<img class="imgradius5" src="./pic/case.png"> &nbsp;&nbsp;여행은 ${stv.ht }!   
			</div>			
	</div>
		</div>
		<div class="displaye mt-5">
	<form action="delete_review.do" class="p-2">
		<input type="submit"class="button mr-2" style="background-color: transparent; border:none;"  value="[삭제하기]">
	</form>	
		<form action="05_reviewpopup3.jsp" class="p-2">
		<input type="hidden" name="soo" value="${stv.soo}">
		<input type="hidden" name="date" value="${stv.writedate}">
		<input type="hidden" name="name" value="${stv.name}">
		<input type="submit" class="button ml-2"  style="background-color: transparent; border:none;"value="[다시쓰기]">
		</form>		
	
</div>
<%} %>


<script>
    var text = '';
    <c:choose>
        <c:when test="${stv.jum eq 1}">
            text = '별로에요😡';
        </c:when>
        <c:when test="${stv.jum eq 2}">
            text = '그저그래요😞';
        </c:when>
        <c:when test="${stv.jum eq 3}">
            text = '보통이에요🙂';
        </c:when>
        <c:when test="${stv.jum eq 4}">
            text = '아주좋아요😊️️';
        </c:when>
        <c:when test="${stv.jum eq 5}">
            text = '정말 최고에요😍';
        </c:when>
        <c:otherwise>
            text = '';
        </c:otherwise>
    </c:choose>
    document.getElementById('feedbackText').innerText = text;
</script>



	
	
</body>
</html>