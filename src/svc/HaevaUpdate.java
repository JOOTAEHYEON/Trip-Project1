package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import sha256.SHA256;

public class HaevaUpdate implements HaevaImpl {

   @Override
   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub

      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      
      HttpSession session = request.getSession();   
      String[] ips =new String[3];
      String password  = request.getParameter("pw");
      String ttel  = request.getParameter("ttel");
      String email  = request.getParameter("email");
      int adp = 0;
      String ad  = request.getParameter("ad");
      String ad1  = request.getParameter("ad1");   
      String sid = (String)session.getAttribute("sid");
      
      Dao tidao1 = null;
        try {
      
      adp = Integer.parseInt(request.getParameter("adp"));
      
              
      tidao1 = new Dao();
      ips = tidao1.select_id_pw_salt(sid);//ips[0]:id , ips[1]:pw  , ips[2]:salt
        }catch(Exception e) {
           System.out.println("e");
        }
      if(ips[1].equals(password)) {//비번이 변경이 안되면 
         tidao1.update_all(password,ttel,email,adp,ad,ad1,sid);
         
      }else {//비번이 변경되면 text+salt=>hashpw 
         String hashedPassword = SHA256.encrypt(password, ips[2]);       
         tidao1.update_all(hashedPassword,ttel,email,adp,ad,ad1,sid);
            
      }
      
        
      
         
   }

}
