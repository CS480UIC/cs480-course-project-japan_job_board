package user.domain;

/**
 * User object
 * 
 * @author changxin bai
 * 
 */
public class Job {
	/*
	 * Correspond to the user table
	 */
	
	private String job_id;
	private String job_title;
	private String job_location;
	private String job_salary;
	private String job_language;
	private String job_company;
	private String job_description;
	private String job_residence;
	private String job_employment;
	
	public String getJobID() {
		return job_id;
	}

	public void setJobID(String job_id) {
		this.job_id = job_id;
	}

	public String getJobTitle() {
		return job_title;
	}

	public void setJobTitle(String job_title) {
		this.job_title = job_title;
	}

	public String getJobLocation() {
		return job_location;
	}

	public void setJobLocation(String job_location) {
		this.job_location = job_location;
	}
	
	public String getJobSalary() {
		return job_salary;
	}

	public void setJobSalary(String job_salary) {
		this.job_salary = job_salary;
	}
	
	public String getJobLanguage() {
		return job_language;
	}

	public void setJobLanguage(String job_language) {
		this.job_language = job_language;
	}
	
	public String getJobCompany() {
		return job_company;
	}

	public void setJobCompany(String job_company) {
		this.job_company = job_company;
	}
	
	public String getJobDescription() {
		return job_description;
	}

	public void setJobDescription(String job_description) {
		this.job_description = job_description;
	}
	
	public String getJobResidence() {
		return job_residence;
	}

	public void setJobResidence(String job_residence) {
		this.job_residence = job_residence;
	}
	
	public String getJobEmploymentn() {
		return job_employment;
	}

	public void setJobEmployment(String job_employment) {
		this.job_employment = job_employment;
	}


	@Override
	public String toString() {
		return "User [ jobID=" + job_id + ", job_title="
				+ job_title + ", job_location=" + job_location + 
				", job_salary="+ job_salary +
				", job_language="+ job_language +
				", job_company="+ job_company +
				", job_description="+ job_description +
				", job_residence="+ job_residence +
				", job_employment="+ job_employment
				+ "]";
	}
	
}
