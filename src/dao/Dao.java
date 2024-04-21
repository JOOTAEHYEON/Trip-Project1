package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import db.Conn;
import vo.ReplyVO;
import vo.VO;



public class Dao {

	   private Connection con;         
	   
	   PreparedStatement pstmt=null;
	   ResultSet rs=null;            
	   
	   
	   public Dao() throws ClassNotFoundException, SQLException {
	      con=new Conn().getConnection(); 
	      /* con.setAutoCommit(true); */                              
	                                     
	   } 
	   
	     
	   // 회원가입  =========================================
	// 회원가입  =========================================
	      public boolean insert_nametel(String tid, String pw, String ttel, String email, int adp, String ad, String ad1,
	            String rtid, int mileage, String salt) throws SQLException {

	            String sql = "INSERT INTO tmember VALUES(?,?,?,?,?,?,?,?,?,?)";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, tid);
	            pstmt.setString(2, pw); // 해싱된 비밀번호 저장
	            pstmt.setString(3, ttel);
	            pstmt.setString(4, email);
	            pstmt.setInt(5, adp);
	            pstmt.setString(6, ad);
	            pstmt.setString(7, ad1);
	            pstmt.setString(8, rtid);
	            pstmt.setInt(9, mileage);
	            pstmt.setString(10, salt);
	            pstmt.executeUpdate();       

	         return true; // 회원가입 성공
	      }
	  
	      //내정보 출력==================================================
	       public VO getInfo(String mid)throws SQLException{

	        VO tv=null;
	       String sql = "SELECT * FROM tmember where tid like ?";   
	       pstmt = con.prepareStatement(sql);
	       pstmt.setString(1, mid);
	       rs = pstmt.executeQuery();
	       if(rs.next()){   
	             String tid=rs.getString("tid");
	             String pw =rs.getString("pw");
	             String ttel=rs.getString("ttel");
	             String email =rs.getString("email");
	             int adp=rs.getInt("adp");
	             String ad =rs.getString("ad");
	             String ad1=rs.getString("ad1");
	             String rtid =rs.getString("rtid");
	             tv=new VO(tid,pw,ttel,email,adp,ad,ad1,rtid);   ///////////////
	             
	       }else { 
	          tv=null;
	          }
	       return tv;      
	       }
	             
	      //유저정보 수정==================================================
	       public boolean update_all
	       (String pw, String ttel, String email, int adp, String ad, String ad1, String sid) {
	       
	          String sql="update tmember set pw = ?,ttel = ?,"
	                + "email = ?,adp = ? ,ad = ?,ad1=? where tid = ?";
	          try {
	             pstmt=con.prepareStatement(sql);
	             
	             pstmt.setString(1, pw);
	             pstmt.setString(2, ttel);
	             pstmt.setString(3, email);
	             pstmt.setInt(4, adp);
	             pstmt.setString(5, ad);
	             pstmt.setString(6, ad1);
	             pstmt.setString(7, sid);
	             pstmt.executeUpdate();
	          } catch (SQLException e) {
	             System.out.println("Update Exception ㅜㅜ");
	             return false;
	          }
	          return true;
	       }
	   
	       
	       
	   //회원정보===============================================
	   public boolean delete_name(String tid) {
	      String sql="delete from tmember where tid like ?";
	      try {
	         pstmt=con.prepareStatement(sql);
	         pstmt.setString(1, tid);
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("Delete Exception");
	         return false;
	      }
	      return true;
	   }

	   //아이디로 id,hashpw,salt불러오기========================================
	   public String[] select_id_pw_salt(String tid) throws SQLException {
	      String[] ips =new String[3];
	      
	      String sql = "SELECT tid, pw, salt FROM tmember WHERE tid = ?";
	      PreparedStatement pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, tid);
	      rs = pstmt.executeQuery();
	      
	      if(rs.next()) {
	         ips[0] = rs.getString("tid");
	         ips[1] = rs.getString("pw");
	         ips[2] = rs.getString("salt");
	      }   
	      return ips;
	   }



	    //아이디 찾기(전화번호,이메일로)========================================
	   
	   public String getId(String ttel ,String email) throws SQLException {
		   String id = null;
		   String sql = "SELECT tid FROM tmember WHERE ttel = ? AND email = ?";
		   PreparedStatement pstmt = con.prepareStatement(sql);
		   pstmt.setString(1, ttel);
		   pstmt.setString(2, email);
		   rs = pstmt.executeQuery();
		   
		   if(rs.next()) {
		        id = rs.getString("tid");
		      }  
		   return id;
	   }
	   
	   
	 //비번수정 1_권한: 유저(tid) 찾기(아이디,전화번호,이메일로)====================
	      public String changePw(String tid, String ttel, String email) throws SQLException {
	         String rid = null;
	         String sql = "SELECT tid FROM tmember WHERE tid = ? AND ttel = ? AND email = ?";
	         PreparedStatement pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, tid);
	         pstmt.setString(2, ttel);
	         pstmt.setString(3, email);
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	              rid = rs.getString("tid");
	              System.out.println("rid:"+rid);
	            }  
	         return rid;
	   }
	      
	    //비번수정 2_수정: 비번 수정(아이디로) , 새로운salt도 자동으로 수정===================
	      public boolean update_pw_salt(String pw,String salt,String tid) throws SQLException {
	          String sql = "UPDATE tmember SET pw = ?, salt = ? WHERE tid = ?";
	          
	              pstmt = con.prepareStatement(sql);
	              pstmt.setString(1, pw);     // 비밀번호 설정
	              pstmt.setString(2, salt);   // 솔트 설정
	              pstmt.setString(3, tid);  
	              pstmt.executeUpdate();
	          
	          return true;
	      }
	   
	   
	   
	   
	   

