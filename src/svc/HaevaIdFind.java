package svc;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import vo.VO;

public class HaevaIdFind implements HaevaImpl{
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		
		Dao tidao1 = null;
	
		tidao1 = new Dao();
		
		String ttel = request.getParameter("ttel");
		String email = request.getParameter("email");
	
	   
		
	  String id = tidao1.getId(ttel,email);
		
	  System.out.println(id);
	
     request.setAttribute("id", id);
		
 

     if (id != null) {
         // 아이디가 있을 때의 처리
         String alertScript = "<script>alert('찾은 아이디는 " + id + " 입니다. 확인을 누르면 로그인창으로 이동합니다.');</script>";
         response.getWriter().write(alertScript);

         String redirectScript = "<script>location.href='01_Login.jsp';</script>";
         response.getWriter().write(redirectScript);
     } else {
         // 아이디가 없을 때의 처리
         String alertScript = "<script>alert('일치하는 정보가 없습니다.');</script>";
         response.getWriter().write(alertScript);
         
         String redirectScript = "<script>location.href='01_IdFind.jsp';</script>";
         response.getWriter().write(redirectScript);
     }
 }
}