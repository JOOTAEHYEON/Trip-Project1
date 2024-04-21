package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.Dao;
import vo.VO;

public class PayDelete implements HaevaImpl {

    public void haeva(HttpServletRequest request, HttpServletResponse response) 
          throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        //VO tv = null;   
        
        System.out.println("PayDelte 도착");
        
        String merchant_uid = request.getParameter("merchant_uid");
        
        Dao tidao1 = new Dao();
        tidao1.delete_pay(merchant_uid);
        
        
      
        
        
    }
}