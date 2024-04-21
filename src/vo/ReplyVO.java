package vo;
public class ReplyVO {
	private int no;
	private int articleNo;
	private String content;
	private String tid;
	private String rwritedate;
	
	
	
	public ReplyVO(int articleNo, String content, String tid, String rwritedate) {
		// TODO Auto-generated constructor stub
		this.articleNo = articleNo;
		this.content = content;
		this.tid = tid;
		this.rwritedate = rwritedate;
	}
	// 게터, 세터	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getRwritedate() {
		return rwritedate;
	}
	public void setRwritedate(String rwritedate) {
		this.rwritedate = rwritedate;
	}
	// 게터, 세터 끝
	

}
