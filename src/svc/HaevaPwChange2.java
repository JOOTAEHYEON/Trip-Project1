package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import sha256.SHA256;

public class HaevaPwChange2 implements HaevaImpl {

    @Override
    public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // TODO Auto-generated method stub

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String tid  = request.getParameter("rid");
        //System.out.println("tid:" + tid);
        String password  = request.getParameter("pw");
        //System.out.println("password:" + password);
        String salt = SHA256.createSalt(); // salt 생성
        //System.out.println("salt:" + salt);
        String pw = SHA256.encrypt(password, salt);
        //System.out.println("pw" + pw);

        Dao tidao1 = new Dao();
        
        tidao1.update_pw_salt(pw, salt, tid);
        System.out.println("사용자에 대한 비밀번호가 성공적으로 업데이트되었습니다: " + tid);

        
        
    }
}