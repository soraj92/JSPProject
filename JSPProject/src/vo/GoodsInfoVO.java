package vo;

public class GoodsInfoVO {
	// 상품 등록시 들어가는 정보들 
	private int list_num; // 글 번호
	private String username; // 작성자
	private String goods_name; // 상품명
	private int price; // 희망가격
	private String product_type; // 카테고리별 상품 분류
	private String purchasing_time; // 구입한 시기
	private String trade_area; // 거래지역
	private String img; // 첨부사진
	private String txt_date;// 글작성날짜
	private String goods_info;// 상품 설명
	private int txt_count; // 조회수
	
	public int getList_num() {
		return list_num;
	}
	public void setList_num(int list_num) {
		this.list_num = list_num;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProduct_type() {
		return product_type;
	}
	public void setProduct_type(String product_type) {
		this.product_type = product_type;
	}
	public String getPurchasing_time() {
		return purchasing_time;
	}
	public void setPurchasing_time(String purchasing_time) {
		this.purchasing_time = purchasing_time;
	}
	public String getTrade_area() {
		return trade_area;
	}
	public void setTrade_area(String trade_area) {
		this.trade_area = trade_area;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTxt_date() {
		return txt_date;
	}
	public void setTxt_date(String txt_date) {
		this.txt_date = txt_date;
	}
	public String getGoods_info() {
		return goods_info;
	}
	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
	}
	public int getTxt_count() {
		return txt_count;
	}
	public void setTxt_count(int txt_count) {
		this.txt_count = txt_count;
	}
	
	
	
}
