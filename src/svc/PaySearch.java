package svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import vo.VO;



public class PaySearch implements HaevaImpl {

   @Override
   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub

      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      
      Dao tidao1 = new Dao();
      VO tv = null;      
      ArrayList<VO> alist1 = null;
   
      
      HttpSession session = request.getSession();
      String tid =(String)session.getAttribute("sid");
      
      
      alist1 = tidao1.search_pay(tid);
    
      
      request.setAttribute("alist1", alist1);
   }

}