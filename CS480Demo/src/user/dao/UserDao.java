package user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




import java.util.ArrayList;
import java.util.List;

import user.domain.Company;
import user.domain.Job;
import user.domain.User;



/**
 * DDL functions performed in database
 * @author changxin bai
 *
 */
public class UserDao {
	
	
	/**
	 * get the search result with username 
	 * @param username
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public User findByUsername(String username) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		User user = new User();
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://141.217.48.128:3306/dataview?"
				              + "user=shiyong&password=view1234");
			*/
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
		    String sql = "select * from tb_user where username=?";
		    PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,username);
		    ResultSet resultSet = preparestatement.executeQuery();
		    //ResultSet resultSet  = preparestatement.executeUpdate();
		    while(resultSet.next()){
		    	String user_name = resultSet.getString("username");
		    			    	
		    	if(user_name.equals(username)){
		    		user.setUsername(resultSet.getString("username"));
		    		user.setPassword(resultSet.getString("password"));
		    		user.setFirstName(resultSet.getString("first_name"));
		    		user.setLastName(resultSet.getString("last_name"));
		    		user.setIsAdmin(resultSet.getString("is_admin"));
		    		user.setNeedVisaSponsor(resultSet.getString("need_visa_sponsor"));
		    		user.setLanguageProficiency(resultSet.getString("language_proficiency"));
		    	}
		    }
		
		    
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return user;
	}
	
	public Company findByUsernameCompany(String uname) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		Company company = new Company();
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://141.217.48.128:3306/dataview?"
				              + "user=shiyong&password=view1234");
			*/
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
		    
		    System.out.println(uname);

			String sql = "select * from tb_company where username=?";
		    PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,uname);
		    
		    System.out.println("->" + sql);
		    ResultSet resultSet = preparestatement.executeQuery();
		    //ResultSet resultSet  = preparestatement.executeUpdate();
		    while(resultSet.next()){
		    	String user_name = resultSet.getString("username");
		    			    	
		    	if(user_name.equals(uname)){
		    		company.setUsername(resultSet.getString("username"));
		    		company.setPassword(resultSet.getString("password"));
		    		company.setCompanyName(resultSet.getString("company_name"));
		    		company.setCompanyLocation(resultSet.getString("company_location"));
		    		company.setCompanyBio(resultSet.getString("company_bio"));
		    		company.setCompanySize(resultSet.getString("company_size"));
		    	}
		    }
		
		    
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return company;
	}
	
	
	/**
	 * insert User
	 * @param user
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public void add(User user) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "insert into tb_user values(?,?,?,?,?,?,?)";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,user.getUsername());
		    preparestatement.setString(2,user.getPassword());
		    preparestatement.setString(3,user.getFirstName());
		    preparestatement.setString(4, user.getLastName());
		    preparestatement.setString(5, user.getIsAdmin());
		    preparestatement.setString(6, user.getNeedVisaSponsor());
		    preparestatement.setString(7, user.getLanguageProficiency());
		    preparestatement.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void addCompany(Company company) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "insert into tb_company values(?,?,?,?,?,?)";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,company.getUsername());
		    preparestatement.setString(2,company.getPassword());
		    preparestatement.setString(3,company.getCompanyName());
		    preparestatement.setString(4,company.getCompanyLocation());
		    preparestatement.setString(5,company.getCompanyBio());
		    preparestatement.setString(6,company.getCompanySize());
		    System.out.println("->" + sql);
		    preparestatement.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void addJob(Job job) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "insert into tb_job values(NULL,?,?,?,?,?,?,?,?)";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,job.getJobTitle());
		    preparestatement.setString(2,job.getJobLocation());
		    preparestatement.setString(3,job.getJobSalary());
		    preparestatement.setString(4,job.getJobLanguage());
		    preparestatement.setString(5,job.getJobCompany());
		    preparestatement.setString(6,job.getJobDescription());
		    preparestatement.setString(7,job.getJobResidence());
		    preparestatement.setString(8,job.getJobEmploymentn());
		    System.out.println("->" + sql);
		    preparestatement.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	//UPDATE users SET email = 'freddy@gmail.com' WHERE id = 2;
	//UPDATE table1 SET location=?, name=?, conference=?, division=? WHERE teamID=?

	public void update(User user, String oldUsername) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "UPDATE tb_user SET username=?, password=?, first_name=?, last_name=?, is_admin=?, need_visa_sponsor=?, language_proficiency=? WHERE username=?";
			System.out.println("[from userDao]user: " + user);
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,user.getUsername());
		    preparestatement.setString(2,user.getPassword());
		    preparestatement.setString(3,user.getFirstName());
		    preparestatement.setString(4, user.getLastName());
		    preparestatement.setString(5, user.getIsAdmin());
		    
		    preparestatement.setString(6, user.getNeedVisaSponsor());
		    preparestatement.setString(7, user.getLanguageProficiency());
		    preparestatement.setString(8, oldUsername);
		    System.out.println("[preparestatement]: " + preparestatement);
		    preparestatement.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void updateComp(Company user, String oldUsername) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "UPDATE tb_company SET username=?, password=?, company_name=?, company_location=?, company_bio=?, company_size=? WHERE username=?";
			System.out.println("[from userDao]user: " + user);
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
		    preparestatement.setString(1,user.getUsername());
		    preparestatement.setString(2,user.getPassword());
		    preparestatement.setString(3,user.getCompanyName());
		    preparestatement.setString(4, user.getCompanyLocation());
		    preparestatement.setString(5, user.getCompanyBio());
		    preparestatement.setString(6, user.getCompanySize());
		    preparestatement.setString(7, oldUsername);
		    System.out.println("[preparestatement]: " + preparestatement);
		    preparestatement.executeUpdate();
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	public List<Object> findall() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "select * from tb_user";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			
			while(resultSet.next()){
				User user = new User();
	    		user.setUsername(resultSet.getString("username"));
	    		user.setPassword(resultSet.getString("password"));
	    		user.setFirstName(resultSet.getString("first_name"));
	    		user.setLastName(resultSet.getString("last_name"));
	    		user.setIsAdmin(resultSet.getString("is_admin"));
	    		user.setNeedVisaSponsor(resultSet.getString("need_visa_sponsor"));
	    		user.setLanguageProficiency(resultSet.getString("language_proficiency"));
	    		list.add(user);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	
	public List<Object> findallnoVulgarUsername() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "select distinct * from tb_user where upper(username) like upper('%ass%') or upper(username) like upper('%fuck%') or upper(username) like upper('%bitch%')  order by username desc";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			
			while(resultSet.next()){
				User user = new User();
	    		user.setUsername(resultSet.getString("username"));
	    		user.setPassword(resultSet.getString("password"));
	    		user.setFirstName(resultSet.getString("first_name"));
	    		user.setLastName(resultSet.getString("last_name"));
	    		user.setIsAdmin(resultSet.getString("is_admin"));
	    		user.setNeedVisaSponsor(resultSet.getString("need_visa_sponsor"));
	    		user.setLanguageProficiency(resultSet.getString("language_proficiency"));
	    		list.add(user);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	
	public List<Object> findallCompany() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "select * from tb_company";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			
			while(resultSet.next()){
				Company company = new Company();
	    		company.setUsername(resultSet.getString("username"));
	    		company.setPassword(resultSet.getString("password"));
	    		company.setCompanyName(resultSet.getString("company_name"));
	    		company.setCompanyLocation(resultSet.getString("company_location"));
	    		company.setCompanyBio(resultSet.getString("company_bio"));
	    		company.setCompanySize(resultSet.getString("company_size"));
	    		list.add(company);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	
	public List<Object> findallnoVulgarCBio() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "select distinct * from tb_company where upper(company_bio) like upper('%ass%') or upper(company_bio) like upper('%fuck%') or upper(company_bio) like upper('%bitch%')";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			
			while(resultSet.next()){
				Company company = new Company();
	    		company.setUsername(resultSet.getString("username"));
	    		company.setPassword(resultSet.getString("password"));
	    		company.setCompanyName(resultSet.getString("company_name"));
	    		company.setCompanyLocation(resultSet.getString("company_location"));
	    		company.setCompanyBio(resultSet.getString("company_bio"));
	    		company.setCompanySize(resultSet.getString("company_size"));
	    		list.add(company);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	
	public List<Object> findallJob() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "select * from tb_job";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			
			while(resultSet.next()){
				Job job = new Job();
	    		job.setJobID(resultSet.getString("job_id"));
	    		job.setJobTitle(resultSet.getString("job_title"));
	    		job.setJobLocation(resultSet.getString("job_location"));
	    		job.setJobSalary(resultSet.getString("job_salary"));
	    		job.setJobLanguage(resultSet.getString("job_language"));
	    		job.setJobCompany(resultSet.getString("job_company"));
	    		job.setJobDescription(resultSet.getString("job_description"));
	    		job.setJobResidence(resultSet.getString("job_residence"));
	    		job.setJobEmployment(resultSet.getString("job_employment"));
	    		list.add(job);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	
	public List<Object> viewSizeLess501Jobs() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "select * from tb_job inner join tb_company on tb_job.job_company=tb_company.username where company_size <= 500";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
    		System.out.println(resultSet);
			while(resultSet.next()){
				Job job = new Job();
	    		job.setJobID(resultSet.getString("job_id"));
	    		job.setJobTitle(resultSet.getString("job_title"));
	    		job.setJobLocation(resultSet.getString("job_location"));
	    		job.setJobSalary(resultSet.getString("job_salary"));
	    		job.setJobLanguage(resultSet.getString("job_language"));
	    		job.setJobCompany(resultSet.getString("job_company"));
	    		job.setJobDescription(resultSet.getString("job_description"));
	    		job.setJobResidence(resultSet.getString("job_residence"));
	    		job.setJobEmployment(resultSet.getString("company_size"));
	    		list.add(job);
	    		System.out.println(job);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	
	public List<Object> viewAllProgrammingJobs() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			
			String sql = "select * from tb_job inner join tb_company on tb_job.job_company=tb_company.username where upper(job_title) like upper('%programmer%');";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
    		System.out.println(resultSet);
			while(resultSet.next()){
				Job job = new Job();
	    		job.setJobID(resultSet.getString("job_id"));
	    		job.setJobTitle(resultSet.getString("job_title"));
	    		job.setJobLocation(resultSet.getString("job_location"));
	    		job.setJobSalary(resultSet.getString("job_salary"));
	    		job.setJobLanguage(resultSet.getString("job_language"));
	    		job.setJobCompany(resultSet.getString("job_company"));
	    		job.setJobDescription(resultSet.getString("job_description"));
	    		job.setJobResidence(resultSet.getString("company_location"));
	    		job.setJobEmployment(resultSet.getString("company_bio"));
	    		list.add(job);
	    		System.out.println(job);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	
	public List<Object> viewLanguageGoodFromKoriyama() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			System.out.println("in");
			String sql = "select * from tb_job inner join tb_company on tb_job.job_company=tb_company.username where job_language in ('JLPT N1', 'JLPT N2', 'Native') and company_location='Koriyama, Japan'";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			while(resultSet.next()){
				Job job = new Job();
	    		job.setJobID(resultSet.getString("job_id"));
	    		job.setJobTitle(resultSet.getString("job_title"));
	    		job.setJobLocation(resultSet.getString("job_location"));
	    		job.setJobSalary(resultSet.getString("job_salary"));
	    		job.setJobLanguage(resultSet.getString("job_language"));
	    		job.setJobCompany(resultSet.getString("company_name"));
	    		job.setJobDescription(resultSet.getString("job_description"));
	    		job.setJobResidence(resultSet.getString("job_residence"));
	    		job.setJobEmployment(resultSet.getString("job_employment"));
	    		list.add(job);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}
	
	public List<Object> viewStartWithPNoNeedLiveInJapan() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<Object>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
			
			System.out.println("in");
			String sql = "select * from tb_job inner join tb_company on tb_job.job_company=tb_company.username where job_residence='Will Sponsor Visa' and company_name like 'P%'";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			while(resultSet.next()){
				Job job = new Job();
	    		job.setJobID(resultSet.getString("job_id"));
	    		job.setJobTitle(resultSet.getString("job_title"));
	    		job.setJobLocation(resultSet.getString("job_location"));
	    		job.setJobSalary(resultSet.getString("job_salary"));
	    		job.setJobLanguage(resultSet.getString("job_language"));
	    		job.setJobCompany(resultSet.getString("company_name"));
	    		job.setJobDescription(resultSet.getString("job_description"));
	    		job.setJobResidence(resultSet.getString("job_residence"));
	    		job.setJobEmployment(resultSet.getString("company_name"));
	    		list.add(job);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
	}

public void deleteUser(String username) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
	try {
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		/*
		Connection connect = DriverManager
		          .getConnection("jdbc:mysql://141.217.48.128:3306/dataview?"
			              + "user=shiyong&password=view1234");
		*/
		Connection connect = DriverManager
		          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
			              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
	    String sql = "delete from tb_user where username=?";
	    PreparedStatement preparestatement = connect.prepareStatement(sql); 
	    preparestatement.setString(1,username);
	    //ResultSet resultSet = preparestatement.executeQuery();
	    preparestatement.executeUpdate();
	
	    
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

