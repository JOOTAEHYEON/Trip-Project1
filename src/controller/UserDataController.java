package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import svc.AllListInfo;
import svc.AllReviewSearch;
import svc.AllReviewSearch2;
import svc.BusanListInfo;
import svc.CartShow;
import svc.DaegooListInfo;
import svc.DaejunListInfo;
import svc.HaevaDelete;
import svc.HaevaIdFind;
import svc.HaevaImpl;
import svc.HaevaInsert;
import svc.HaevaPwChange;
import svc.HaevaPwChange2;
import svc.HaevaSearch;
import svc.HaevaUpdate;
import svc.JejuListInfo;
import svc.NameSearchone;
import svc.PayDelete;
import svc.PayIDSearch;
import svc.PayInsert;
import svc.PayReviewSearch;
import svc.PaySearch;
import svc.ReviewCntUpdate;
import svc.ReviewDelete;
import svc.ReviewInsert;
import svc.ReviewSearch;
import svc.ReviewUpdate;
import svc.SelectArea;
import svc.SelectArea_pagination2;
import svc.SeoulListInfo;
import svc.WishlistItem;




@WebServlet("*.do")
public class UserDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserDataController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");  //언어관련
		
		String c = request.getRequestURI().substring(request.getContextPath().length());
		
		String str = null;
		HaevaImpl h1 = null;
		
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		switch (c) {
		
		//회원가입  insert-------------------------------
		case "/userInsert.do"://insert.do야5?
		h1 = new HaevaInsert(); ////////////////
		
		try { 
			h1.haeva(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			  out.println("<script>");
		      out.println("alert('모든 정보를 입력해주세요!');");
		      out.println("window.location.href = '01_userInsertForm.jsp';");
		      out.println("</script>");
			
		}
		
        out.println("<script>");
        out.println("alert('가입이 완료 되었습니다.\\n확인을 누르면 로그인 화면으로 이동합니다.');");
        out.println("window.location.href = '01_Login.jsp';");
        out.println("</script>");
	    
		//str = "loginForm.jsp";
		break;
	
	    //내정보 보기 select(id) ------------------------------ 
		case "/getMyInfo.do": 
		h1 = new HaevaSearch();/////////
	    
	    try { 
	    	h1.haeva(request, response);//////////// 
	    } catch (Exception e) { 
	    	e.printStackTrace(); } 
	    
	    str ="01_myInfo.jsp";//////////// 
	    break;
	 

		//내정보 수정  update--------------------------------
		
		case "/userUpdate.do":
	    	
			h1 = new HaevaUpdate();////////
			
			try {
				h1.haeva(request, response);///////
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			h1 = new HaevaSearch();/////////
		    
		    try { 
		    	h1.haeva(request, response);//////////// 
		    } catch (Exception e) { 
		    	e.printStackTrace(); 
		    } 
		    
		    out.println("<script>");
	        out.println("alert('정보가 수정되었습니다.');");
	        out.println("window.location.href = '01_myInfo.jsp';");
	        out.println("</script>");
		  
			
			break;
	    
	    
		//회원탈퇴  delete--------------------------------------
		case "/userDelete.do":	
			h1 = new HaevaDelete();////////
			 
			try {
				h1.haeva(request, response);/////////
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
			
			
			out.println("<script>");
	        out.println("alert('이용해주셔서 감사합니다.');");
	        out.println("window.location.href = '00_main.jsp';");
	        out.println("</script>");
			break;
			
			
		 //회원아이디 찾기--------------------------------------
			
		case "/idFind.do":
			
			
			h1 = new HaevaIdFind();
			try {
				h1.haeva(request, response);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			//str="01_Login.jsp";
			break;
				
			// 회원비번 수정 요청(정보일치하면 수정화면으로)------------------
	      case "/pwChange.do":
	         h1 = new HaevaPwChange();
	         try {
	            h1.haeva(request, response);
	         } catch (Exception e1) {
	              	e1.printStackTrace();
	              	out.println("<script>");
	              	out.println("alert('일치한 정보가없습니다!');");
	              	out.println("</script>");
	         }
	         str = "01_UPPW.jsp";
	           break;
	         
	        // 회원비번 수정------------------------------------------
	      case "/pwChange2.do": 
	         h1 = new HaevaPwChange2();
	         try {
	            h1.haeva(request, response);
	         } catch (Exception e1) {
	               out.println("<script>");
	               out.println("alert('비번수정 에러!');");
	               out.println("window.location.href = '01_userPwUpdateForm.jsp';");
	               out.println("</script>");
	         }
	     
	        
             out.println("<script>");
             out.println("alert('비밀번호 수정 완료');");
             out.println("window.location.href = '01_Login.jsp';");
             out.println("</script>");
	         
	         break;
			
			//상품----------------------------------------
		 case "/AllListInfo.do" :	//전체보기
		    	//h1 = new ItemImpl();
		    	h1 = new AllListInfo();
		    	try {
					h1.haeva(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	str = "03_Alllist.jsp";
		    	break;
		    
		    case "/SeoulListInfo.do" : 	//서울 선택시
		    	h1 = new SeoulListInfo();
		    	try {
					h1.haeva(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	str = "03_AlllistSeoul.jsp";
		    	break;

		    case "/DaejunListInfo.do" : 	//대전 선택시
		    	h1 = new DaejunListInfo();
		    	try {
					h1.haeva(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	str = "03_AlllistDaejun.jsp";
		    	break;

		    case "/DaegooListInfo.do" : 	//대구 선택시
		    	h1 = new DaegooListInfo();
		    	try {
					h1.haeva(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	str = "03_AlllistDaegoo.jsp";
		    	break;
		    	
		    case "/BusanListInfo.do" : 	//부산 선택시
		    	h1 = new BusanListInfo();
		    	try {
					h1.haeva(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	str = "03_AlllistBusan.jsp";
		    	break;
		    	
		    case "/JejuListInfo.do" : 	//제주도 선택시
		    	h1 = new JejuListInfo();
		    	try {
					h1.haeva(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	str = "03_AlllistJeju.jsp";
		    	break;
		    	
		    case "/SelectArea.do" :    //검색
	             h1 = new SelectArea();
	             //h1 = new SelectArea_pagination2(); //페이징2단계
	             try {
	               h1.haeva(request, response);
	            } catch (Exception e) {
	               // TODO Auto-generated catch block
	               e.printStackTrace();
	            }
	             str = "03_Alllist.jsp";
	             //str = "03_Alllist_pagination2.jsp";//페이징2단계
	             break;
		    	
		    case "/view.do" : 	//세부아이템 선택시 (상품+리뷰) 
		    	h1 = new NameSearchone();
		    	try {
					h1.haeva(request, response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	str = "04_DetailPage.jsp";
		    	break;
		    	
		    	
			    	//========================================================   
		    	
		    case "/ReviewSearch.do": //예약+리뷰 내역 불러오기
		    	
	            h1 = new PayReviewSearch();/////////
	             
	             try { 
	                h1.haeva(request, response);//////////// 
	             } catch (Exception e) { 
	                e.printStackTrace(); } 
	             
	             str ="05_reviewList.jsp";//////////// 
	             break;
	             
		    	
		    	
		      case "/insert_review.do": // 리뷰쓰기
		    
		         h1 = new ReviewInsert();
		         try {
		            h1.haeva(request, response);
		         } catch (Exception e) {
		            // TODO Auto-generated catch block
		            e.printStackTrace();
		         }
		     
		         break;
		        
		         
		         
		      case "/select_review.do": //(soo,writedate로)하나의 리뷰보기 클릭하면 조회수 추가동시에 정보를 보여줌
		             h1 = new ReviewCntUpdate();/////////
		             try {
		             h1.haeva(request, response);////////////
		             } catch (Exception e) {
		               e.printStackTrace();
		              }

		               h1 = new ReviewSearch();/////////
		               try {
		                  h1.haeva(request, response);////////////
		               } catch (Exception e) {
		                  e.printStackTrace();
		               }
		               str = "05_reviewpopup2.jsp";////////////
		               break;
		      
		         
		      case "/select_all_review.do"://tid로 유저 리뷰 모두보기 (결제 내역으로도 쓰이남?)
		         h1 = new AllReviewSearch();/////////
		         try {
		            h1.haeva(request, response);////////////
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         str = "05_reviewList.jsp";////////////
		         break;
		      
		         
		      case "/select_all_review2.do"://soo로 하나의 상품 리뷰 모두보기 
		         h1 = new AllReviewSearch2();/////////
		         try {
		            h1.haeva(request, response);////////////
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         str = "상품 리뷰보기 클릭하면 select_all_review2.do 로 갔다가 여기에서 연결시켜줌 ";////////////
		         break;
		         
		         
		      case "/update_review.do": //리뷰수정 
		    	  System.out.println("리뷰수정 시작");
		         h1 = new ReviewUpdate();/////////
		         try {
		            h1.haeva(request, response);////////////
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         
		         System.out.println("리뷰수정 끝");
		        
		         break;
		         
		         
		      case "/delete_review.do": //리뷰삭제
		         h1 = new ReviewDelete();/////////
		         try {
		            h1.haeva(request, response);////////////
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
		         
		         break;
		         
		         
		         //==========결제:저장
		         
		      case "/PayInsert.do":
		    	
		    	
		          h1 = new PayInsert();

		          try {
		             h1.haeva(request, response);
		          } catch (Exception e) {
		             // TODO Auto-generated catch block

		           

		             e.printStackTrace();
		          }
		          break;
		          
		      

		    
		        
		          
		          //============결제:예약찾기 
		      case "/PaySearch.do": //결제내역 찾기
		    	 
		            h1 = new PaySearch();/////////
		             
		             try { 
		                h1.haeva(request, response);//////////// 
		             } catch (Exception e) { 
		                e.printStackTrace(); } 
		             
		             str ="02_reservationList.jsp";//////////// 
		             break;
		             
		      case "/PayIDSearch.do": //결제내역 찾기
			    
		            h1 = new PayIDSearch();/////////
		             
		             try { 
		                h1.haeva(request, response);//////////// 
		             } catch (Exception e) { 
		                e.printStackTrace(); } 
		             
		             str ="06_reservationConfirm.jsp";//////////// 
		             break;    
		             
		             // ===============결제:예약삭제     
	            case "/PayDelete.do": 
	                  h1 = new PayDelete();/////////
	                  try {
	                     h1.haeva(request, response);////////////
	                  } catch (Exception e) {
	                     e.printStackTrace();
	                  }
	                  
	                   out.println("<script>");
		               out.println("alert('예약 내역이 삭제 되었습니다. ');");
		               out.println("window.location.href = '02_reservationList.jsp';");
		               out.println("</script>");
	                  break;
		       
		             
		         //============================장바구니 insert
		    	case "/addToCart.do" :	
					String memberId = request.getParameter("t_id");				
					String sooParameter = request.getParameter("soo");
					int productNum = 0;
				
					if (sooParameter != null && !sooParameter.isEmpty()) {
						try {
							productNum = Integer.parseInt(sooParameter);
						} catch (NumberFormatException e) {
							e.printStackTrace(); // 혹시나 예외 발생 시 콘솔에 로그 출력
						}
					}
				
				
		        String productName = request.getParameter("name");
		        int quantity = Integer.parseInt(request.getParameter("i_cnt"));
		       // System.out.println(quantity);
		        int productPrice = Integer.parseInt(request.getParameter("price"));

		        // 장바구니에 상품 추가
		        Dao Dao = null;
				try {
					Dao = new Dao();
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		        try {
					Dao.CartAdd(memberId, productNum, productName, quantity, productPrice);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		        // 장바구니에 추가한 상품 정보를 request에 저장
		        request.setAttribute("memberId", memberId);
		        request.setAttribute("productNum", productNum);
		        request.setAttribute("productName", productName);
		        request.setAttribute("quantity", quantity);
		        request.setAttribute("productPrice", productPrice);

		        out.println("<script>");
		        out.println("alert('장바구니 담기완료! 장바구니로 이동합니다.');");
		        out.println("window.location.href = '02_jangbaguni.jsp';");
		        out.println("</script>");
		        
		      
		    	break;
		        
		    	
		    	
		    	//장바구니 Search==================================
			    case "/CartShow.do" :
			    	h1 = new CartShow();
						try {
							h1.haeva(request, response);
						} catch (Exception e) {
							e.printStackTrace();
						}
						str = "02_jangbaguni.jsp";
											
						break;
				
						
				
						
						
				//장바구니 삭제======================		
			    case "/delete.do" :		
			    				    	
			    	String logId = (String) request.getSession().getAttribute("sid");
					Dao Dao1 = null;
					try {
						Dao1 = new Dao();
					} catch (ClassNotFoundException | SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	                Dao1.CartDelete(logId);
	                request.getSession().removeAttribute("t_id");
	     
			        out.println("<script>");
			        out.println("alert('장바구니가 비어졌습니다.');");
			        out.println("window.location.href = '02_jangbaguni.jsp';");
			        out.println("</script>");
	                		
	              
			    	
	                break;
	                
	                
	              //찜하기===================================================
			    case "/Wishlist.do" :	
							String t_id = (String) request.getSession().getAttribute("sid");
					
//					if (t_id != null) {
						
						String soo = request.getParameter("soo");
						String area = request.getParameter("area");
						String name = request.getParameter("name");
						String price = request.getParameter("price");
						
						//WishlistItem 객체 생성
						WishlistItem wishlistItem = new WishlistItem(soo, area, name, price);
						
						//WishlistItem 을 세션에 추가 또는 갱신
						ArrayList<WishlistItem> zzimList = (ArrayList<WishlistItem>) request.getSession().getAttribute("zzimList");
						if (zzimList == null) {
							zzimList = new ArrayList<>();
						}
						zzimList.add(wishlistItem);
						request.getSession().setAttribute("zzimList", zzimList);
	
						
						  out.println("<script>");
					      out.println("alert('찜 목록에 저장되었습니다.\\n찜목록으로 이동합니다.');");
					      out.println("    window.location.href = '02_jjim.jsp';");
					      out.println("</script>");
									
//					}

			    	break;		
		
		
			    	
			    	
			    	
		}//end-switch
		if(str != null) {
			RequestDispatcher rd1 = request.getRequestDispatcher(str);
			rd1.forward(request, response);	
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
