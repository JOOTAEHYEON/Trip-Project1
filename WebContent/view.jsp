<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 백단위 표시 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 백단위 표시-end -->


<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>

<!-- 파비콘 -->
<link rel="icon" href="./pic/favicon.png"/> 
<link rel="apple-touch-icon" href="./pic/favicon.png"/> 
<!-- 파비콘-end -->
<meta charset="UTF-8">
<title>선택상품 세부내역</title>
</head>
<body>
<!-- cash 값 -->
<%
   response.setHeader("pragma", "No-cache");  
   //HTTP 1.0에서 사용되는 헤더로, 캐시를 사용하지 말라는 지시
   response.setHeader("Cache-Control", "no-cache");  
   // no-cache 값은 캐시를 사용하지 말라는 지시
   response.addHeader("Cache-Control", "no-store");    
   // no-store 값은 브라우저가 어떠한 정보도 캐시하지 말라는 지시
   response.setDateHeader("Expires", 1L);              
   //브라우저가 해당 응답을 즉시 만료시키게
   
    request.setCharacterEncoding("utf-8");
   
	String sid =(String)session.getAttribute("sid");
	
	ArrayList<String> list = (ArrayList<String>) session.getAttribute("zzimList");
		if (list == null) {
			list = new ArrayList<String>();
		}
		session.setAttribute("itemList", list);
%>
<!-- cash-end -->
		<h1> ${stv.name} - 상품 세부내역 입니다 </h1>
		<table border = 1>
		<tr>
			<th> 상품사진 </th>
			<th> 지역 </th>
			<th> 상품명 </th>
			<th> 가격 </th>
			<th> 수량 </th>
			<th colspan=3> 구매 </th>
		</tr>
		<tr>
			<td><img src="./image/see.jpg" width=400 height=300></td>
			<td>${stv.area}</td>
			<td>${stv.name}</td>
			<td><fmt:formatNumber value="${stv.price}"/>원</td>
			<td><input type="text" name="i_cnt" id="i_cnt" size="3" maxlength="3" value="1">개</td>
			<td>
				<form name="form1" id="form1" method="get" action="addToCart.co" onsubmit="return addToCart()">
            	<!-- 상품명, 가격, 수량을 hidden input으로 추가 -->
            		<input type="hidden" name="t_id" value="${sid}">
            		<input type="hidden" name="soo" value="${stv.soo}">
            		<input type="hidden" name="name" value="${stv.name}">
            		<input type="hidden" name="price" value="${stv.price}">
            		<input type="hidden" name="i_cnt" id="hiddenCnt" value="1">
            		<input type="submit" value="장바구니">
        		</form>
			</td>
			<td>
				<form name="zzim" id="zzim" action="Wishlist.co" onsubmit="like()">
					<input type="hidden" name="soo" value="${stv.soo}">
					<input type="hidden" name="area" value="${stv.area}">
            		<input type="hidden" name="name" value="${stv.name}">
            		<input type="hidden" name="price" value="${stv.price}">
					<input type="submit" value="찜하기">
				</form>
			</td>
			<td>
		 		<button type="button">구매하기</button>
			</td>
		</tr>
		</table>
		<h2>위치</h2>
		<hr>
<!-- 지도 API -->
	<div id="map" style="width:100%;height:350px;"></div>
	
