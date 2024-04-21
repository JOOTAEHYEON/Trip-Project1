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

public class ReviewCntUpdate implements HaevaImpl {

    public void haeva(HttpServletRequest request, HttpServletResponse response) 
            throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
       // int soo = (int)session.getAttribute("soo");
        int soo = 6;
       // String writedate = request.getParameter("writedate");
        System.out.println("우아아아");
        String writedate = "2024-01-25 13:51:00";

        Dao tidao1 = new Dao();
        tidao1.update_hitcnt(soo, writedate);
    }


}