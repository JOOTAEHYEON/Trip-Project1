package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

public class HaevaDelete implements HaevaImpl{
 
	public void haeva(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		// TODO Auto-generated method stub
		 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		Dao tidao1 = new Dao();
		
		String tid = request.getParameter("tid");
		
		tidao1.delete_name(tid);
		
			
		

	}
}
