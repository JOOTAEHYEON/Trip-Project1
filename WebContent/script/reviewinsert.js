$('.star_rating > .star').click(function () {
    // 선택된 별의 value 값을 가져옴
    var selectedValue = $(this).val();
    $('#selectedValue').val(selectedValue);
 
	
    // 해당 별과 그 앞의 모든 별에 .on 클래스를 추가
    $(this).addClass('on').prevAll('.star').addClass('on');

    // 형제 요소 중 뒤에 있는 별들의 .on 클래스 제거
    $(this).nextAll('.star').removeClass('on');

    // 클릭한 별의 ID에 따라 문구를 설정
    var starId = $(this).attr('id');
    var text = '';

    switch (starId) {
      case 'first':
        text = '별로에요😡';
        break;
      case 'second':
        text = '그저그래요😞';
        break;
      case 'third':
        text = '보통이에요🙂';
        break;
      case 'fourth':
        text = '아주좋아요😊️️';
        break;
      case 'fifth':
        text = '정말 최고에요😍';
        break;
      default:
        text = '';
    }

    // 설정된 문구를 출력
    $('#feedbackText').text(text);
  });

  
  
  function createElement(e, file) {
  const li = document.createElement('li');
  const img = document.createElement('img');
   alert('File Name: ' + file.name);

  // 디버깅: 파일의 이름이 null인지 확인
  console.log('File Name:', file.name);

  img.setAttribute('src', e.target.result);
  img.setAttribute('data-file', file.name);
  li.appendChild(img);

  return li;
}
  
  