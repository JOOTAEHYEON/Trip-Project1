package vo;

import java.util.ArrayList;
import java.util.List;

public class VO {
   //회원가입 
   private String tid;
   private String pw;
   private String ttel;
   private String email;
   private int adp;
   private String ad;
   private String ad1;
   private String rtid;
   
   //상품  VO
   private int soo;
   private String area;
   private String name;
   private int price;
   private String xdo;
   private String ydo;
   private int i_cnt;

   //리뷰  VO
   //area+name (상품)
   private int articleNO; 
   //soo (상품)
   private int jum; 
   private String hp; 
   private String ht; 
   private String rcontent; 
   private String imgFileName; 
   //tid; (회원가입)
   private int hitcnt; 
   private String writedate; 
   
   //결제 
   private String imp_uid ;    //varchar2(50)1
   private String merchant_uid; //varchar2(50)2
   private String buyer_email;//3
   //private String name; 상품품번(g.soo)4
   private String buyer_tel; 
   private String amount;
   private String  buyer_name;      //varchar2(30)     
   private String buyer_addr;//varchar2(30)
   private String buyer_postcode; //상품DB
   private List<ReplyVO> replies;
 
       //장바구니
       //private int soo;
       //private String name;
      	private int cnt;   
      // private String amount;
    
      	
      // 04Detal->05confirm
       public VO (int soo, String name, int cnt, int price, String amount) {
           this.soo = soo;
           this.name = name;
           this.cnt = cnt;
           this.price = price;
           this.amount = amount;
       }

      
    
   
 //리뷰 : 결제 +시간
       public VO(int soo, String area, String name, int price , String xdo , String ydo, String imp_uid,
    	         String merchant_uid,String amount,String buyer_name,String writedate) {
    	         //super();
    	           this.soo = soo; 
    	           this.area = area;
    	           this.name = name;
    	           this.price = price;
    	           this.xdo = xdo;
    	           this.ydo = ydo;
    	           this.imp_uid = imp_uid;
    	           this.merchant_uid = merchant_uid;         
    	           this.amount = amount;
    	           this.buyer_name = buyer_name;	
    	           this.writedate = writedate;
    	}
   
   
 //리뷰: 상품+리뷰
   public VO(int soo, String area, String name, int price, String xdo, String ydo,
         int articleNO,  int jum, String hp, String ht,
            String rcontent,String imgFileName, String tid, int hitcnt, String writedate) {
      //super();
      this.soo = soo;
      this.area = area;
      this.name = name;
      this.price = price;
      this.xdo = xdo;
      this.ydo = ydo;
      this.articleNO = articleNO;
   
      this.jum = jum;
      this.hp = hp;
      this.ht = ht;
      this.rcontent = rcontent;
      this.imgFileName = imgFileName;
      this.tid = tid;
      this.hitcnt = hitcnt;
      this.writedate = writedate;
   }
   
   
   
   
   public VO() {}
   //회원가입 
   public VO(String tid, String pw, String ttel, String email, int adp, String ad, String ad1, String rtid) {
      super();
      this.tid = tid;
      this.pw = pw;
      this.ttel = ttel;
      this.email = email;
      this.adp = adp;
      this.ad = ad;
      this.ad1 = ad1;
      this.rtid = rtid;
   
      
   }
   
   //상품
   public VO(int soo, String area, String name, int price, String xdo, String ydo) {
      //super();
      this.soo = soo;
      this.area = area;
      this.name = name;
      this.price = price;
      this.xdo = xdo;
      this.ydo = ydo;
   }

    //리뷰
   public VO(String area, String name, int articleNO, int soo, int jum, String hp, String ht,
         String rcontent,String imgFileName, String tid, int hitcnt, String writedate) {
      this.area = area;
      this.name = name;
      this.articleNO = articleNO;
      this.soo = soo;
      this.jum = jum;
      this.hp = hp;
      this.ht = ht;
      this.rcontent = rcontent;
      this.imgFileName = imgFileName;
      this.tid = tid;
      this.hitcnt = hitcnt;
      this.writedate = writedate;
   }
   
   public VO( int articleNO, int soo, int jum, String hp, String ht,
	         String rcontent,String imgFileName, String tid, int hitcnt, String writedate) {
	    
	      this.articleNO = articleNO;
	      this.soo = soo;
	      this.jum = jum;
	      this.hp = hp;
	      this.ht = ht;
	      this.rcontent = rcontent;
	      this.imgFileName = imgFileName;
	      this.tid = tid;
	      this.hitcnt = hitcnt;
	      this.writedate = writedate;
	   }
	   
   
   
   //결제 :찾기 (imp_uid) 
   public VO(String imp_uid1 , String merchant_uid, String buyer_email, String name,String buyer_tel,String amount, String buyer_name, String buyer_addr, String buyer_postcode) {
	      //super();
	   	  this.imp_uid = imp_uid1; 
	   	  this.merchant_uid = merchant_uid;
	   	  this.buyer_email = buyer_email;
	   	  this.name = name;
	   	  this.buyer_tel = buyer_tel; //고객전화번호
	      this.amount = amount; //총 가격 
	      this.buyer_name = buyer_name;
	      this.buyer_addr=buyer_addr;	 
	      this.buyer_postcode = buyer_postcode;	     
	   }
   
