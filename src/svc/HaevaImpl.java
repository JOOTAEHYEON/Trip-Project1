package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface HaevaImpl {  //class x ,interface o

	public void haeva(HttpServletRequest request,HttpServletResponse response)throws Exception;
	
	
	//interface(대충설계도)  child에서 구현해줘야함
}
