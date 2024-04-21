<%@page import="java.text.DecimalFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.VO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.json.simple.JSONArray" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>

<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/1confirm.css">
<link rel="stylesheet" href="./style/footer.css">
<meta charset="UTF-8">
<title>여기,좋은데 : 결제 예정 내역 </title>
</head>
<body>
   <!-- ====================================================== -->
   <!-- ======================================================== -->
<%
	response.setHeader("pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.addHeader("Cache-Control", "no-store");    
	response.setDateHeader("Expires", 1L);              
	DecimalFormat df = new DecimalFormat("###,###");
	
	request.setCharacterEncoding("utf-8");
	String sid =(String)session.getAttribute("sid");
	Integer mileage = (Integer) session.getAttribute("mileage");
	   if (mileage == null) {
	       mileage = 0; 
	   }
	
	%>

	<%if(sid==null){%>
	
	
 
	<nav class=" navbar navbar-expand-lg bg-body-tertiary ">
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
							aria-current="page" href="01_Login.jsp">로그인</a></li>
						<li class="nav-item mg"><a class="nav-link b"
							href="01_register.jsp">회원가입</a></li>


						
					</ul>
				</div>
			</div>
		</div>
	</nav>
	
	<div class="displayco  lnfo2">
	<div>로그인 후 이용 하실 수 있습니다.<br></div>	
	<a href="01_Login.jsp" class="mt-2"><input class="Lobox mt-3" type="button" value="로그인하러 가기"></a>
	</div>
	<%}else{%>


	<!-- ======================================================= -->
	<nav class=" navbar navbar-expand-lg bg-body-tertiary  ">
		<div class="container-fluid d-inline-flex ">
			<a class="navbar-brand mg-l" href="00_main.jsp"> <img src="./pic/logo4.png" width="140px" height="58px"></a>
				<div class="mg-r ">
					<button class="navbar-toggler " type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"  aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">						
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
	<div class=" row COcontainer displayco">
	
	<div class="col-9" >

	<div class="TitleConfirm tway1"> 구매 전 필수 확인   </div>
	
	<div class="mt-3  displayco  ">
	<div style="width:814px;">	
	<div class="mt-2">
	<div class="SubTitleConfirm tway1"> 결제예정 상품</div>
	<div class="mt-2" style="color:gray">* 수량 및 여행 상품을 다시 확인 부탁드립니다🙏🏻</div>
	<hr>
	
	<%
	 int totprice1 = 0; 
	 int totcnt = 0;
	 String multiM = "";
	 String multiN = "";
	String jsonData = request.getParameter("selectedItems");
	if (jsonData != null && !jsonData.isEmpty()) {
   	 	JSONParser parser = new JSONParser();
   	 	JSONArray jArray = (JSONArray) parser.parse(jsonData);
        List<VO> pInfo = new ArrayList<>(); // pInfo로 !! empty List 생성

        // for문으로 정보 추출하여 List에 추가
        	for (Object obj : jArray) {
            JSONObject jsonObj = (JSONObject) obj;
            String soo1 = (String) jsonObj.get("soo");
            String name = (String) jsonObj.get("name");
            String cnt1 = (String) jsonObj.get("cnt");
            String price1 = (String) jsonObj.get("price");
            String amount = (String) jsonObj.get("totalprice");
			
           int soo = Integer.parseInt(soo1);
           int price = (price1 != null && !price1.isEmpty()) ? Integer.parseInt(price1) : 0;      
           int cnt = (cnt1 != null && !cnt1.isEmpty()) ? Integer.parseInt(cnt1) : 0;      

            // 상품 정보를 VO 객체로 저장
            VO pInfo1 = new VO( soo, name, cnt, price, amount);
            pInfo.add(pInfo1);  
            
            
        }%>
       <%

       for (VO info : pInfo) {
    	 
    	   
    	    out.println("<div class='displays'>");
    	    out.println("<div class='mr-3'><img src='./allist/" + info.getSoo() + ".jpg' width='140px' height='80px'></div>");
    	    out.println("<table border='1' style='border-collapse: collapse; width: 50%;'>");
    	    out.println("<tr>");
    	    
    	    out.println("<td>");
    	    out.println("상품 번호: " + info.getSoo() + "<br>");
    	    out.println("상품명: " + info.getName() + "<br>");
    	    out.println("수량: " + info.getCnt() + "<br>");
    	    out.println("</td>");
    	    
    	    out.println("<td>");
    	    out.println("사용 예정일: 미지정상품 <br>");
    	    out.println("가격: " + df.format(info.getPrice())  + "원 <br>");
    	    out.println("총 금액: <span'>" + df.format(info.getCnt()*info.getPrice())  + " 원 </span><br>");
    	 
    	    out.println("</td>");
    	    
    	    out.println("</tr>");
    	    out.println("</table>");
    	    out.println("</div>");
    	    out.println("<hr>");
		
    	    multiM += info.getSoo()+",";
    	    totcnt += info.getCnt();
    	    totprice1 += info.getCnt() *  info.getPrice();  
    	    multiN += info.getName() + ",";
    	}
       }
    	%>
    	
    	<div class="mt-5">
	<div class="SubTitleConfirm tway1">보유 마일리지</div>
	<hr>
	<div>사용 가능 마일리지: &nbsp;<input class="membox2" type="text" readonly value="<%=mileage%>M"></div>
	<div>사용 희망 마일리지: &nbsp;&nbsp;<input class="membox" id="mileage" type="text" placeholder="사용을 원하는 마일리지를 써주세요" value="0"></div>
	</div>
	
	<div class="mt-5">
	<div class="SubTitleConfirm tway1">여행자 기본 정보</div>
	<div class="mt-2" style="color:gray">*여행 대표자 성함과 연락처를 정확히 입력해주세요 .</div>
	  <hr>
	<hr>
	<table class="mb-4">
	<tr><th>여행자명: </th><td>&nbsp;&nbsp;<input class="membox"  type="text" placeholder="실제 여행자 이름을 써주세요" ></td></tr>
	<tr><th>이메일 : </th><td>&nbsp;&nbsp;<input  class="membox"  type="text" id="email2" placeholder="여행자 이메일" value=""></td></tr>
	<tr><th>연락처 : </th><td>&nbsp;&nbsp;<input  class="membox"  type="text" id="ttel2" placeholder="여행자 휴대전화" value=""></td></tr>
	</table>
	</div>
	
	</div>	
	<div class=" mt-4">
	<div class="SubTitleConfirm tway1">기타 요청 사항</div>
	<hr>
	<textarea  class="Rqbox" placeholder="요청사항이 있으면 기재해주세요"></textarea>
	<div style="color:gray">* 고객님의 요청사항이 전달되나, 간혹 현장 사정에 따라 반영되지 않을 수 있습니다.</div>
	</div>
	</div>
	
	</div>
	
	
	<hr>
	<div class="TitleConfirm2 tway1" style="text-align:left;">결제 정보</div>
	
	<div method="post" class="displayb Tborer">
		<div  style="marig:20px 0px; widht:600px;" class="m-5">
			<div style="marig:20px 0px; height:30px;" > 결제 아이디 : <%=sid %></div>	<div class="tdw" style="display:none;" id="tid"><%=sid%></div>	
			<div style="marig:20px 0px; height:30px;" > 주문 상품 : <%=multiN %><div id="productName" style="display:none;"><%=multiN%></div></div>	
		 	<div id="soo" style="display:none;"><%=multiM%></div>	
			<div style="marig:20px 0px; height:30px;" >주문 수량 :<%=totcnt%> 개 </div> <div style="display:none;" id=t_cnt><%=(totcnt)%> </div>
			<div style="marig:20px 0px; height:30px;" > 주문 금액 : <%=df.format(totprice1) %> 원 <input style="border:none; display:none;" id="amount12" readonly value="<%=totprice1%>"></div> 
			<div style="marig:20px 0px; height:30px;" > 사용 마일리지 : <input style="border:none;" id="realMileage" readonly value=""></div> 
			<div style="marig:20px 0px; height:30px;" > 결제 금액 :<input style="border:none;" id="realtot" readonly value=" <%=df.format(totprice1) %> 원"></div><div style="display:none;" id=realprice><%=totprice1%> </div>
		</div>
		
		
		
		<div class="m-5"><input type="button" class="paybtn tway1" onclick="requestPay()"value="결제하기"></div>

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
	<script src="./script/Allist.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 	crossorigin="anonymous"></script>
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>  
 	<script src="./js/jquery-3.7.1.js"></script>
<script>
function checkM() {

    var userMileage = document.getElementById('mileage').value;
    var availableMileage = parseInt("<%=mileage%>");
    
    // totprice 변수를 선언하고 초기화합니다.
    var totprice = document.getElementById('amount12').value;

    // 경고를 표시할 조건을 확인합니다. 사용자 마일리지가 사용 가능 마일리지보다 크다면 경고를 표시합니다.
    if (parseInt(userMileage) > availableMileage) {
        alert('사용 희망 마일리지는 현재 사용 가능한 마일리지보다 작아야 합니다.');
        document.getElementById('mileage').value = "";
    } else {
        // 사용자가 입력한 마일리지를 realMileage 엘리먼트에 표시합니다.
         var formatter = new Intl.NumberFormat('ko-KR');
        document.getElementById('realMileage').value = formatter.format(userMileage) + "M";
      

        // 결과적인 realtotprice를 계산하여 realtot 엘리먼트에 표시합니다.
        var realtotprice = totprice - parseInt(userMileage);
       
        document.getElementById('realtot').value = formatter.format(realtotprice) + "원";
        document.getElementById('realprice').innerText = realtotprice;
        
    }
}

document.getElementById('mileage').addEventListener('mouseout', checkM);
</script> 
	<script>
	function requestPay() {
	      
		   var IMP = window.IMP; 
		   IMP.init('imp18258351') // 예: 'imp00000000a'
		   
		   var setdate = "미지정상품" + Math.floor(Math.random() * 500);
		   var price = document.getElementById("realprice").innerText;
		   var tid = document.getElementById("tid").innerText;
		   var soo = document.getElementById("soo").innerText;
		   var name = document.getElementById("productName").innerText;
		   var email = document.getElementById("email2").value;
		   var tel = document.getElementById("ttel2").value;
		   var mile = document.getElementById("mileage").value;
		  
		   

		      
		      IMP.request_pay({
		         pg : 'kcp',
		         pay_method : "card",
		         merchant_uid :setdate,		        
		         name : soo,
		         amount : price,
		         buyer_email : email,
		         buyer_name : tid,
		         buyer_tel : tel,
		         buyer_addr : name,
		         buyer_postcode : mile, //주문자 우편번호
		   
		      },


		      
		      
		   function(rsp) {//콜백 함수
		         
		         if (rsp.success) {
		            
		            // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
		            // jQuery로 HTTP 요청
		            
		            console.log(rsp);
		      
		            alert('결제에 성공하였습니다');
		            window.location.href = 'PaySearch.do?tid=tid';
		            
		            jQuery.ajax({
		               url : "http://localhost:8081/000Project/PayInsert.do",
		               //url : "HaevaInsert.do",
		               
		               method : "POST",
		               
		        
		                 data : {
		                   imp_uid : rsp.imp_uid, //결제 고유번호  //포트원 결제모듈에서 결제건별로 고유하게 채번하는 ID
		                   merchant_uid : rsp.merchant_uid, //주문번호 //결제 요청시 가맹점에서 아임포트로 전달한 가맹점 고유 주문번호 
		                   buyer_email : rsp.buyer_email,
		                   name : rsp.name, //상품명   
		                   buyer_tel : rsp.buyer_tel,
		                   amount: price, //상품가격
		                   buyer_name: rsp.buyer_name, //주문자명	                  
			      	       buyer_addr : rsp.buyer_addr,
			      	       buyer_postcode :mile,
		               
		               }  
		               
		            }).done(function(data)  {
		               // 가맹점 서버 결제 API 성공시 로직
		               
		            });
		         } else {
		            alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
		         }
		      });
		   }   
	</script>
	
	
</body>
</html>