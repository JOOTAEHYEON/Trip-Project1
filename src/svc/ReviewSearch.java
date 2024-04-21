package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import vo.VO;

public class ReviewSearch implements HaevaImpl {

   @Override
   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub

      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      
      Dao tidao1 = new Dao();
      VO tv = null;
      HttpSession session = request.getSession();
      
      String sooParam =request.getParameter("soo");
       int soo = (sooParam != null && !sooParam.isEmpty()) ? Integer.parseInt(sooParam) : 0;
    
     
      String writedate = request.getParameter("date");   
    
      tv = tidao1.select_review(soo,writedate);
      
      session.setAttribute("stv", tv);/////////
   }

}