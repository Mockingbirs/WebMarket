package db;

public class DTOboard {
	
	private String title;
	private String memo;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public DTOboard(String title, String memo) {
		super();
		this.title = title;
		this.memo = memo;
	}
	
	
	
}
