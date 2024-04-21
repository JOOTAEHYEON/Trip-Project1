package svc;


import java.util.Date;
import java.text.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;



public class CDelete implements HaevaImpl{
	
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();      
       
		String content = request.getParameter("content");						//textarea 안에 있는 댓글 내용
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));	//게시물 번호
		String tid = (String)session.getAttribute("sid");						//아이디
		int soo = Integer.parseInt(request.getParameter("soo"));				//상품 넘버
		String rwritedate = request.getParameter("date");						//시간

		Dao tidao = null;
		
		tidao = new Dao();
		
//		System.out.println("DAO reply_delete 로 이동함");
		
		//review_reply 테이블 삽입
		tidao.reply_delete(articleNo, soo, tid, rwritedate);
		
	}

}
