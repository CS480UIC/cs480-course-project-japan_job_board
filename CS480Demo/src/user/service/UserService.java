package user.service;

import java.util.List;

import user.dao.UserDao;
import user.domain.Company;
import user.domain.Job;
import user.domain.User;

/**
 * logic functions such as register, login
 * @author changxin bai
 *
 */
public class UserService {
	private UserDao userDao = new UserDao();
	
	/**
	 * register a user
	 * @param form
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public void regist(User form) throws UserException, ClassNotFoundException, InstantiationException, IllegalAccessException{
		
		// check the user name
		User user = userDao.findByUsername(form.getUsername());
		if(user.getUsername()!=null && user.getUsername().equals(form.getUsername())) throw new UserException("This user name has been registered!");
		userDao.add(form);
	}
	
	public void addCompany(Company form) throws UserException, ClassNotFoundException, InstantiationException, IllegalAccessException{
		
		Company company = userDao.findByUsernameCompany(form.getUsername());
		if(company.getUsername()!=null && company.getUsername().equals(form.getUsername())) throw new UserException("This user name has been registered!");
		userDao.addCompany(form);
	}
	
	public void addJob(Job form) throws UserException, ClassNotFoundException, InstantiationException, IllegalAccessException{
		
		//Job job = userDao.findByUsernameCompany(form.getUsername());
		//if(company.getUsername()!=null && company.getUsername().equals(form.getUsername())) throw new UserException("This user name has been registered!");
		userDao.addJob(form);
	}
	
	public void update(User form, String oldUsername) throws UserException, ClassNotFoundException, InstantiationException, IllegalAccessException{
		
		System.out.println("form getname:" + form.getUsername());
		System.out.println("old username:" + oldUsername);
		
		if(oldUsername.equals(form.getUsername())) {
			userDao.update(form, oldUsername);
		}
		
		else {
			System.out.println("INSIDE ELSE IN UPDATE");
			User user = userDao.findByUsername(form.getUsername());
			if(user.getUsername()!=null && user.getUsername().equals(form.getUsername())) throw new UserException("This user name has been registered!");
			userDao.update(form, oldUsername);
		}
		//userDao.update(form);
	}
	
	public void updateComp(Company form, String oldUsername) throws UserException, ClassNotFoundException, InstantiationException, IllegalAccessException{
		
		System.out.println("form getname:" + form.getUsername());
		System.out.println("old username:" + oldUsername);
		
		if(oldUsername.equals(form.getUsername())) {
			userDao.updateComp(form, oldUsername);
		}
		
		else {
			System.out.println("INSIDE ELSE IN UPDATE");
			Company user = userDao.findByUsernameCompany(form.getUsername());
			if(user.getUsername()!=null && user.getUsername().equals(form.getUsername())) throw new UserException("This user name has been registered!");
			userDao.updateComp(form, oldUsername);
		}
		//userDao.update(form);
	}
	
	
	/**
	 * Login function
	 * @param form
	 * @return
	 * @throws UserException 
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public void login(User form) throws UserException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		User user = userDao.findByUsername(form.getUsername());
		if(user.getUsername()==null) throw new UserException("The user is not in the database");
		
		String password = user.getPassword();
		
		if(password!=null && !password.equals(form.getPassword()))
			throw new UserException(" The password is not right");
		
	}
	
	public List<Object> findall() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		return userDao.findall();
	}
	
	public List<Object> findallCompany() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		return userDao.findallCompany();
	}
	
	public List<Object> findallJob() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		return userDao.findallJob();
	}
	public List<Object> findallNotTokyoJob() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		return userDao.findallNotInTokyoJob();
	}
	public List<Object> findallnoVulgarCBio() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		return userDao.findallnoVulgarCBio();
	}
	public List<Object> findallnoVulgarUUsername() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		return userDao.findallnoVulgarUsername();
	}
}
