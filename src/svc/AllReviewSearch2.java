package svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import vo.VO;

public class AllReviewSearch2 implements HaevaImpl {

   @Override
   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub

      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");
      
      HttpSession session = request.getSession();
      ArrayList<VO> alist1 = null;
      Dao tidao1 = new Dao();
      //int soo =(int)session.getAttribute("soo");
      
      int soo = 222; //테스트용
      alist1 = tidao1.select_all_review2(soo);
      
      alist1 = tidao1.AllListInfo();
      request.setAttribute("alist1", alist1);
   }

}