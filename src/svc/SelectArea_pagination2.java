package svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import vo.VO;

public class SelectArea_pagination2 implements HaevaImpl {

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
        
        int listCount = alist1.size();// 가져온 상품 총 개수     
        int currentPage = Integer.parseInt(request.getParameter("pageNumber"));
        int pageLimit = 2; //페이지를 2개씩 보여줄 거임
        int boardLimit = 8; // 상품을 8개씩 보여줄 거임
        int totalPages = (int) Math.ceil((double) listCount / boardLimit);// 가장 마지막 페이지 (총 페이지 수)
        // 페이징바의 시작 수 (현재 페이지 페이징바의 시작 수)
        int startPage=(currentPage - 1) / pageLimit * pageLimit + 1;      
        // 페이징바의 끝 수 (현재 페이지 페이징바의 마지막 수)
        int endPage= startPage + pageLimit - 1;   
        
       if (endPage > totalPages) {
         endPage = totalPages;
      }
      
        int startIndex = (currentPage - 1) * boardLimit;
        int endIndex = Math.min(startIndex + boardLimit, listCount);
        try {
        paginatedList = new ArrayList<>(alist1.subList(startIndex, endIndex));
        }catch(Exception e) {
           System.out.println("error in:"+paginatedList+"");
        }
        request.setAttribute("pageLimit", pageLimit);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("totalPages", totalPages);
        
        request.setAttribute("area", area);
        request.setAttribute("alist1", paginatedList);

        
    }
}