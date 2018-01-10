package vo;

public class ListPageVO {
	private int page; // 사용자가 선택한 페이지 번호
	private int total_page; //  전체 페이지 수 
	private int start_page; // 시작 페이지
	private int end_page; // 끝나는 페이지
	private int total_rows; // 한페이지에 가져오는 행 수 
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotal_page() {
		return total_page;
	}
	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}
	public int getStart_page() {
		return start_page;
	}
	public void setStart_page(int start_page) {
		this.start_page = start_page;
	}
	public int getEnd_page() {
		return end_page;
	}
	public void setEnd_page(int end_page) {
		this.end_page = end_page;
	}
	public int getTotal_rows() {
		return total_rows;
	}
	public void setTotal_rows(int total_rows) {
		this.total_rows = total_rows;
	}
	

}
