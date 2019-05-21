package newsPub.beans;

import java.io.Serializable;

public class News implements Serializable {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String title;
	private String content;
	private String author;
	private String pubtime;
	private String keyword;
	private String note;
	private Integer newstype;
	private String type;// 具体的类型
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	@Override
	public String toString() {
		return "News [id=" + id + ", title=" + title + ", content=" + content + ", author=" + author + ", pubtime="
				+ pubtime + ", keyword=" + keyword + ", note=" + note + ", newstype=" + newstype + ", type=" + type
				+ ", acnumber=" + acnumber + "]";
	}

}
