<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>선택항목 장바구니 삭제</title>
<!-- 파비콘 -->
<link rel="icon" href="./pic/favicon.png"/> 
<link rel="apple-touch-icon" href="./pic/favicon.png"/> 
<!-- 파비콘-end -->
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    String[] soo = request.getParameterValues("chkbox");

    // soo 가 null 이거나, 길이가 0인 경우 스크립트를 실행하지 않음
    if (soo != null && soo.length > 0) {
        Dao dao = new Dao();
        int res = dao.multidelete(soo);

        if (res == soo.length) {
        	
%>
         <script>
                alert('선택 상품을 삭제하였습니다.');
                window.location.href = '02_jangbaguni.jsp';
            </script>
<%
        } else {
%>
            <script>
                alert('선택 상품 삭제에 실패했습니다.');
                window.location.href = '02_jangbaguni.jsp';
            </script>
<%
        }
    }
%>
</body>
</html>