//----------전체상품 보여지기 list----------
	public ArrayList<VO> AllListInfo() throws SQLException{
		ArrayList<VO> tiarray=new ArrayList<VO>();
		String sql="select * from goodday order by soo";

		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			int soo = rs.getInt("soo");
			String area = rs.getString("area");
			String name = rs.getString("name");
			int price = rs.getInt("price");
			String xdo = rs.getString("xdo");
			String ydo = rs.getString("ydo");
			
			VO tv = new VO(soo, area, name, price, xdo, ydo);
			
			tiarray.add(tv);	
		}//while-end
		return tiarray;
	}
//----------전체상품 보여지기 end----------
	
//<<서울상품 보여지기 list>>
		public ArrayList<VO> SeoulListInfo() throws SQLException{
			ArrayList<VO> tiarray=new ArrayList<VO>();
			String sql="select * from goodday WHERE area ='서울'";
//서울만 조회 : select * from goodday where area='서울'
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int soo=rs.getInt("soo");
				String area=rs.getString("area");
				String name=rs.getString("name");
				int price=rs.getInt("price");
				String xdo=rs.getString("xdo");
				String ydo=rs.getString("ydo");
				
				VO tv = new VO(soo, area, name, price, xdo, ydo);
							
				tiarray.add(tv);
							
			}//while-end
				return tiarray;
		}
//<<서울상품 보여지기 end>>	
//<<대전상품 보여지기 list>>
		public ArrayList<VO> DaejunListInfo() throws SQLException{
			ArrayList<VO> tiarray=new ArrayList<VO>();
			String sql="select * from goodday WHERE area ='대전'";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int soo=rs.getInt("soo");
				String area=rs.getString("area");
				String name=rs.getString("name");
				int price=rs.getInt("price");
				String xdo=rs.getString("xdo");
				String ydo=rs.getString("ydo");
						
				VO tv = new VO(soo, area, name, price, xdo, ydo);
							
				tiarray.add(tv);
							
			}//while-end
				return tiarray;
		}
//<<대전상품 보여지기 end>>	
//<<대구상품 보여지기 list>>
		public ArrayList<VO> DaegooListInfo() throws SQLException{
			ArrayList<VO> tiarray=new ArrayList<VO>();
			String sql="select * from goodday WHERE area ='대구'";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int soo=rs.getInt("soo");
				String area=rs.getString("area");
				String name=rs.getString("name");
				int price=rs.getInt("price");
				String xdo=rs.getString("xdo");
				String ydo=rs.getString("ydo");
						
				VO tv = new VO(soo, area, name, price, xdo, ydo);
							
				tiarray.add(tv);
							
			}//while-end
				return tiarray;
		}
//<<대구상품 보여지기 end>>	
//<<부산상품 보여지기 list>>
		public ArrayList<VO> BusanListInfo() throws SQLException{
			ArrayList<VO> tiarray=new ArrayList<VO>();
			String sql="select * from goodday WHERE area ='부산'";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int soo=rs.getInt("soo");
				String area=rs.getString("area");
				String name=rs.getString("name");
				int price=rs.getInt("price");
				String xdo=rs.getString("xdo");
				String ydo=rs.getString("ydo");
						
				VO tv = new VO(soo, area, name, price, xdo, ydo);
							
				tiarray.add(tv);
							
			}//while-end
				return tiarray;
		}
