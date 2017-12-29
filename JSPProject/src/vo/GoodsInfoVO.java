package vo;

public class GoodsInfoVO {
	// 상품 등록시 들어가는 정보들 
	private int board_num; // 글 번호
	private String username; // 작성자
	private String board_subject; // 글제목
	private int price; // 희망가격
	private int choice_way;// 직거래 택배거래 선택 
	private String product_type; // 카테고리별 상품 분류
	private String purchasing_time; // 구입한 시기
	private String trade_area; // 거래지역
	private String img; // 첨부사진
	private String board_date;// 글작성날짜
	private String goods_info;// 상품 설명
	private int board_count; // 조회수
	
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getChoice_way() {
		return choice_way;
	}
	public void setChoice_way(int choice_way) {
		this.choice_way = choice_way;
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
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getGoods_info() {
		return goods_info;
	}
	public void setGoods_info(String goods_info) {
		this.goods_info = goods_info;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	

	
}