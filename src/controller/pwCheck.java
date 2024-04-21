package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class pwCheck
 */
@WebServlet("/pwCheck")
public class pwCheck extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    
    public pwCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 클라이언트에서 전송된 비밀번호들
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        
        PrintWriter out = response.getWriter();
        
        int pwCheck = 0;
       
        // 비밀번호 일치 여부 확인
        if(password1.equals(password2) && !password1.equals(""))
           pwCheck=0;
           else
              pwCheck=1;
        out.println(pwCheck+"");

   }

}