//<<부산상품 보여지기 end>>	
//<<제주도상품 보여지기 list>>
		public ArrayList<VO> JejuListInfo() throws SQLException{
			ArrayList<VO> tiarray=new ArrayList<VO>();
			String sql="select * from goodday WHERE area ='제주도'";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				int soo=rs.getInt("soo");
				String area=rs.getString("area");
				String name=rs.getString("name");
				int price=rs.getInt("price");
				String xdo=rs.getString("xdo");
				String ydo=rs.getString("ydo");
				
				VO tv = new VO(soo, area, name, price, xdo, ydo);
					
				tiarray.add(tv);
					
			}//while-end
			return tiarray;
		}
//<<제주도상품 보여지기 end>>	
		
		// <<빈공간으로 검색시 전체상품 보여지기 list>>//////////////////
	      public ArrayList<VO> SelectAllArea() throws SQLException {
	         ArrayList<VO> tiarray = new ArrayList<VO>();
	         String sql = "select * from goodday";

	         pstmt = con.prepareStatement(sql);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	           
	            int soo = rs.getInt("soo");
	            String area = rs.getString("area");
	            String name = rs.getString("name");
	            int price = rs.getInt("price");
	            String xdo = rs.getString("xdo");
	            String ydo = rs.getString("ydo");
	          

	            VO tv = new VO(soo, area, name, price, xdo, ydo);

	            tiarray.add(tv);
	         }
	         return tiarray;
	      }
	      // <<전체상품 보여지기 end>>
	      
	        //<<(청계천)검색상품 보여지기 list //name에 청계천 있으면 그상품도 나와>>//업그레이드 시킴 이 메서드로 대체
	      public ArrayList<VO> SelectArea(String oriArea) throws SQLException {
	         ArrayList<VO> tiarray = new ArrayList<VO>();
	         String sql = "select * from goodday where area like ? or name like ?";
	         
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, oriArea);
	         pstmt.setString(2, '%'+oriArea+'%');
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	           
	            int soo = rs.getInt("soo");
	            String area = rs.getString("area");
	            String name = rs.getString("name");
	            int price = rs.getInt("price");
	            String xdo = rs.getString("xdo");
	            String ydo = rs.getString("ydo");
	          
	            VO tv = new VO(soo, area, name, price, xdo, ydo);
	            
	            tiarray.add(tv);
	         }
	         return tiarray;
	      }
		
		//<<선택상품 보여지기 end>>   
		   public VO getfo(String oriName) throws SQLException {
		      VO tv = null;
		      String sql = "select * from goodday where name=?";
		      
		      pstmt = con.prepareStatement(sql);
		      pstmt.setString(1, oriName);
		      rs = pstmt.executeQuery();
		      if(rs.next()) {
		         int soo = rs.getInt("soo");
		         String area = rs.getString("area");
		         String name = rs.getString("name");
		         int price = rs.getInt("price");
		         String xdo = rs.getString("xdo");
		         String ydo = rs.getString("ydo");

		         tv = new VO(soo, area, name, price, xdo, ydo);
		         
		      }else {
		         
		         tv = null;
		      }
		      return tv;
		   }
		   
		 //하나의 상품(name)에대한 리스트 모두 보기=================================//////////////
		      public ArrayList<VO> select_all_review3(String name2) throws SQLException {
		         ArrayList<VO> tiarray = new ArrayList<VO>();      
		         VO tv=null;
		             String sql = "SELECT g.area,g.name ,r.* FROM goodday g JOIN review r ON g.soo = r.soo "
		                   + "WHERE g.name like ?";   
		             pstmt = con.prepareStatement(sql);
		             pstmt.setString(1, name2);
		             rs = pstmt.executeQuery();
		            while (rs.next()) {
		               String area = rs.getString("area");		            
		               String name = rs.getString("name");		            
		               int articleNO = rs.getInt("articleNO");
		               int soo = rs.getInt("soo");
		               int jum = rs.getInt("jum");
		               String hp = rs.getString("hp");               
		               String ht = rs.getString("ht");		               
		               String rcontent = rs.getString("rcontent");		              
		               String imgFileName = rs.getString("imgFileName");		              
		               String tid = rs.getString("tid");		              
		               int hitcnt = rs.getInt("hitcnt");		               
		               String writedate = rs.getString("writedate");
		             
		               tv = new VO(area, name, articleNO, soo, jum, hp, ht, rcontent,
		                     imgFileName, tid, hitcnt, writedate);
		               tiarray.add(tv);
		            }
		            return tiarray;
		      }
	
		   // 리뷰쓰기================================================
		      public boolean insert_review(int articleNO, int soo, int jum, String hp, String ht, String rcontent, String imgFileName,
			           String tid, int hitcnt, String writedate) {

			       String sql = "INSERT INTO review (articleNO, soo, jum, hp, ht, rcontent, imgFileName, tid, hitcnt, writedate) "
			               + "VALUES (review_seq.NEXTVAL,?, ?, ?, ?, ?, ?, ?, ?, ?)";
			       try {
			           pstmt = con.prepareStatement(sql);
			           pstmt.setInt(1, soo);
			           pstmt.setInt(2, jum);
			           pstmt.setString(3, hp);
			           pstmt.setString(4, ht);
			           pstmt.setString(5, rcontent);
			           pstmt.setString(6, imgFileName);
			           pstmt.setString(7, tid);
			           pstmt.setInt(8, hitcnt);
			           pstmt.setString(9, writedate);
			           pstmt.executeUpdate();
			       } catch (SQLException e) {
			           e.printStackTrace();
			           System.out.println("insert_review error!");
			           return false;
			       }
			       return true;
			   }
		
		      
		      
		
	   
	 //하나의 리뷰보기(나의리뷰보기)=================================================
	      public boolean update_hitcnt(int soo, String writedate) throws SQLException {
	         String sql = "UPDATE review SET hitcnt = hitcnt+1 WHERE soo = ? AND writedate LIKE ?";
	                 pstmt = con.prepareStatement(sql);
	                 pstmt.setInt(1, soo);
	                 pstmt.setString(2, writedate);
	                 pstmt.executeUpdate();
	             return true;      
	      }
	         public VO select_review(int soo2,String writedate2) throws SQLException {
	            VO tv=null;
	                String sql = "SELECT g.area,g.name, r.* FROM goodday g JOIN review r ON g.soo = r.soo "
	                      + "WHERE r.soo = ? and r.writedate like ?";
	                pstmt = con.prepareStatement(sql);
	                pstmt.setInt(1, soo2);
	                pstmt.setString(2, writedate2);
	                rs = pstmt.executeQuery();
	               if (rs.next()) {
	                  
	                  String area = rs.getString("area");
	                 
	                  String name = rs.getString("name");
	                
	                  int articleNO = rs.getInt("articleNO");
	              
	                  int soo = rs.getInt("soo");
	                
	                  int jum = rs.getInt("jum");
	            
	                  String hp = rs.getString("hp");
	                
	                  String ht = rs.getString("ht");
	               
	                  String rcontent = rs.getString("rcontent");
	                
	                  String imgFileName = rs.getString("imgFileName");
	               
	                  String tid = rs.getString("tid");
	              
	                  int hitcnt = rs.getInt("hitcnt");
	                 // System.out.println("hitcnt:"+hitcnt);
	                  String writedate = rs.getString("writedate");
	                
	                  tv = new VO(area, name, articleNO, soo, jum, hp, ht, rcontent,
	                        imgFileName, tid, hitcnt, writedate); 
	               } else {
	                  tv = null;
	               }
	            return tv;
	         }
	         
	         // 리뷰+예약  내역 찾기 	  (리뷰 리스트보기)  
	         public ArrayList<VO> searchReivew_pay(String buyer_name2) throws SQLException {
	            ArrayList<VO> tiarray = new ArrayList<VO>();
	            VO tv = null;
	            String sql = "SELECT g.*, p.*, r.writedate " 
                        + "FROM goodday g " 
                        + "JOIN PAY1 p ON INSTR(',' || p.name || ',', ',' || g.soo || ',') > 0 "//PAY1 테이블의 name 열에 GoodDay 테이블의 soo 열 값이 포함되어 있는 경우에만 결과를 반환하는 쿼리 
                        + "LEFT JOIN review r ON INSTR(',' || g.soo || ',', ',' || r.soo || ',') > 0 "
                        + "WHERE p.buyer_name LIKE ?";

	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, buyer_name2);
	            rs = pstmt.executeQuery();

	            while (rs.next()) {
	               int soo = rs.getInt("soo");
	               String area = rs.getString("area");
	               String name = rs.getString("name");
	               int price = rs.getInt("price");
	               String xdo = rs.getString("xdo");
	               String ydo = rs.getString("ydo");
	               String imp_uid = rs.getString("imp_uid");
	               String merchant_uid = rs.getString("merchant_uid");
	               String amount = rs.getString("amount");
	               String buyer_name = rs.getString("buyer_name");
	               String writedate = rs.getString("writedate");
	               tv = new VO(soo, area, name, price, xdo, ydo, imp_uid, merchant_uid, amount, buyer_name, writedate);
	               tiarray.add(tv);   
	            }
	            return tiarray;
	         }


	   
	   
	   //하나의 상품(name)에대한 리스트 모두 보기=================================
	   public ArrayList<VO> select_all_review2(int soo2) throws SQLException {
	      ArrayList<VO> tiarray = new ArrayList<VO>();      
	      VO tv=null;
	          String sql = "SELECT g.area,g.name, r.* "
	                + "FROM goodday g JOIN review r ON g.soo = r.soo WHERE r.soo = ?";   
	          pstmt = con.prepareStatement(sql);
	          pstmt.setInt(1, soo2);
	          rs = pstmt.executeQuery();
	         while (rs.next()) {
	            String area = rs.getString("area");
	            String name = rs.getString("name");
	            int articleNO = rs.getInt("articleNO");
	            int soo = rs.getInt("soo");
	            int jum = rs.getInt("jum");
	            String hp = rs.getString("hp");	         
	            String ht = rs.getString("ht");
	            String rcontent = rs.getString("rcontent");	            
	            String imgFileName = rs.getString("imgFileName");	           
	            String tid = rs.getString("tid");	            
	            int hitcnt = rs.getInt("hitcnt");
	            System.out.println("hitcnt:"+hitcnt);
	            String writedate = rs.getString("writedate");
	          
	            tv = new VO(area, name, articleNO, soo, jum, hp, ht, rcontent,
	                  imgFileName, tid, hitcnt, writedate);
	            tiarray.add(tv);
	         }
	         return tiarray;
	   }

	   //리뷰수정============================================================
	   public boolean update_review(int jum, String hp, String ht, String rcontent
	         , String imgFileName, int soo, String writedate) {
	       String sql = "UPDATE review SET jum = ?, hp = ?, ht = ?, rcontent = ?, "
	             + "imgFileName = ? WHERE soo = ? AND writedate LIKE ?";
	       
	       try {
	           pstmt = con.prepareStatement(sql);
	           pstmt.setInt(1, jum);
	           pstmt.setString(2, hp);
	           pstmt.setString(3, ht);
	           pstmt.setString(4, rcontent);
	           pstmt.setString(5, imgFileName);
	           pstmt.setInt(6, soo);
	           pstmt.setString(7, writedate);
	           pstmt.executeUpdate();
	       } catch (SQLException e) {
	           e.printStackTrace();
	           System.out.println("update_review error!");
	           return false;
	       }
	       return true;
	   }

	   //리뷰삭제============================================================
	   public boolean delete_review(int soo, String writedate) {
	      String sql = "delete from review where soo like ? and writedate like ?";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setInt(1, soo);
	         pstmt.setString(2, writedate);
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         System.out.println("Delete Exception");
	         return false;
	      }
	      return true;   
	   }

	   
	   
	   
	 //댓글 추가시 넘버 플러스
		public int getNext(int soo, int articleNo) {
			String sql = "SELECT no FROM review_reply WHERE soo = ? AND articleNo = ? ORDER BY no DESC";
			
			try {
		         pstmt = con.prepareStatement(sql);
		         pstmt.setInt(1, soo);
		         pstmt.setInt(2, articleNo);
		         rs = pstmt.executeQuery();
		         if (rs.next()) {
		            return rs.getInt(1) + 1;
		         }
		      }catch(Exception e) {
		         e.printStackTrace();
		      }
		      return 1; //첫번째 게시물인 경우
		   }
		
		//댓글 추가(reply-table)
		public boolean reply_insert(int articleNo, int soo, String content, String tid, String rwritedate, int nn) {
				String sql = "INSERT INTO review_reply(no, articleNo, soo, content, id, rwritedate) " +
							 "VALUES (?, ?, ?, ?, ?, ?)";
				
				try {		
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, nn);
					pstmt.setInt(2, articleNo);
					pstmt.setInt(3, soo);
					pstmt.setString(4, content);
					pstmt.setString(5, tid);
					pstmt.setString(6, rwritedate);
					pstmt.executeUpdate();
					
				} catch (SQLException e) {
					e.printStackTrace();
					System.out.println("Insert Exception");
					return false;
				}
				return true;
		}	
		
		//댓글 삭제
		public boolean reply_delete(int articleNo, int soo, String tid, String rwritedate) {
			String sql = "DELETE FROM review_reply where id=? and articleNo=? and soo =? and rwritedate=?";
			
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, tid);
				pstmt.setInt(2, articleNo);
				pstmt.setInt(3, soo);
				pstmt.setString(4, rwritedate);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("DELETE Exception");
				return false;
			}
			return true;
		}
		// ===== 리뷰 / 댓글 불러오기 부분 시작 =====
		
		// soo 를 기준으로 reivew table 가져옴
		public List<VO> getReviewBySoo(int soo1) throws SQLException {
			List<VO> reviews = new ArrayList<>();
			
			String sql = "SELECT * FROM review WHERE soo =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, soo1);
			rs = pstmt.executeQuery();
			
			 while (rs.next()) {
	                                                     
	               int articleNO = rs.getInt("articleNO");
	               int soo = rs.getInt("soo");
	               int jum = rs.getInt("jum");
	               String hp = rs.getString("hp");               
	               String ht = rs.getString("ht");		               
	               String rcontent = rs.getString("rcontent");		              
	               String imgFileName = rs.getString("imgFileName");		              
	               String tid = rs.getString("tid");		              
	               int hitcnt = rs.getInt("hitcnt");		               
	               String writedate = rs.getString("writedate");
	             
	               VO review = new VO(articleNO, soo, jum, hp, ht, rcontent,
	                     imgFileName, tid, hitcnt, writedate);
	         
	          
	            reviews.add(review);	
	         }
	         return reviews;
		}
		
		// articleNo 를 기준으로 review_reply 가져옴
		public List<ReplyVO> getReplyByArticleNo(int articleNo1) throws SQLException {
			List<ReplyVO> replies = new ArrayList<>();
			
			String sql = "SELECT no, articleNo, content, id, rwritedate FROM review_reply WHERE articleNo=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleNo1);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				int no = rs.getInt("no");
				int articleNo = rs.getInt("articleNo");
				String content = rs.getString("content");
				String id = rs.getString("id");
				String rwritedate = rs.getString("rwritedate");
				
				ReplyVO reply = new ReplyVO(articleNo, content, id, rwritedate);
				
//				System.out.println("===== TelInfoDAO Review_Reply 출력값 확인 =====");
//				System.out.println("no 		:"+no);
//				System.out.println("articleNo 	:"+articleNo);
//				System.out.println("content 	:"+content);
//				System.out.println("id 		:"+id);
//				System.out.println("Rwritedate 	:"+rwritedate);
//				System.out.println("===== TelInfoDAO Review_Reply 출력값 확인끝 =====");
				
				replies.add(reply);	
			}
			return replies;
		}
	   
	   //결제 : 디비 insert ===================================
	   
	   public boolean insert_pay(String imp_uid, String merchant_uid,String email,String name,String tel, String amount,  String buyer_name,String buyer_addr,String buyer_postcode) {
		      String sql = "insert into PAY1 values(?,?,?,?,?,?,?,?,?)";
		      
		      try {
		         pstmt = con.prepareStatement(sql);
		         pstmt.setString(1, imp_uid);
		         pstmt.setString(2, merchant_uid);
		         pstmt.setString(3, email);
		         pstmt.setString(4, name);
		         pstmt.setString(5, tel);
		         pstmt.setString(6, amount);
		         pstmt.setString(7, buyer_name);
		         pstmt.setString(8, buyer_addr);
		         pstmt.setString(9, buyer_postcode);	         
		         pstmt.executeUpdate();
		      } catch (SQLException e) {
		         System.out.println("Insert Exception");
		         return false;
		      }
		      return true;
		   }
	   
