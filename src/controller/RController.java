package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.CDelete;
import svc.CInsert;
import svc.HaevaImpl;
import svc.NameSearchone;

/**
 * Servlet implementation class RController
 */
@WebServlet("*.ro")
public class RController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		request.setCharacterEncoding("UTF-8");
	    response.setCharacterEncoding("UTF-8");

	    String c = request.getRequestURI().substring(request.getContextPath().length());
	    String str = null;
		HaevaImpl h1 = null;
		PrintWriter out = response.getWriter();
	
	    switch(c) {
	    	
    	case "/insert.ro" :	//댓글 추가
    		
//    		System.out.println("RController Insert.ro 접속 완료");
      		h1 = new CInsert();
      		
      		try {
      			h1.haeva(request, response);
      		} catch (Exception e) {
      			e.printStackTrace();   
      			}		
//      
      		h1 = new NameSearchone();
	    	try {
				h1.haeva(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	str = "04_DetailPage.jsp";
      		

      		break;	
      		
    	case "/delete.ro" : //댓글 삭제
   		
//    		System.out.println("컨트롤러에서 delete.ro 시작");
    		h1 = new CDelete();
    		
    		try {
    			h1.haeva(request, response);
    		} catch (Exception e) {
    			e.printStackTrace();
    			} 		
      		h1 = new NameSearchone();
	    	try {
				h1.haeva(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	str = "04_DetailPage.jsp";
    		break;
	    }//switch-end
	    	
	    if(str != null) {
	    	RequestDispatcher rd1 = request.getRequestDispatcher(str);
	    	rd1.forward(request, response);
	    }
	    
	}//do-get end

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