public void deleteCompany(String username) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
	try {
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		/*
		Connection connect = DriverManager
		          .getConnection("jdbc:mysql://141.217.48.128:3306/dataview?"
			              + "user=shiyong&password=view1234");
		*/
		Connection connect = DriverManager
		          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
			              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
	    String sql = "delete from tb_company where username=?";
	    PreparedStatement preparestatement = connect.prepareStatement(sql); 
	    preparestatement.setString(1,username);
	    //ResultSet resultSet = preparestatement.executeQuery();
	    preparestatement.executeUpdate();
	
	    
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

public void deleteJob(String jobid) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
	try {
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		/*
		Connection connect = DriverManager
		          .getConnection("jdbc:mysql://141.217.48.128:3306/dataview?"
			              + "user=shiyong&password=view1234");
		*/
		Connection connect = DriverManager
		          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
			              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
	    String sql = "delete from tb_job where job_id=?";
	    PreparedStatement preparestatement = connect.prepareStatement(sql); 
	    preparestatement.setString(1,jobid);
	    //ResultSet resultSet = preparestatement.executeQuery();
	    System.out.println("[preparestatement]: " + preparestatement);
	    preparestatement.executeUpdate();
	
	    
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
}

public List<Object> findallNotInTokyoJob() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
	List<Object> list = new ArrayList<Object>();
	try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connect = DriverManager
		          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
			              + "user=jon&password=Tomoko&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
		
		
		String sql = "select * from tb_job where not job_location='Tokyo, Japan'";
		PreparedStatement preparestatement = connect.prepareStatement(sql); 
		ResultSet resultSet = preparestatement.executeQuery();
		
		while(resultSet.next()){
			Job job = new Job();
    		job.setJobID(resultSet.getString("job_id"));
    		job.setJobTitle(resultSet.getString("job_title"));
    		job.setJobLocation(resultSet.getString("job_location"));
    		job.setJobSalary(resultSet.getString("job_salary"));
    		job.setJobLanguage(resultSet.getString("job_language"));
    		job.setJobCompany(resultSet.getString("job_company"));
    		job.setJobDescription(resultSet.getString("job_description"));
    		job.setJobResidence(resultSet.getString("job_residence"));
    		job.setJobEmployment(resultSet.getString("job_employment"));
    		list.add(job);
		 }
		 
	} catch(SQLException e) {
		throw new RuntimeException(e);
	}
	return list;
}

}

/*

    public void deleteUser(int userId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("delete from users where userid=?");
            // Parameters start with 1
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


 */
