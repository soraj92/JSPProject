package vo;

public class BoardVO {
	private int board_num;
	private String board_subject;
	private int price;
	private int choice_way;
	private String buyday;
	private String space;
	private String information;
	private String file;
	
	
	
	public BoardVO(int board_num, String board_subject, int price, int choice_way, String buyday, String space,
			String information, String file) {
		super();
		this.board_num = board_num;			this.board_subject = board_subject;
		this.price = price;					this.choice_way = choice_way;
		this.buyday = buyday;				this.space = space;
		this.information = information;		this.file = file;
	}
	public int getBoard_num() {return board_num;}
	public void setBoard_num(int board_num) {this.board_num = board_num;}
	public String getBoard_subject() {return board_subject;}
	public void setBoard_subject(String board_subject) {this.board_subject = board_subject;}
	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}
	public int getChoice_way() {return choice_way;}
	public void setChoice_way(int choice_way) {this.choice_way = choice_way;}
	public String getBuyday() {return buyday;}
	public void setBuyday(String buyday) {this.buyday = buyday;}
	public String getSpace() {return space;}
	public void setSpace(String space) {this.space = space;}
	public String getInformation() {return information;}
	public void setInformation(String information) {this.information = information;}
	public String getFile() {return file;}
	public void setFile(String file) {this.file = file;}

	
}
