<%@page import="dao.Dao"%>
<%@page import="vo.VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<!-- ======================================================== -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<!-- ======================================================== -->
<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/footer.css">
<link rel="stylesheet" href="./style/1MyList.css">

<!-- ======================================================== -->
<meta charset="UTF-8">
<title>여기,좋은데: 장바구니</title>

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
        Dao cartDAO = new Dao();

        try { List<VO> ciarray = cartDAO.CartShow(sid);
    %>
	
	<!-- ======================================================= -->
	<%if(sid==null){%>

	<nav class=" navbar navbar-expand-lg bg-body-tertiary ">
		<div class="container-fluid d-inline-flex ">

	
			<a class="navbar-brand mg-l" href="00_main.jsp"> <img
				src="./pic/logo4.png" width="140px" height="58px"></a>

			<div class="">
				<div>
					<button class="navbar-toggler" type="button"  data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
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
	
	<div class="displayco  lnfo2" style=" margin : 250px 0px;">
	<div>로그인 후 이용 하실 수 있습니다.<br></div>	
	<a href="01_Login.jsp" class="mt-2"><input class="Lobox mt-3" type="button" value="로그인하러 가기"></a>
	</div>
	<%}else{%>
	
	<!-- ======================================================= -->
	
	<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
		<div class="container-fluid d-inline-flex ">
			<a class="navbar-brand mg-l" href="00_main.jsp"> <img src="./pic/logo4.png" width="140px" height="58px"></a>
				<div class="mg-r ">
					<button class="navbar-toggler " type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" 	aria-controls="navbarNavDropdown" aria-expanded="false"
						aria-label="Toggle navigation">	<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<form action="SelectArea.do "class="d-flex   mg " role="search">
							<input class="form-control "placeholder="여행지를 검색하세요" type="search"  name = "area" style= "height:40px; margin-right:10px;"> 
							<input type="hidden" name="pageNumber" value="1" /> <!-- 페이징! -->	
							<button type="submit" class="btn btn-success " 	style="width:150px; height:40px;" >검색</button>
						</form>	
					<ul class="navbar-nav">
						<li class="nav-item mg"><a class="nav-link active" aria-current="page" href="logout">로그아웃</a></li>
						
					</ul>
				</div>
				</div>
		</div>
	</nav>
	<!--================================================ -->
	<div class="row REcontainer">

		<div class="col-3 ">
			<div class="titleRE"></div>
			<div class="list-group " style="max-width: 350px;">
			    <div class="list-group-item list-group-item-action tway1" style="font-size:30px; font-weight:bold;">My Page</div> 
				<a href="getMyInfo.do" class="list-group-item list-group-item-action" style="height: 60px">내 정보</a> 
				<a href="PaySearch.do" class="list-group-item list-group-item-action" style="height: 60px">예약 내역</a>
				<a href="02_jangbaguni.jsp" class="list-group-item list-group-item-success active" aria-current="true" style="height: 60px">장바 구니 </a> 
				<a href="02_jjim.jsp" class="list-group-item list-group-item-action" style="height: 60px">찜 목록</a>
				<a href="ReviewSearch.do" class="list-group-item list-group-item-action" style="height: 60px">리뷰</a>
			</div>
		</div>


		<div class="col-9 ">			
					<div class="titleRE tway1 ">Cart</div>
							
			<div class="displaye " style= "width:100%;">		
				<form action="delete.do" style="margin-right:12px;">
					<input type="submit"  class="btn btn-dark" value="장바구니 비우기" >
				</form>							
			    <form  action="02_selectdel.jsp" onsubmit="goDelete(); return false;"> 						
                		<input type="submit"  class="btn btn-dark" value="선택 상품 삭제">
                </form>               
            </div> 
               	
 				
				<form class=" m-3 displayco  small" action="05_Multiconfirm.jsp" name="form" method="post" id="multidelete" >
				 <input type="hidden" name="selectedItems" id="selectedItems" value="">
				<table class="table1" style="text-align: left;">
					<thead>
						<tr style="font-size: 18px;" >
							<th scope="col">							
								<input type="checkbox" id="all" class="form-check-input custom-checkbox" onclick="selectAllCheck(this.checked); itemSum(this);"> 															
							</th>
							<th scope="col">번호</th>
							<th scope="col">이미지</th>
							<th scope="col" >상품명</th>
							<th scope="col" >수량</th>
							<th scope="col">가격</th>
							<th scope="col">총 금액</th>
						</tr>
					</thead>
					<tbody>
					
					 <% if (ciarray.isEmpty()) {%>
					 	<tr>
        	  			<td colspan=6> <div>장바구니가 비어 있습니다.</div> </td>
        	  		    </tr>
						<% } else { 	
							int sum = 0;	//총 금액을 위한 변수
							int t_cnt = 0;	//총 갯수를 위한 변수
							int order = 1;
						
                         	 for (VO cart : ciarray) {                          	 
                         		/*  sum += cart.getI_cnt() * cart.getPrice();
                         		 t_cnt += cart.getI_cnt(); */
                        %>
						<tr style="font-size: 18px;">
   							 <td>
       					 		<input type="checkbox" data-price="<%= cart.getI_cnt() * cart.getPrice() %>" value="<%= cart.getSoo() %>" class="form-check-input custom-checkbox" name="chkbox" onClick="itemSum(this.form);">
    						</td>    
   							 <td style="width: 70px;"> 
       						 	<input type="hidden" name="soo1" value="<%= cart.getSoo() %>">
       						 	<div><%=order++ %> </div>
   			 				</td>  			 					
        						<td scope="col" style=" vertical-align: middle;">
        							<img src="./allist/<%= cart.getSoo() %>.jpg" class="Rphoto">
        						</td>
    						<td>
        						<a href="view.do?name=<%= cart.getName() %>"><%= cart.getName() %></a>
        						<input type="hidden" name="name" value="<%= cart.getName() %>">
    						</td>
    					<td>
        					<%= cart.getI_cnt() %>
        					<input type="hidden" name="cnt" value="<%= cart.getI_cnt() %>">
    					</td>
    					<td>
        					<%= df.format(cart.getPrice()) %>원
        					<input type="hidden" name="price" value="<%= cart.getPrice() %>">
    					</td>
    					<td> 
       			 			<%= df.format(cart.getI_cnt() * cart.getPrice()) %>원
        				<input type="hidden" name="totalprice" value="<%= cart.getI_cnt() * cart.getPrice() %>">
    					</td>
						</tr>
				
						<%
   							 }}
						%>
						
						
						<tr align="right" style="font-size:23px;">
    					<th colspan=4> <div class="tway1" style="text-align:right;">총 &nbsp;&nbsp; <input name="total_sum" style="border:none;"class="tway1" type="text" size="20" readonly></div></th>   															
   						<th colspan=3><input type="hidden" name="selectedItems" id="selectedItems" value="">
   							<button type="submit" id="cnt2" class="btn btn-dark" style="width: 170px; height: 53px;" onclick="purchase()">구매하기</button>
   						</th>
   									
                            </tbody>
                             </table>
                			 </form>   
                			 		
			</div>
			 </div>
			 
			 
			  <%}%>
			  <%} catch (SQLException e) {
                    out.println("SQLException: " + e.getMessage());
                    e.printStackTrace();
                }
            %> 
            
   		
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
	
	
	<!-- ========================================================== -->
	<script>
	
	//전체 체크 함수
	 function selectAllCheck(checked) {
    var checkboxes = document.getElementsByName("chkbox");
    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = checked;
    } 
    itemSum(document.form);
    
	}
	
	 function formatNumber(num) {
		    return new Intl.NumberFormat('ko-KR').format(num);
		}
		
	 
	function itemSum(frm){
	   
		var checkboxes = frm.chkbox;
	    var selectedCount = 0;
	    var sum = [];
	    
	    for (var i = 0; i < checkboxes.length; i++) {
	        if (checkboxes[i].checked) {
	            selectedCount++;	            
	            sum.push(parseFloat(checkboxes[i].getAttribute('data-price')));
	        }
	    }
	  
	   frm.total_sum.value = formatNumber(sum.reduce((acc, price) => acc + price, 0)) + "원";
	   cnt2.innerText = "구매개수 (" + selectedCount + ")"
	

	}	
	
