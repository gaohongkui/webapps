package newsPub.beans;

public class News {
	private Integer id;
	private String title;
	private String content;
	private String author;
	private String pubtime;
	private String keyword;
	private String note;
	private Integer newstype;
	private Integer acnumber;

	public News() {
	}

	public News(String title, String content, String author, String pubtime, String keyword, String note) {
		super();
		this.title = title;
		this.content = content;
		this.author = author;
		this.pubtime = pubtime;
		this.keyword = keyword;
		this.note = note;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPubtime() {
		return pubtime;
	}

	public void setPubtime(String pubtime) {
		this.pubtime = pubtime;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Integer getNewstype() {
		return newstype;
	}

	public void setNewstype(Integer newstype) {
		this.newstype = newstype;
	}

	public Integer getAcnumber() {
		return acnumber;
	}

	public void setAcnumber(Integer acnumber) {
		this.acnumber = acnumber;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
