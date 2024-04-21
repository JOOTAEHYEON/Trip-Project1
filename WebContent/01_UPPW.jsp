<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap CSS -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
   crossorigin="anonymous">

<!-- Custom Styles -->
<link rel="stylesheet" href="./style/nav.css">
<link rel="stylesheet" href="./style/footer.css">
<link rel="stylesheet" href="./style/1login.css">

<meta charset="UTF-8">
<title>여기, 좋은데: 회원가입</title>
</head>
<body>
    <% 
        String rid = (String)request.getAttribute("rid");
    if (rid == null) {
        %>
            <script>
    		alert("일치하는 정보가 없습니다!");
   			 window.location.href = "01_IdFind.jsp";

   
    		 document.addEventListener('DOMContentLoaded', function() {
        	 var profileTab = document.getElementById('pills-profile-tab');
       		 if (profileTab) {
             profileTab.click();
        }
    });
</script>
        <% 
            } else {
    %>
   <nav class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
      <div class="container-fluid d-inline-flex">
         <a class="navbar-brand mg-l" href="00_main.jsp"> <img
            src="./pic/logo4.png" width="140px" height="58px">
         </a>
      </div>
   </nav>

   <div class="Rcontainer">
      <div class="Tre">Register</div>
      <br>
      <form id="passwordChangeForm" action="pwChange2.do" method="post">
         <table>
            <tr>
               <td class="td0" colspan="2">기본 정보</td>
            </tr>
            <tr>
               <td colspan=2><hr></td>
            </tr>
            <tr>
               <td class="td1">비밀 번호 *</td>
               <td><input type="password" name="pw" class="Rtext2 input_pw"
                  placeholder="password" required> <span id="checkPw"
                  style="font-size: 12px;"></span><br></td>
            </tr>
            <tr>
               <td class="td1">비밀 번호 확인 *</td>
               <td><input type="password" name="pw2" class="Rtext2 input_pw2"
                  placeholder="password" required> <span id="checkPw"
                  style="font-size: 12px;"></span><br></td>
            </tr>
         </table>
         <input type="hidden" name="rid" value="${rid}">
         <div style="text-align: center;">
            <input class="infobox" type="submit" value="비번 수정">
         </div>
      </form>
   </div>

   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"  integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
   <script src="./js/jquery-3.7.1.js"></script>

   <script>
        // 페이지 로드 시에 rid 값을 세팅
        $(document).ready(function() {
            $("#rid").val("${rid}");
        });

        // 비밀번호 일치 여부 확인 및 AJAX 요청 코드는 그대로 유지
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

   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                    // ... 이전 코드 ...
                }
            }).open();
        }
    </script>
    <% } %>
</body>
</html>