<!-- ///// 상품 리뷰 ///// -->	
	<hr>
	<h2>상품 리뷰</h2>	
	
	<div class = "container">
		<table border="1" width="70%" height="200px">
			<tr align="center">
				<th>글번호</th>
    			<th>리뷰 내용</th>
    			<th>글쓴이</th>
    			<th>작성일자</th>
    			<th colspan=3>작성</th>
    		</tr>
    		<c:forEach var="review" items="${reviews}">
    		<tr>
    			<td>${review.articleNO}</td>
    			<td>${review.rcontent}</td>
    			<td>${review.tid}</td>
    			<td>${review.writedate}</td>
    			
    			<!-- 로그인을 했을때만, 댓글 입력과 삭제가 보이게 -->
    			<%if(sid!=null){ %>
    			
    			<td>
    				<form name="insertForm" action="insert.ro">
					<textarea id="content" name="content" placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
    				<input type="hidden" name="articleNo" value="${review.articleNo}">
    				<input type="hidden" name="s_id" value="${sid}">
    				<input type="hidden" name="soo" value="${stv.soo}">
                    <input type="submit" value="댓글쓰기">
                   	</form>
                   	
                   	
                   	
               	</td>
                <td>
    				<form action="delete.ro">
                        <input type="submit" value="삭제하기">
                        <input type="hidden" name="articleNo" value="${review.articleNo}">
    					<input type="hidden" name="soo" value="${stv.soo}">
    					<input type="hidden" name="date" value="${reply.rwritedate}">
                    </form>
                </td>
               	
               	<%} %>                
    		
    		</tr>
    			<c:forEach var="reply" items="${review.replies}">
    			<tr>
    				<td>${reply.articleNo}</td>
    				<td>${reply.content}</td>
    				<td>${reply.tid}</td>
    				<td>${reply.rwritedate}</td>
    				
    				<!-- 로그인을 했을때만, 댓글 입력과 삭제가 보이게 -->
    				<%if(sid!=null){ %>
    				
    				<td>
    					<form name="insertForm" action="insert.ro">
						<textarea id="content" name="content" placeholder="여러분의 소중한 댓글을 입력해주세요."></textarea>
    					<input type="hidden" name="articleNo" value="${review.articleNo}">	
    					<input type="hidden" name="soo" value="${stv.soo}">
                        <input type="submit" value="댓글쓰기">
                    	</form>
                	</td>
                	<td>
    					<form action="delete.ro">
                        	<input type="submit" value="삭제하기">
                        	<input type="hidden" name="articleNo" value="${review.articleNo}">
    						<input type="hidden" name="soo" value="${stv.soo}">
    						<input type="hidden" name="date" value="${reply.rwritedate}">
                    	</form>
                	</td>
                	
                	<%} %>
				
				</tr>
				</c:forEach>
			</c:forEach>
		</table>
	</div>

<!-- ///// 리뷰 부분 끝 ///// -->
	<hr>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043b1203be4bf2d5fa64506559f75ee2"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    		mapOption = { 
        					center: new kakao.maps.LatLng(${stv.xdo}, ${stv.ydo}),
        					level: 4 // 지도의 확대 레벨(작을수록 확대됨)
    		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치
		var markerPosition  = new kakao.maps.LatLng(${stv.xdo}, ${stv.ydo}); 

		// 마커 생성
		var marker = new kakao.maps.Marker({
    		position: markerPosition
			});

		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">도착지입니다. <br><a href="https://map.kakao.com/link/map/도착지입니다.,{$stv.xdo}, {$stv.ydo}" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/도착지입니다.,{$stv.xdo}, {$stv.ydo}" style="color:blue" target="_blank">길찾기</a></div>',
			// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능
    		iwPosition = new kakao.maps.LatLng(${stv.xdo}, ${stv.ydo}); //인포윈도우 표시 위치

		// 인포윈도우를 생성
		var infowindow = new kakao.maps.InfoWindow({
    		position : iwPosition, 
    		content : iwContent 
			});
  
		// 마커 위에 인포윈도우를 표시함 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시
		infowindow.open(map, marker);
<!--  지도 API-end  -->

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
	        var hiddenCntInput = document.getElementById('hiddenCnt');
	        var quantityInput = document.getElementById('i_cnt');
	        hiddenCntInput.value = quantityInput.value;
	    }
		
	    function addToCart() {
	    		
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
	    
	    function like() {
	    	alert('찜 목록에 담았습니다.');
	    }
	    
	</script>

</body>
</html>