   //결제 :찾기 (tid)  
   public VO( String imp_uid, String merchant_uid, String name, String amount, String buyer_name, String buyer_addr) {
		// TODO Auto-generated constructor stub
	   
	   this.imp_uid = imp_uid; 
	   this.merchant_uid=merchant_uid;
	   this.name = name;
	   this.amount = amount;
	   this.buyer_name=buyer_name; // 이름 
	   this.buyer_addr = buyer_addr; 
	}

   
   
   //찜목록 
   public String toString() {
		return "상품번호: " + soo + 
				", 지역: " + area + 
				", 상품명: " + name + 
				", 가격: " + price;
	}
   
   
   
   //
   
	public VO(String tid, int soo, String name, int i_cnt, int price) {
		super();
		this.tid = tid;
		this.soo = soo;
		this.name = name;
		this.i_cnt = i_cnt;
		this.price = price;
		
		
	}

 
	
	// 댓글을 추가하는 메서드
	public void addReply(ReplyVO reply) {
		if(replies == null) {
			replies = new ArrayList<>();
		}
		replies.add(reply);
	}
	
	// 댓글 목록을 가져오는 게터
	public List<ReplyVO> getReplies() {
		return replies;
	}
	
	// 댓글 목록을 설정하는 세터
	public void setReplies(List<ReplyVO> replies) {
		this.replies = replies;
	}




 

public String getTid() {
      return tid;
   }
   public void setTid(String tid) {
      this.tid = tid;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public String getTtel() {
      return ttel;
   }
   public void setTtel(String ttel) {
      this.ttel = ttel;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public int getAdp() {
      return adp;
   }
   public void setAdp(int adp) {
      this.adp = adp;
   }
   public String getAd() {
      return ad;
   }
   public void setAd(String ad) {
      this.ad = ad;
   }
   public String getAd1() {
      return ad1;
   }
   public void setAd1(String ad1) {
      this.ad1 = ad1;
   }
   public String getRtid() {
      return rtid;
   }
   public void setRtid(String rtid) {
      this.rtid = rtid;
   }

   public int getSoo() {
      return soo;
   }

   public void setSoo(int soo) {
      this.soo = soo;
   }

   public String getArea() {
      return area;
   }

   public void setArea(String area) {
      this.area = area;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getPrice() {
      return price;
   }

   public void setPrice(int price) {
      this.price = price;
   }

   public String getXdo() {
      return xdo;
   }

   public void setXdo(String xdo) {
      this.xdo = xdo;
   }

   public String getYdo() {
      return ydo;
   }

   public void setYdo(String ydo) {
      this.ydo = ydo;
   }

public int getArticleNO() {
	return articleNO;
}

public void setArticleNO(int articleNO) {
	this.articleNO = articleNO;
}

public int getJum() {
	return jum;
}

public void setJum(int jum) {
	this.jum = jum;
}

public String getHp() {
	return hp;
}

public void setHp(String hp) {
	this.hp = hp;
}

public String getHt() {
	return ht;
}

public void setHt(String ht) {
	this.ht = ht;
}

public String getRcontent() {
	return rcontent;
}

public void setRcontent(String rcontent) {
	this.rcontent = rcontent;
}

public String getImgFileName() {
	return imgFileName;
}

public void setImgFileName(String imgFileName) {
	this.imgFileName = imgFileName;
}

public int getHitcnt() {
	return hitcnt;
}

public void setHitcnt(int hitcnt) {
	this.hitcnt = hitcnt;
}

public String getWritedate() {
	return writedate;
}

public void setWritedate(String writedate) {
	this.writedate = writedate;
}




public String getImp_uid() {
	return imp_uid;
}




public void setImp_uid(String imp_uid) {
	this.imp_uid = imp_uid;
}




public String getMerchant_uid() {
	return merchant_uid;
}




public void setMerchant_uid(String merchant_uid) {
	this.merchant_uid = merchant_uid;
}




public String getAmount() {
	return amount;
}




public void setAmount(String amount) {
	this.amount = amount;
}




public String getBuyer_name() {
	return buyer_name;
}




public void setBuyer_name(String buyer_name) {
	this.buyer_name = buyer_name;
}




public int getI_cnt() {
	return i_cnt;
}




public void setI_cnt(int i_cnt) {
	this.i_cnt = i_cnt;
}




public int getCnt() {
	return cnt;
}




public void setCnt(int cnt) {
	this.cnt = cnt;
}


public String getBuyer_addr() {
	return buyer_addr;
}




public void setBuyer_addr(String buyer_addr) {
	this.buyer_addr = buyer_addr;
}




public String getBuyer_email() {
	return buyer_email;
}




public void setBuyer_email(String buyer_email) {
	this.buyer_email = buyer_email;
}




public String getBuyer_tel() {
	return buyer_tel;
}




public void setBuyer_tel(String buyer_tel) {
	this.buyer_tel = buyer_tel;
}




public String getBuyer_postcode() {
	return buyer_postcode;
}




public void setBuyer_postcode(String buyer_postcode) {
	this.buyer_postcode = buyer_postcode;
}











   
   
   

}