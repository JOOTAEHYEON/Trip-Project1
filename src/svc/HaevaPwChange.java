package svc;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import vo.VO;

public class HaevaPwChange implements HaevaImpl{
   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception  {
      
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
         
      PrintWriter out = response.getWriter();
      Dao tidao1 = null;
      tidao1 = new Dao();
      
      String tid = request.getParameter("tid");
      String ttel = request.getParameter("ttel");
      String email = request.getParameter("email");
       
      
       String rid = tidao1.changePw(tid,ttel,email);
       
       request.setAttribute("rid", rid);
       
       if(rid==null || rid.equals("")){
          out.println("<script>");
          out.println("alert('일치한 정보가없습니다!');");
          out.println("window.location.href = '01_userPwUpdateForm.jsp';");
          out.println("</script>");
       }
             
   }
}