package svc;

public class WishlistItem {
	
	private String soo;
	private String area;
	private String name;
	private String price;
	
	public WishlistItem(String soo, String area, String name, String price) {
		
		this.soo = soo;
		this.area = area;
		this.name = name;
		this.price = price;
		
	}
	
	public String getSoo() {
		return soo;
	}
	public void setSoo(String soo) {
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
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	
	
	public String toString() {
		return "상품번호: " + soo + 
				", 지역: " + area + 
				", 상품명: " + name + 
				", 가격: " + price;
	}
	
}