</script>

<script>
// 선택 삭제 함수
function goDelete() {
	
	 document.getElementById("multidelete").action = "02_selectdel.jsp";
		document.getElementById("multidelete").submit();
	
	}
	



function purchase() {
	  // name이 "chkbox"인 모든 체크박스 가져오기
	  var checkboxes = document.getElementsByName("chkbox");
	  var selectedItems = [];

	  for (var i = 0; i < checkboxes.length; i++) {
		   if (checkboxes[i].checked) {
		      var tr = checkboxes[i].closest('tr');
		      var soo = tr.querySelector('[name="soo1"]').value;
		      var name = tr.querySelector('[name="name"]').value;
		      var cnt = tr.querySelector('[name="cnt"]').value;
		      var price = tr.querySelector('[name="price"]').value;	      
		      var totalprice = tr.querySelector('[name="totalprice"]').value;

		      selectedItems.push({ soo: soo, price: price, cnt: cnt, name: name, totalprice: totalprice });
		   }
		}

		
	  // 배열을 JSON 문자열로 변환하고 hidden 입력의 값으로 설정
	  document.getElementById("selectedItems").value = JSON.stringify(selectedItems);
	  console.log("선택된 항목들:", selectedItems);

	  // 폼 제출
	  document.getElementById("multidelete").action = "05_Multiconfirm.jsp";
	  document.getElementById("multidelete").submit();
	}


	</script>


	<script src="./script/Allist.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" 	crossorigin="anonymous"></script>

	<!-- ---------------------------------------------------------------------- -->

</body>
</html>