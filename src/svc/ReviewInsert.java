package svc;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.Dao;

public class ReviewInsert implements HaevaImpl {

    public void haeva(HttpServletRequest request, HttpServletResponse response) 
          throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String uploadPath = request.getServletContext().getRealPath("/pic");
        
        MultipartRequest mr1 = new MultipartRequest(request, uploadPath,
              10 * 1024 * 1024, "UTF-8",new DefaultFileRenamePolicy());

        int articleNO = 0;
      
        String sooParam = mr1.getParameter("soo");
        int soo = (sooParam != null && !sooParam.isEmpty()) ? Integer.parseInt(sooParam) : 0;
        System.out.println("수의값은"+soo);
       
        String jumParam = mr1.getParameter("jum");
        int jum = (jumParam != null && !jumParam.isEmpty()) ? Integer.parseInt(jumParam) : 0;
      
        
        String hp = mr1.getParameter("howp");
      
        String ht = mr1.getParameter("howt");
       
        String rcontent = mr1.getParameter("rreview");
      
        String imgFileName = mr1.getFilesystemName("file");
    
        String tid =  mr1.getParameter("tid");
        int hitcnt = 0;
        
        //리뷰작성 시간 
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");        
        Date now = new Date();         
        String writedate = sdf1.format(now);        
        System.out.println(writedate);
        
        Dao tidao1 = new Dao();
        tidao1.insert_review(articleNO,soo, jum, hp, ht, rcontent, imgFileName, tid, hitcnt,writedate);
        

        String script = "<script>\n" +
                "alert('리뷰를 작성하였습니다.');\n" +
                "window.location.href = 'ReviewSearch.do';\n" +
                "</script>";
        	response.getWriter().write(script);

       
        
    }
}