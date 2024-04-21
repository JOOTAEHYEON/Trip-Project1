package svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import vo.VO;

public class SelectArea implements HaevaImpl {

    @Override
    public void haeva(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        Dao dao = new Dao();
        ArrayList<VO> alist1 = null;
        ArrayList<VO> paginatedList = null;
        String area = request.getParameter("area");

        if (area != null && !area.isEmpty()) {
            alist1 = dao.SelectArea(area);
        } else {
            alist1 = dao.SelectAllArea();
        }
        
        int currentPage = Integer.parseInt(request.getParameter("pageNumber"));
        int pageSize = 8; 
        int totalItems = alist1.size();
        int totalPages = (int) Math.ceil((double) totalItems / pageSize);
        int startIndex = (currentPage - 1) * pageSize;
        int endIndex = Math.min(startIndex + pageSize, totalItems);
        try {
        paginatedList = new ArrayList<>(alist1.subList(startIndex, endIndex));
        }catch(Exception e) {
           System.out.println("error in:"+paginatedList+"");
        }
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("area", area);
        request.setAttribute("alist1", paginatedList);      
    }
}