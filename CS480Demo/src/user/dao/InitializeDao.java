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
				              + "user=jon&password=Tomoko");
		    //String sql = "select * from tb_user where username=?";
			
			statement = connect.createStatement();
			statement.executeUpdate("drop table if exists tb_user");
			
			String sqlStatement1 = "create table if not exists tb_user (" +
					"user_name VARCHAR(16) primary key," + 
					"`password` VARCHAR(32) not null," + 
					"first_name varchar(32) not null," + 
					"last_name varchar(32) not null," + 
					"is_admin tinyint(1)," + 
					"need_visa_sponsor tinyint(1) not null default 1," + 
					"language_proficiency varchar(16)" + 
					");"
					;
			
			statement.executeUpdate(sqlStatement1);
			
		    
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
		
}
