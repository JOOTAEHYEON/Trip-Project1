package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public IdCheck() {
        super();    
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request, response);
   } 

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");  //언어관련
      
        String userId = request.getParameter("userId");            
        PrintWriter out = response.getWriter(); 
        
         Connection con = null;
         PreparedStatement pstmt =null;
         ResultSet rs =null;
         
         int idCheck = 0;
     
         
         try{    
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
         
         String sql = "select tid from tmember where tid = ?";
         pstmt=con.prepareStatement(sql);
         pstmt.setString(1, userId);
         rs = pstmt.executeQuery(); 
      
         if(rs.next()||userId.equals("")) { 
            idCheck=0;
         }else { 
            idCheck=1;
         }

          }catch(Exception e){
            out.print("error");
            
         }
         
         try{
             rs.close();
             pstmt.close();
             con.close();
         }catch(Exception e){
            out.print("error");            
         }     
      
         if(idCheck==0)
           System.out.println("이미 존재하는 아이디 입니다");
        else if(idCheck==1)
           System.out.println("사용 가능한 아이디 입니다");
        
        out.println(idCheck+"");
         
      
   }

}