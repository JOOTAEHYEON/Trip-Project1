package svc;

import java.util.Date;
import java.text.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import svc.HaevaImpl;


public class CInsert implements HaevaImpl{
	
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");        
        Date now = new Date();         
        String writedate = sdf1.format(now);        
       
		String content = request.getParameter("content");						//textarea 안에 있는 댓글 내용
		int articleNo = Integer.parseInt(request.getParameter("articleNo"));	//게시물 번호
		String tid = (String)session.getAttribute("sid");						//로그인된 아이디
		int soo = Integer.parseInt(request.getParameter("soo"));				//상품 넘버
		
//		System.out.println("=== CInsert 내부 값 확인 ===");
//		System.out.println("댓글 내용은	: "+content);
//		System.out.println("게시글 번호는	: "+articleNo);
//		System.out.println("접속한 아이디	: "+tid);
//		System.out.println("상품번호 		: "+soo);
//		System.out.println("글작성시간		: "+writedate);
//		System.out.println("=== CInsert 내부 확인 끝 ===");
		
		Dao tidao = null;
		
		tidao = new Dao();
		
//		System.out.println("DAO reply_insert 로 이동함");
		
		tidao.getNext(soo, articleNo);
		
		int nn = tidao.getNext(soo, articleNo);
		
		//review_reply 테이블 삽입
		tidao.reply_insert(articleNo, soo, content, tid, writedate, nn);
		
	}

}
