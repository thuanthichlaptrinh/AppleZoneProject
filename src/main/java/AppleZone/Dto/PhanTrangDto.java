package AppleZone.Dto;

public class PhanTrangDto {
	private int currenPage, limit, start, end, totalPage;
	 
	public PhanTrangDto() {
		super();
	} 

	public PhanTrangDto(int currenPage, int limit, int start, int end, int totalPage) {
		super();
		this.currenPage = currenPage;
		this.limit = limit;
		this.start = start;
		this.end = end;
		this.totalPage = totalPage;
	} 

	public int getCurrenPage() {
		return currenPage;
	}

	public void setCurrenPage(int currenPage) {
		this.currenPage = currenPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
