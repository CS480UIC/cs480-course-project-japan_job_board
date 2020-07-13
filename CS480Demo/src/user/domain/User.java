package user.domain;

/**
 * User object
 * 
 * @author changxin bai
 * 
 */
public class User {
	/*
	 * Correspond to the user table
	 */
	
	private String username;
	private String password; 
	private String first_name;
	private String last_name;
	private String is_admin;
	private String need_visa_sponsor;
	private String language_proficiency;
	

	
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

	public String getFirstName() {
		return first_name;
	}

	public void setFirstName(String first_name) {
		this.first_name = first_name;
	}
	
	public String getLastName() {
		return last_name;
	}

	public void setLastName(String last_name) {
		this.last_name = last_name;
	}
	
	public String getIsAdmin() {
		return is_admin;
	}

	public void setIsAdmin(String is_admin) {
		this.is_admin = is_admin;
	}
	
	public String getNeedVisaSponsor() {
		return need_visa_sponsor;
	}
	
	public void setNeedVisaSponsor(String need_visa_sponsor) {
		this.need_visa_sponsor = need_visa_sponsor;
	}
	
	public String getLanguageProficiency() {
		return language_proficiency;
	}
	
	public void setLanguageProficiency(String language_proficiency) {
		this.language_proficiency = language_proficiency;
	}
	
	@Override
	public String toString() {
		return "User [ username=" + username + ", password="
				+ password + ", first_name=" + first_name + 
				", last_name="+ last_name +
				", is_admin="+ is_admin +
				", language_proficiency="+ language_proficiency +
				", need_visa_sponsor="+ need_visa_sponsor
				+ "]";
	}
}
