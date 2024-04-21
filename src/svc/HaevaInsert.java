package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.Dao;
import sha256.SHA256;



public class HaevaInsert implements HaevaImpl {

   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub
      
      
      request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String tid = request.getParameter("tid");
        String password = request.getParameter("pw");
        String ttel = request.getParameter("ttel");
        String email = request.getParameter("email");
        int adp = Integer.parseInt(request.getParameter("adp"));
        String ad = request.getParameter("ad");
        String ad1 = request.getParameter("ad1");
        String rtid = request.getParameter("rtid");
        int mileage = 0;
        if(rtid.equals("gggg")) {
           mileage = 10000;
        }
        String salt = SHA256.createSalt();//salt 생성
        
        String hashedPassword = SHA256.encrypt(password, salt);
        // 해싱된 비밀번호와 솔트를 데이터베이스에 저장
        Dao tidao1 = new Dao();
        tidao1.insert_nametel(tid, hashedPassword, ttel, 
              email, adp, ad, ad1, rtid,mileage, salt);
   }
}

