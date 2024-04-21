package svc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import vo.ReplyVO;

import vo.VO;

public class NameSearchone implements HaevaImpl{
   
   @Override
   public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
      // TODO Auto-generated method stub
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");
       response.setContentType("text/html;charset=UTF-8");

      Dao tidao1 = new Dao();
      VO tv = null;
      //ArrayList<VO> alist2 = null;
      
     String name = request.getParameter("name");
      
      tv = tidao1.getfo(name);
      //alist2 = tidao1.select_all_review3(name);

      request.setAttribute("stv", tv);   
     // request.setAttribute("alist2", alist2);
      
      
    //=== 리뷰 가져오는 부분 시작 ===
     	System.out.println("soo:"+tv.getSoo());			
    		// 리뷰 정보 가져올 때 soo 값을 상품의 soo 값으로 설정
    		List<VO> reviewReply = tidao1.getReviewBySoo(tv.getSoo());
    	
    		
    		// 대댓글 가져오는 부분 : 리뷰의 articleNo 를 기준으로 댓글 가져옴
    		for (VO review : reviewReply) {
    			List<ReplyVO> replies = tidao1.getReplyByArticleNo(review.getArticleNO());
    			review.setReplies(replies);
    		}
    		request.setAttribute("reviews", reviewReply);
    	}	//=== 리뷰 가져오는 부분 - 끝 ===

    }