////// 결제 테이블을 기준으로 예약 찾기 (예약내역)  
	   public ArrayList<VO> search_pay(String buyer_name2) throws SQLException {
		      ArrayList<VO> tiarray = new ArrayList<VO>();      
		         VO tv=null;
		         String sql = "select * from pay1 where buyer_name like ?";          
		           
		             pstmt = con.prepareStatement(sql);
		        
		             pstmt.setString(1, buyer_name2);
		             rs = pstmt.executeQuery();
		         
		             
		            while (rs.next()) {
		            	   String imp_uid = rs.getString("imp_uid");
			               String merchant_uid1 = rs.getString("merchant_uid");
			               String name = rs.getString("name");
			               String amount = rs.getString("amount");
			               String buyer_name= rs.getString("buyer_name");		               
			       
			               String buyer_addr = rs.getString("buyer_addr");             		              		 
			             			          
			               
			               
			               tv = new VO(imp_uid, merchant_uid1 , name ,amount, buyer_name , buyer_addr);
		               tiarray.add(tv);
		            }
		            return tiarray;
		   }
	   
	   //  imp_ui로 상세내역 찾기 (상세보기)
	   public VO IDsearch_pay(String imp_uid) throws SQLException {
		    
		         VO tv=null;
		         String sql = "select * from pay1 where imp_uid like?";          
		           
		             pstmt = con.prepareStatement(sql);
		        
		             pstmt.setString(1, imp_uid);
		             rs = pstmt.executeQuery();		         
		             
		            if (rs.next()) {			         
		               String imp_uid1 =  rs.getString("imp_uid");
		               String merchant_uid1 = rs.getString("merchant_uid");
		               String buyer_email = rs.getString("buyer_email");
		               String name = rs.getString("name");
		               String buyer_tel = rs.getString("buyer_tel");
		               String amount = rs.getString("amount");
		               String buyer_name= rs.getString("buyer_name");		               		          
		               String buyer_addr = rs.getString("buyer_addr");    
		               String buyer_postcode = rs.getString("buyer_postcode");

		               tv = new VO(imp_uid1, merchant_uid1 , buyer_email,name,buyer_tel ,amount, buyer_name , buyer_addr, buyer_postcode);
		              
		            }
		            return tv;
		   }
	   
	   
	// 결제 :삭제

	   public boolean delete_pay(String merchant_uid) {
	      String sql = "DELETE FROM pay1 WHERE merchant_uid LIKE ?";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setString(1, merchant_uid);
	         pstmt.executeUpdate();

	      } catch (SQLException e) {
	   
	         return false;
	      }
	      return true;
	   }
	   
	   
	   //마일리지 삭제 
	   
	      public boolean updateMileage(int mileage, String tid) throws SQLException {
	          
	          String sql = "UPDATE tmember SET mileage = mileage - ? WHERE tid = ?";
	             pstmt = con.prepareStatement(sql);
	               pstmt.setInt(1, mileage);
	               pstmt.setString(2, tid);
	               pstmt.executeUpdate();
	       
	          return true;
	       }
	   
	   // 장바구니 ==============================================
	   
		public void CartAdd(String tid, int soo, String name, int i_cnt, int price) throws SQLException {
		    // 1. 이미 장바구니에 동일한 상품이 있는지 확인
		    VO checkCart = getCartItem(tid, soo);

		    if (checkCart != null) {
		        // 2. 동일한 상품이 존재한다면 수량을 누적하여 업데이트
		        int updatedQuantity = checkCart.getI_cnt() + i_cnt;
		        updateCart(tid, soo, updatedQuantity);
		    } else {
		        // 3. 존재하지 않는다면 새로운 항목으로 추가
		        insertCart(tid, soo, name, i_cnt, price);
		    }
		}


		// 이미 장바구니에 동일한 상품이 있는지 확인하는 메서드
		private VO getCartItem(String tid, int soo) throws SQLException {
		    
			// 해당 회원(t_id)의 상품(soo)이 장바구니에 있는지 확인하는 쿼리 실행
		    String sql = "SELECT * FROM GOODCART WHERE tid=? AND soo=?";
		    
		    try (PreparedStatement pstmt = con.prepareStatement(sql)) {

		        pstmt.setString(1, tid);
		        pstmt.setInt(2, soo);

		        try (ResultSet rs = pstmt.executeQuery()) {
		            if (rs.next()) {
		                // 동일한 상품이 존재하면 해당 장바구니 아이템 반환
		                return new VO(
		                        rs.getString("tid"),
		                        rs.getInt("soo"),
		                        rs.getString("name"),
		                        rs.getInt("i_cnt"),
		                        rs.getInt("price")
		                );
		            }
		        }
		    }
		
		    // 동일한 상품이 존재하지 않으면 null 반환
		    return null;
		}

		// 장바구니에 있는 상품의 수량을 누적하여 업데이트하는 메서드
		private void updateCart(String tid, int soo, int updatedQuantity) throws SQLException {
		    // 해당 회원(t_id)의 상품(soo)의 수량을 누적하여 업데이트하는 쿼리 실행
		    String sql = "UPDATE GOODCART SET i_cnt=? WHERE tid=? AND soo=?";
		    
		    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
		        pstmt.setInt(1, updatedQuantity);
		        pstmt.setString(2, tid);
		        pstmt.setInt(3, soo);

		        pstmt.executeUpdate();
		    }
		}

		// 새로운 항목으로 장바구니에 추가하는 메서드
		private void insertCart(String tid, int soo, String name, int i_cnt, int price) throws SQLException {
		    // 새로운 상품을 장바구니에 추가하는 쿼리 실행
		    String sql = "INSERT INTO GOODCART (tid, soo, name, i_cnt, price) VALUES (?, ?, ?, ?, ?)";
		    
		    try (PreparedStatement pstmt = con.prepareStatement(sql)) {
		        pstmt.setString(1, tid);
		        pstmt.setInt(2, soo);
		        pstmt.setString(3, name);
		        pstmt.setInt(4, i_cnt);
		        pstmt.setInt(5, price);

		        pstmt.executeUpdate();
		    }
		}

	//아이디별 장바구니 출력
		public ArrayList<VO> CartShow(String tid) throws SQLException {
			ArrayList<VO> ciarray = new ArrayList<VO>();
			String sql = "SELECT * FROM GOODCART WHERE tid=?";			
				try(PreparedStatement pstmt = con.prepareStatement(sql)) {
					pstmt.setString(1,tid);

					try (ResultSet rs = pstmt.executeQuery()) {
			
						while (rs.next()) {

							int soo = rs.getInt("soo");
							String name = rs.getString("name");
							int i_cnt = rs.getInt("i_cnt");
							int price = rs.getInt("price");
				
							VO tv = new VO(tid, soo, name, i_cnt, price);
				
							ciarray.add(tv);
						}
			        } catch (SQLException e) {
			            e.printStackTrace();
			        }
			    } catch (SQLException e) {
			        e.printStackTrace();
			    }

			    return ciarray;
			}
		
	// 장바구니 삭제
	    public boolean CartDelete(String tid) {
	    	String sql = "DELETE FROM GOODCART WHERE tid=?";
			
	    	try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, tid);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Delete Exception");
				return false;
			}
			return true;
		}
	    
	// 장바구니 선택 삭제    
	    public int multidelete(String[] soo) {
	    	System.out.println("_--------------");
	    	System.out.println("multi-delete start");	//진행 확인용 sysout
	    	
	    	int res = 0;
	    	int[] cnt = null;
	    	
	    	String sql = "DELETE FROM GOODCART WHERE soo=?";
	    	
	    	try {
	    		pstmt=con.prepareStatement(sql);
	    		for(int i=0; i<soo.length; i++) {
	    			if(soo[i] != null) {
	    			pstmt.setString(1, soo[i]);
	    			
	    			//쿼리문 pstmt에 모두 쌓아 한번에 처리
	    			pstmt.addBatch();
	    			}
	    		}
	    		cnt = pstmt.executeBatch();
	    		//쿼리 성공 : 
	    		for(int i=0; i<cnt.length; i++) {
	    			if(cnt[i] == -2) {
	    				res++;
	    			}
	    		}
	    		//모아둔 쿼리 실행 끝나면 커밋
	    		if(soo.length == res) {
	    			con.commit();
	    		} else {
	    			con.rollback();
	    		}
	    	} catch (SQLException e) {
	    		e.printStackTrace();
	    	} finally {
	    		try {
	    			pstmt.close();
	    			con.close();
	    		} catch (SQLException e) {
	    			e.printStackTrace();
	    		}
	    	}
	    	System.out.println("multi-delete end");	//진행 확인용 sysout
	    	return res;
	    } 

		   //유저(tid)의 전체 리뷰보기=============================================
