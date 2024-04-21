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

@WebServlet("/PhoneCheck")
public class PhoneCheck extends HttpServlet {
   private static final long serialVersionUID = 1L;

   public PhoneCheck() {
      super();
   }

   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      doPost(request, response);
   }

   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {

      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");

      // 전화번호 파라미터 받기
      String userPhone = request.getParameter("userPhone");
      PrintWriter out = response.getWriter();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      int phoneCheck = 0;

      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");

         String sql = "select ttel from tmember where ttel like ?";
         pstmt = con.prepareStatement(sql);
         pstmt.setString(1, userPhone);
         rs = pstmt.executeQuery();

         if (rs.next()) {
            phoneCheck = 0;
         } else {
            phoneCheck = 1;
         }
      } catch (Exception e) {
         out.print("error");
      } finally {
         try {
            rs.close();
            pstmt.close();
            con.close();
         } catch (Exception e) {
            out.print("error");
         }
      }
      out.println(phoneCheck + "");
   }
}