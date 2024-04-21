package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Dao;

public class ReviewDelete implements HaevaImpl {

    public void haeva(HttpServletRequest request, HttpServletResponse response) 
          throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //int soo =(int)session.getAttribute("soo");
        int soo = 6;
       // String writedate = request.getParameter("writedate");
        String writedate= "2024-01-22 10:13:50";
        Dao tidao1 = new Dao();
        tidao1.delete_review(soo,writedate);
        

        String alertScript = "<script>alert('리뷰가 삭제되었습니다.');</script>";
        response.getWriter().write(alertScript);

    
        String redirectScript = "<script>location.href='05_reviewList.jsp';</script>";
        response.getWriter().write(redirectScript);
    }
}