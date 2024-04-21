package svc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.Dao;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ReviewUpdate implements HaevaImpl {

    public void haeva(HttpServletRequest request, HttpServletResponse response) 
            throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        
        String uploadPath = request.getServletContext().getRealPath("/pic");
        MultipartRequest mr1 = new MultipartRequest(request, uploadPath,
              50 * 1024 * 1024, "UTF-8",new DefaultFileRenamePolicy());   
        
        String sooParam = mr1.getParameter("soo");
     //   String sooParam = (String)session.getAttribute("soo");
       
        int soo = (sooParam != null && !sooParam.isEmpty()) ? Integer.parseInt(sooParam) : 0;
        System.out.println(soo+" 수 입니다!");
       
        String writedate = mr1.getParameter("date");       
       // String writedate = (String)session.getAttribute("date");
   
        
        
        if(writedate==null || writedate.equals("")) { 
           out.println("<script>");
         out.println("alert('모든 항목 입력 시  수정이 가능합니다.');");
         out.println("window.location.href = '05_reviewList.jsp';");
         out.println("</script>");
        }
        //리뷰작성으로부터 7일 초과시
        LocalDateTime updatedate = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime writedate2 = LocalDateTime.parse(writedate, formatter);
        LocalDateTime writedatepp = writedate2.plusSeconds(604800);// 604,800초(7일)를 더합니다.
        if (updatedate.isAfter(writedatepp)) {
         out.println("<script>");
         out.println("alert('리뷰수정은 작성일로부터 7일이내에만 가능합니다.');");
         out.println("window.location.href = '05_reviewList.jsp';");
         out.println("</script>");
        }

        //String uploadPath = "C:\\waa_200\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp2\\wtpwebapps\\000Project\\bbsUpload";
       
      
       
        String jumParam = mr1.getParameter("jum");
        int jum = (jumParam != null && !jumParam.isEmpty()) ? Integer.parseInt(jumParam) : 0;
        System.out.println("jum:" + jum);
        
        String hp = mr1.getParameter("howp");
        System.out.println("howp:"+hp);
        String ht = mr1.getParameter("howt");
        System.out.println("ht:"+ht);
        String rcontent = mr1.getParameter("rreview");
        System.out.println("rcontent:"+rcontent);
        String imgFileName = mr1.getFilesystemName("file");
        System.out.println("imgFileName:"+imgFileName);


        Dao tidao1 = new Dao();
        tidao1.update_review(jum, hp, ht, rcontent, imgFileName, soo, writedate);
        
        

        String alertScript = "<script>alert('리뷰가 수정되었습니다.');</script>";
        response.getWriter().write(alertScript);

    
        String redirectScript = "<script>window.location.href = 'select_review.do';</script>";
        response.getWriter().write(redirectScript);
        
        
    }


}