
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰수정</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<!-- ======================================================== -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<!-- ================= -->
<link rel="stylesheet" href="./style/popup3.css">
<link rel="stylesheet" href="./style/nav.css">
<!-- ----------------------------------- -->
<script src="./js/jquery-3.7.1.js"></script>
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
 String date = request.getParameter("date");
 %>

<div class="tway1 mb-3" style="font-size:38px;"> <%=name %> </div>


<form action="update_review.do" method="post" class="m-3"  enctype="multipart/form-data" >

<div class="Poptext"> 이번 여행 좋았나요? </div>
<div class ="star_rating mt-3 mb-3" >
  <input style="color: transparent; border: none;outline:none;" class="star noborder "  id="first" value="1" readonly>
 	<input style="color: transparent; border: none;outline:none;"class="star" id="second" value="2" readonly>
  	 <input style="color: transparent; border: none;outline:none;"class="star"  id="third" value="3" readonly>
 	  <input style="color: transparent; border: none; outline:none;"class="star"  id="fourth" value="4" readonly>
  	   <input style="color: transparent; border: none; outline:none;"class="star" id="fifth" value="5" readonly>
   	    <span class="Poptext2" id="feedbackText"></span>
   	     <input type="hidden"  name="jum" id="selectedValue" value="">

    
</div>


<div class="Poptext "> 가격은 만족했나요? </div>
<div class="mt-3 mb-3">
<input class="btn01" type="button"  value="불만족" onclick="setSelectedHowp(this.value)">
<input class="btn01"  type="button" value="만족" onclick="setSelectedHowp(this.value)">
<input class="btn01" type="button" value="매우만족" onclick="setSelectedHowp(this.value)">
 <input type="hidden"  name="howp" id="selectedhowp" value="">
</div>

<div class="Poptext mt-3 "> 여행지는 어땠나요? </div>
<div class="mt-3 mb-3" >
<input class="btn03"  type="button" value="불만족"  onclick="setSelectedHowt(this.value)">
<input class="btn03"  type="button"  value="만족"onclick="setSelectedHowt(this.value)">
<input class="btn03"  type="button" value="매우만족" onclick="setSelectedHowt(this.value)">
<input type="hidden"  name="howt" id="selectedhowt" value="">
</div>

<div class="Poptext mt-3 "> 사진 업로드 </div>
<div class="mt-3 mb-3" >

<div class="displays">
  <label for="file">
  <div class="upload"></div>
</label>
  <input type="file" class="real-upload" name="file" accept="image/*" required multiple>
  <ul class="image-preview"></ul>
  </div>
  
  
<textarea class="star_box" name="rreview" placeholder="구매하신 여행상품에 대한 후기를 남겨주시면, 다른 구매자들에게 도움이 됩니다."></textarea>



<input type="hidden" name="soo" value="<%=soo %>">
<input type="hidden" value="<%=date %>" name="date">
<!-- <input type="hidden" id="submitTime" name="submitTime" value="" /> -->
<input type="submit" class="btn02" value="리뷰 수정"/>
</form>

<script	src="./script/reviewinsert.js"></script>




<script>
  function setSelectedHowp(value) {
    document.getElementById('selectedhowp').value = value;
    
  }
  
  function setSelectedHowt(value) {
	    document.getElementById('selectedhowt').value = value;
	  }
	  
	  
  
</script>




<script>
$(document).ready(function () {
    // 불만족 버튼에 대한 클릭 이벤트 처리
    $('.btn01[value="불만족"]').click(function () {
      // 모든 버튼의 클래스를 'btn01'으로 초기화
      $('.btn01').removeClass('cbtn01');
      // 불만족 버튼에 'cbtn01' 클래스 추가
      $(this).addClass('cbtn01');
    });

    // 보통 버튼에 대한 클릭 이벤트 처리
    $('.btn01[value="만족"]').click(function () {
      // 불만족 버튼의 'cbtn01' 클래스 제거
      $('.btn01').removeClass('cbtn01');
      // 보통 버튼에 'cbtn01' 클래스 추가
      $(this).addClass('cbtn01');
    });
    
    $('.btn01[value="매우만족"]').click(function () {
        // 불만족 버튼의 'cbtn01' 클래스 제거
        $('.btn01').removeClass('cbtn01');
        // 보통 버튼에 'cbtn01' 클래스 추가
        $(this).addClass('cbtn01');
      });
  });
  
$(document).ready(function () {
    // 불만족 버튼에 대한 클릭 이벤트 처리
    $('.btn03[value="불만족"]').click(function () {
      $('.btn03').removeClass('cbtn03')
      $(this).addClass('cbtn03');
    });

    // 보통 버튼에 대한 클릭 이벤트 처리
    $('.btn03[value="만족"]').click(function () {
      $('.btn03').removeClass('cbtn03');
      $(this).addClass('cbtn03');
    });
    
    $('.btn03[value="매우만족"]').click(function () {
        $('.btn03').removeClass('cbtn03');
        $(this).addClass('cbtn03');
      });
  });


  
</script>
  <script>
    function getImageFiles(e) {
      const uploadFiles = [];
      const files = e.currentTarget.files;
      const imagePreview = document.querySelector('.image-preview');
      const docFrag = new DocumentFragment();


      // 파일 타입 검사
      [...files].forEach(file => {
        if (!file.type.match("image/.*")) {
          alert('이미지 파일만 업로드가 가능합니다.');
          return
        }

        // 파일 갯수 검사
        if ([...files].length < 6) {
          uploadFiles.push(file);
          const reader = new FileReader();
          reader.onload = (e) => {
            const preview = createElement(e, file);
            imagePreview.appendChild(preview);
          };
          reader.readAsDataURL(file);
        }
      });
    }

    function createElement(e, file) {
      const li = document.createElement('li');
      const img = document.createElement('img');
      img.setAttribute('src', e.target.result);
      img.setAttribute('data-file', file.name);
      li.appendChild(img);

      return li;
    }

    const realUpload = document.querySelector('.real-upload');
    const upload = document.querySelector('.upload');

    upload.addEventListener('click', () => realUpload.click());

    realUpload.addEventListener('change', getImageFiles);
  </script>

</body>
</html>