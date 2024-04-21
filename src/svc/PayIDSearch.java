package svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import vo.VO;



public class PayIDSearch implements HaevaImpl {

   @Override
   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub

      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      
      Dao tidao1 = new Dao();
      VO tv = null;      
      
   
      
    
      String imp_uid =request.getParameter("imp_uid");
    
      
      tv = tidao1.IDsearch_pay(imp_uid);
    
      
      request.setAttribute("stv", tv);
   }

}
