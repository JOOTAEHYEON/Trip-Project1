
		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							
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
								
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
							
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
		