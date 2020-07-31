package user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import user.domain.User;

public class InitializeDao {
	
	public void initDB() {
		Statement statement;
		try {
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=America/Chicago");
		    //String sql = "select * from tb_user where username=?";
			
			statement = connect.createStatement();
			statement.executeUpdate("drop table if exists tb_user");
			statement.executeUpdate("drop table if exists tb_company");
			statement.executeUpdate("drop table if exists tb_job");

			
			/* create tb_user table */
			
			String sqlStatement1 = "create table if not exists tb_user (" +
					"username VARCHAR(16) primary key," + 
					"`password` VARCHAR(32) not null," + 
					"first_name varchar(32) not null," + 
					"last_name varchar(32) not null," + 
					"is_admin tinyint(1)," + 
					"need_visa_sponsor tinyint(1) not null default 1," + 
					"language_proficiency varchar(16)" + 
					");"
					;
			String sqlAdd1 = "insert into tb_user(username, password, first_name, last_name, is_admin, need_visa_sponsor, language_proficiency) values ('mitsuo8', 'blue', 'Amber', 'Sanfilip', 0, 0, 'JLPT N5'), ('pokemon_master', 'mew', 'Brock', 'Onix', 0, 1, 'Moot'), ('Excel', 'Tomoko', 'Jon', 'Vega', 1, 0, 'JLPT N4');";
			
			statement.executeUpdate(sqlStatement1);
			
			/* create tb_company table */
			
			String sqlStatement2 = "create table if not exists tb_company(" + 
					"username varchar(16) primary key," + 
					"password varchar(32) not null," + 
					"company_name varchar(64) not null," + 
					"company_location varchar(64) not null," + 
					"company_bio text," + 
					"company_size int" +
					");"
					;
			
			String sqlAdd2 = "insert into tb_company(username, password, company_name, company_location, company_bio, company_size) values ('rareware', 'banjo', 'Rare LTD.', 'Tokyo, Japan', 'We take too long in creating games from Xbox, and need people to get us going again!', '500'), ('lawson', 'food', 'Lawson', 'Koriyama, Japan', 'We never close...', '3000'), ('loteria', 'melonsoda', 'Loteria', 'Iwaki, Japan', 'Insert something about chicken here', '1000');";
			
			statement.executeUpdate(sqlStatement2);
			
			/* create tb_job table */
			
			String sqlStatement3 = "create table if not exists tb_job(" + 
					"job_id int auto_increment primary key," + 
					"job_title varchar(64) not null," + 
					"job_location varchar(64) not null," + 
					"job_salary int," + 
					"job_language varchar(32)," + 
					"job_company varchar(64) not null," + 
					"job_description text," + 
					"job_residence varchar(32)," +
					"job_employment varchar(16) not null" +
					");"
					;
			
			String sqlAdd3 = "insert into tb_job(job_title, job_location, job_salary, job_language, job_company, job_description, job_residence, job_employment) values ('Game Programmer', 'Tokyo, Japan', 4000000, 'JLPT N3', 'Rare LTD.', 'Game Engine Programmer for upcoming water based game on Xbox Series X and S consoles. Must be good with C++ and low-level languages', 'Japan Residents Only', 'Full-Time'), ('Clerk', 'Koriyama, Japan', 2500000, 'JLPT N2', 'Lawson', 'Assist in the stocking and checking out in our chain of convenience stores', 'Japan Residents Only', 'Part-Time'), ('Yoga Instructor', 'Iwaki, Japan', 3000000, 'JLPT N2', 'Prim Algo', 'Coach our clients to find inner peace and harmony', 'Will Sponsor Visa', 'Full-Time');";
			
			statement.executeUpdate(sqlStatement3);
			statement.executeUpdate(sqlAdd1);
			statement.executeUpdate(sqlAdd2);
			statement.executeUpdate(sqlAdd3);


		    
		} catch(SQLException e) {
			throw new RuntimeException(e);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * insert User
	 * @param user
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	/*
	public void add(User user) throws ClassNotFoundException, InstantiationException, IllegalAccessException {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko");
			
			
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
	
	
	public List<Object> findall() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		List<Object> list = new ArrayList<>();
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection connect = DriverManager
			          .getConnection("jdbc:mysql://localhost:3306/cs480project?"
				              + "user=jon&password=Tomoko");
			
			
			String sql = "select * from tb_user";
			PreparedStatement preparestatement = connect.prepareStatement(sql); 
			ResultSet resultSet = preparestatement.executeQuery();
			
			while(resultSet.next()){
				User user = new User();
				user.setUsername(resultSet.getString("username"));
	    		user.setPassword(resultSet.getString("password"));
	    		user.setFirstName(resultSet.getString("first_name"));
	    		user.setLastName(resultSet.getString("last_name"));
	    		list.add(user);
			 }
			 
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
		return list;
		
	}
		*/
}
