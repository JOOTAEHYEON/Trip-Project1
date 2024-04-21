package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import vo.VO;



public class HaevaSearch implements HaevaImpl {

	@Override
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		Dao tidao1 = null;
		VO tv = null;		
		tidao1 = new Dao();
		
	
		
		HttpSession session = request.getSession();
		String tid =(String)session.getAttribute("sid");
		
		tv = tidao1.getInfo(tid);
		
		session.setAttribute("stv", tv);/////////
	}

}
