package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;

public class PayInsert implements HaevaImpl {
   public void haeva(HttpServletRequest request,HttpServletResponse response)throws Exception{
      
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      
      String imp_uid = request.getParameter("imp_uid");
      String merchant_uid = request.getParameter("merchant_uid");
      String email = request.getParameter("buyer_email");
      String name = request.getParameter("name");
      String tel = request.getParameter("buyer_tel");
      String amount = request.getParameter("amount");   
      String buyer_name = request.getParameter("buyer_name");
      String buyer_addr = request.getParameter("buyer_addr");
      String buyer_postcode = request.getParameter("buyer_postcode");
      
      Dao tidao = null;
      
      tidao = new Dao();
      tidao.insert_pay(imp_uid,merchant_uid,email,name,tel,amount,buyer_name,buyer_addr,buyer_postcode);
      
      
      //결제 성공후 마일리지 사용한 만큼 지우기 
      HttpSession session = request.getSession();
      String tid =(String)session.getAttribute("sid");   
      int mileage = Integer.parseInt(buyer_postcode);   
      
      tidao.updateMileage(mileage,tid);
      
      
      
       }//haeva-end
   }//class HaevaInsert-end