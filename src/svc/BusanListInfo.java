package svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import vo.VO;



public class BusanListInfo  implements HaevaImpl{
	
	@Override	//parent에서 선언하고, child에서 구현한 haeva() 메서드
	public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//=============이부분이==================
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		Dao tidao1 = null;
		
		tidao1 = new Dao();
		ArrayList<VO> alist1 = null;
		alist1 = tidao1.BusanListInfo();
		request.setAttribute("alist1", alist1);

	}

}