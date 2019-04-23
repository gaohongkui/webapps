package news.beans;

public class User implements java.io.Serializable {
	private Integer id;
	private String username;
	private String password;
	private String userType;
	private String gender;
	private String resume;

	public User(String username, String password, String userType, String gender, String resume) {
		super();
		this.username = username;
		this.password = password;
		this.userType = userType;
		this.gender = gender;
		this.resume = resume;
	}

	public User() {
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public Integer getId() {
		return id;
	}

}
