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
<title>여기,좋은데:회원가입</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top ">
      <div class="container-fluid d-inline-flex ">


         <a class="navbar-brand mg-l" href="00_main.jsp"> <img
            src="./pic/logo4.png" width="140px" height="58px"></a>

         
      </div>
   </nav>


   <!-- ---------------------------------------------------------------------- -->
   <div class="Rcontainer ">
   <div class="Tre tway1">Register</div>
      <br>
   

<form action="userInsert.do" method="post">
  <table>
      <tr>
        <td class="td0" colspan="2">기본 정보</td>
     </tr>
     <tr>
        <td colspan=2><hr></td>
     </tr>
     
    <tr>
        <td class="td1">아이디 *</td>
        <td>
            <input type="text" name="tid" class="Rtext2 input_id" placeholder="id" required autofocus>
            <span id="checkId" style="font-size: 12px;"></span><br>
        </td>
    </tr>
    <tr>
       <td class="td1">비밀 번호 *</td>
      <td>
          <input type="password"  name="pw" class="Rtext2 input_pw" placeholder="password" required>
          <span id="checkPw" style="font-size: 12px;"></span><br>
      </td>
   </tr>
   <tr>
      <td class="td1">비밀 번호 확인 *</td>
      <td>
          <input type="password" name="pw2" class="Rtext2 input_pw2" placeholder="password" required>
          <span id="checkPw" style="font-size: 12px;"></span><br>
      </td>
   </tr>
    <tr>
      <td class="td1">전화 번호 *</td>
      <td>
          <input type="text" name="ttel" class="Rtext2 input_phone" placeholder="010-2323-3434"   minlength = "11" maxlength = "11" required>
          <span id="checkPhone" style="font-size: 12px;"></span><br>
      </td>               
   </tr>
   <tr>
      <td class="td1">이메일*</td>
      <td>
          <input type="text" name="email" class="Rtext2 input_email" placeholder="a123@abc.com"
          required>
          <span id="checkEmail" style="font-size: 12px;"></span><br>
      </td>
      </tr>
    <tr>
      <td class="td1">주소 *</td>
      <td><input class="Rtext2" type="text" id="sample6_postcode"
      name="adp" placeholder="우편번호" required>
      <input class="btn btn-success" type="button"
      onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></td>
      </tr>
   <tr>
      <td class="td1"></td>
      <td><input class="Rtext" id="sample6_address" type="text"
      name="ad" placeholder="주소" required><br></td>
   </tr>

   <tr>
      <td class="td1"></td>
      <td><input class="Rtext" id="sample6_detailAddress"
      type="text" name="ad1" placeholder="상세주소"><br></td>
   </tr>
            
    <tr>
      <td class="td1">추천인 아이디</td>
      <td><input class="Rtext" type="text" name="rtid"
      placeholder="입력시 마일리지가 지급됩니다."><br></td>
   </tr>
   
   <tr>
      <td class="td1"></td>
      <td><input type="hidden" id="sample6_extraAddress" placeholder="참고항목"><br></td>
   </tr>

  </table>
  <div style="text-align:center; ">
			
				<input class="infobox" type="submit" value=" 회원 가입">
			
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


   <!-- ---------------------------------------------------------------------- -->

   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
      crossorigin="anonymous"></script>
      <script src="./js/jquery-3.7.1.js"></script>
<script>
/* $(document).ready(function () { */
    $('.input_id').focusout(function () {
      let userId = $(this).val();

      $.ajax({
        url: "IdCheck",
        type: "post",
        data: { userId: userId },
        dataType: 'json',
        success: function (result) {
          if (result == 0) {
            $("#checkId").html('사용할 수 없는 아이디입니다.');
            $("#checkId").css('color', 'red');
          } else {
            $("#checkId").html('사용할 수 있는 아이디입니다.');
            $("#checkId").css('color', 'green');
          }

        },
        error: function (e) {
          alert("서버 요청 실패(id)");
        }

      });
    });
/* }); */
$('.input_pw,.input_pw2').focusout(function () {
    
    var password1 = $(".input_pw").val();
    var password2 = $(".input_pw2").val();
         
  
    
     $.ajax({
       url: "pwCheck",
       type: "post",
       data: {
           password1: password1,
           password2: password2
       },
       dataType: 'json',
       success: function (result) {
           if (result == 0) {
               // 비밀번호가 일치하는 경우
               $("#checkPw").html("비밀번호가 일치합니다.").css("color", "green");
           } else {
               // 비밀번호가 일치하지 않는 경우
               $("#checkPw").html("비밀번호가 일치하지 않습니다.").css("color", "red");
           }
       },
       error: function (e) {
         alert("서버 요청 실패(pw)");
       }

     }); 
   });

</script>

<script>
$('.input_phone').on('input', function () {
    let userPhone = $(this).val();
    // 숫자만 남기고 나머지는 제거
    let formattedPhone = userPhone.replace(/[^0-9]/g, '');

    if (formattedPhone.length === 11) {
        formattedPhone = formattedPhone.replace(/^(\d{3})(\d{4})(\d{4})$/, '$1-$2-$3');
    }
    $(this).val(formattedPhone);
}); 
$('.input_phone').focusout(function () {
    let userPhone = $(this).val();
    
    $.ajax({
      url: "PhoneCheck",
      type: "post",
      data: { userPhone: userPhone },
      dataType: 'json',
      success: function (result) {
        if (result == 1 && userPhone.startsWith('010') && userPhone.length === 13) {
            $("#checkPhone").html('사용할 수 있는 전화번호입니다.');
            $("#checkPhone").css('color', 'green');
        } else {
           $("#checkPhone").html('사용할 수 없는 전화번호입니다.');
            $("#checkPhone").css('color', 'red');
        }
      },
      error: function (e) {
        alert("전화번호를 올바르게 입력해주세요.)");
      }
    });
  }); 

</script>
<script>
$('.input_email').on('input', function () {
    let userEmail = $(this).val();
    
    // 간단한 이메일 유효성 검사 정규식
    let emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;

    if (emailRegex.test(userEmail ) && userEmail.endsWith('.com')) {
       $("#checkEmail").html('사용할 가능한 이메일입니다.');
        $("#checkEmail").css('color', 'green');
    } else {
       $("#checkEmail").html('사용할 수 없는 이메일입니다.');
        $("#checkEmail").css('color', 'red');
    }
});
</script>

   <script  src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
      function sample6_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                     var addr = ''; // 주소 변수
                     var extraAddr = ''; // 참고항목 변수

                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                           extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;

                     } else {
                        document.getElementById("sample6_extraAddress").value = '';
                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('sample6_postcode').value = data.zonecode;
                     document.getElementById("sample6_address").value = addr;
                     // 커서를 상세주소 필드로 이동한다.
                     document.getElementById("sample6_detailAddress")
                           .focus();
                  }
               }).open();
      }
   </script>


</body>
</html>