//		   public ArrayList<VO> select_all_review(String tid2) throws SQLException {
//		      ArrayList<VO> tiarray = new ArrayList<VO>();      
//		      VO tv=null;
//		          String sql = "SELECT g.area,g.name, r.* "
//		                + "FROM goodday g JOIN review r ON g.soo = r.soo WHERE r.tid = ?";   
//		          pstmt = con.prepareStatement(sql);
//		          pstmt.setString(1, tid2);
//		          rs = pstmt.executeQuery();
//		         while (rs.next()) {
//		            String area = rs.getString("area");
//		            System.out.println("area:"+area);
//		            String name = rs.getString("name");
//		            System.out.println("name:"+name);
//		            int articleNO = rs.getInt("articleNO");
//		            System.out.println("articleNO:"+articleNO);
//		            int soo = rs.getInt("soo");
//		            System.out.println("soo:"+soo);
//		            int jum = rs.getInt("jum");
//		            System.out.println("jum:"+jum);
//		            String hp = rs.getString("hp");
//		            System.out.println("hp:"+hp);
//		            String ht = rs.getString("ht");
//		            System.out.println("ht:"+ht);
//		            String rcontent = rs.getString("rcontent");
//		            System.out.println("rcontent:"+rcontent);
//		            String imgFileName = rs.getString("imgFileName");
//		            System.out.println("imgFileName:"+imgFileName);
//		            String tid = rs.getString("tid");
//		            System.out.println("tid:"+tid);
//		            int hitcnt = rs.getInt("hitcnt");
//		            System.out.println("hitcnt:"+hitcnt);
//		            String writedate = rs.getString("writedate");
//		            System.out.println("writedate:"+writedate);
//		            tv = new VO(area, name, articleNO, soo, jum, hp, ht, rcontent,
//		                  imgFileName, tid, hitcnt, writedate);
//		            tiarray.add(tv);
//		         }
//		         return tiarray;
//		   }
//		      

	
} //DAO-end
