package user.domain;

/**
 * User object
 * 
 * @author changxin bai
 * 
 */
public class Company {
	/*
	 * Correspond to the user table
	 */
	
	private String username;
	private String password; 
	private String company_name;
	private String company_location;
	private String company_bio;
	private String company_size;
	
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

	public String getCompanyName() {
		return company_name;
	}

	public void setCompanyName(String company_name) {
		this.company_name = company_name;
	}
	
	public String getCompanyLocation() {
		return company_location;
	}

	public void setCompanyLocation(String company_location) {
		this.company_location = company_location;
	}
	
	public String getCompanyBio() {
		return company_bio;
	}

	public void setCompanyBio(String company_bio) {
		this.company_bio = company_bio;
	}
	
	public String getCompanySize() {
		return company_size;
	}

	public void setCompanySize(String company_size) {
		this.company_size = company_size;
	}

	@Override
	public String toString() {
		return "User [ username=" + username + ", password="
				+ password + ", company_name=" + company_name + 
				", company_location="+ company_location +
				", company_bio="+ company_bio +
				", company_size="+ company_size
				+ "]";
	}
	
}
