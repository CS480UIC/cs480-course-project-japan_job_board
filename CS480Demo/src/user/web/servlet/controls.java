package user.web.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.jws.WebService;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.dao.ControlDao;
import user.dao.UserDao;
import user.domain.Company;
import user.domain.Job;
import user.domain.User;
import user.service.UserException;
import user.service.UserService;

/**
 * Servlet implementation class UserServlet
 */

public class controls extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controls() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		ControlDao newObj = new ControlDao();
		newObj.controlDB();
		request.getRequestDispatcher("/jsps/main.jsp").forward(request, response);
		*/
    	//System.out.println(request.getParameter("username"));
    	
        String action = "/" + request.getParameter("action");
    	//System.out.println(action);

        try {
            switch (action) {
            case "/new":
                //showNewForm(request, response);
            	newUser(request, response);
                break;
            case "/newC":
                //showNewForm(request, response);
            	newCompany(request, response);
                break;
            case "/newJ":
                //showNewForm(request, response);
            	newJob(request, response);
                break;
            case "/delete":
                deleteUser(request, response);
                break;
            case "/deleteJ":
                deleteJob(request, response);
                break;
            case "/deleteC":
                deleteCompany(request, response);
                break;
            case "/update":
            	updateUser(request, response);
                break;
            case "/updateC":
            	updateCompany(request, response);
                break;
            case "/updateJ":
            	updateJob(request, response);
                break;
            case "/nottokyoJob":
            	nottokyoJob(request, response);
                break;
            case "/noVulgarCBio":
            	noVulgarCBio(request, response);
                break;
            case "/vulgarUsername":
            	noVulgarUsername(request, response);
                break;
            case "/viewSizeLessF":
            	viewSizeLessF(request, response);
                break;
            case "/viewAllProgramming":
            	viewAllProgramming(request, response);
                break;
            case "/viewLanguageGoodFromKoriyama":
            	viewLanguageGoodFromKoriyama(request, response);
                break;
            default:
                //listBook(request, response);
                break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
    private void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		UserDao userdao = new UserDao();
		userdao.deleteUser(request.getParameter("username"));
		response.sendRedirect( request.getContextPath() + "/findAll");
    }
    
    private void deleteJob(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		UserDao userdao = new UserDao();
		userdao.deleteJob(request.getParameter("jobid"));
		response.sendRedirect( request.getContextPath() + "/findAllJob");
    }
    
    private void deleteCompany(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		UserDao userdao = new UserDao();
		userdao.deleteCompany(request.getParameter("username"));
		response.sendRedirect( request.getContextPath() + "/findAllCompany");
    }
    
    private void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {

		UserService userservice = new UserService();
		Map<String,String[]> paramMap = request.getParameterMap();
		User form = new User();
		List<String> info = new ArrayList<String>();
		
		for(String name : paramMap.keySet()) {
			
			String[] values = paramMap.get(name);
			info.add(values[0]);
			System.out.println(name + ": " + Arrays.toString(values));
		}
		form.setUsername(info.get(3));
		form.setPassword(info.get(4));
		form.setFirstName(info.get(5));
		form.setLastName(info.get(6));
		form.setIsAdmin(info.get(7));
		form.setNeedVisaSponsor(info.get(8));
		form.setLanguageProficiency(info.get(9));

		
		try {
			userservice.update(form, info.get(1));
			response.sendRedirect( request.getContextPath() + "/findAll");
			//response.sendRedirect( request.getContextPath() + "/jsps/main.jsp");
		} catch (ClassNotFoundException | UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }
    
    private void updateCompany(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {

		UserService userservice = new UserService();
		Map<String,String[]> paramMap = request.getParameterMap();
		Company form = new Company();
		List<String> info = new ArrayList<String>();
		
		for(String name : paramMap.keySet()) {
			
			String[] values = paramMap.get(name);
			info.add(values[0]);
			System.out.println(name + ": " + Arrays.toString(values));
		}
		form.setUsername(info.get(3));
		form.setPassword(info.get(4));
		form.setCompanyName(info.get(5));
		form.setCompanyLocation(info.get(6));
		form.setCompanyBio(info.get(7));
		form.setCompanySize(info.get(8));
		
		try {
			userservice.updateComp(form, info.get(1));
			
			response.sendRedirect( request.getContextPath() + "/findAllCompany");
		} catch (ClassNotFoundException | UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    }
    
    private void updateJob(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		UserService userservice = new UserService();
		Map<String,String[]> paramMap = request.getParameterMap();
    	System.out.println(paramMap);

		Job form = new Job();
		List<String> info = new ArrayList<String>();
		
		for(String name : paramMap.keySet()) {
			
			String[] values = paramMap.get(name);
			info.add(values[0]);
			System.out.println(name + ": " + Arrays.toString(values));
		}/*
		form.setJobTitle(info.get(2));
		form.setJobLocation(info.get(3));
		form.setJobSalary(info.get(4));
		form.setJobLanguage(info.get(5));
		form.setJobCompany(info.get(6));
		form.setJobDescription(info.get(7));
		form.setJobResidence(info.get(8));
		form.setJobEmployment(info.get(9));
		*/
		try {
			userservice.addJob(form);
			
			response.sendRedirect( request.getContextPath() + "/jsps/main.jsp");
		} catch (ClassNotFoundException | UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    private void nottokyoJob(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		// TODO Auto-generated method stub
		UserService userservice = new UserService();
		try {
			request.setAttribute("JobList", userservice.findallNotTokyoJob());
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			List<Object> li = userservice.findallJob();
			for(int i = 0; i < li.size();i++){
				System.out.println(li.get(i).toString());
			}
			
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		try {
			request.getRequestDispatcher("/Queryresult/listJob.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
            //complex 
            private void viewSizeLessF(HttpServletRequest request, HttpServletResponse response)
                    throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        		// TODO Auto-generated method stub
        		UserService userservice = new UserService();
        		try {
        			request.setAttribute("JobList", userservice.viewSizeLess501Jobs());
        		} catch (InstantiationException | IllegalAccessException
        				| ClassNotFoundException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
        		try {
        			List<Object> li = userservice.viewSizeLess501Jobs();
        			for(int i = 0; i < li.size();i++){
        				System.out.println(li.get(i).toString());
        			}
        			
        		} catch (InstantiationException | IllegalAccessException
        				| ClassNotFoundException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}		
        		try {
        			request.getRequestDispatcher("/Queryresult/listJobWithSize.jsp").forward(request, response);
        		} catch (ServletException | IOException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
            }
            
            private void viewAllProgramming(HttpServletRequest request, HttpServletResponse response)
                    throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        		// TODO Auto-generated method stub
        		UserService userservice = new UserService();
        		try {
        			request.setAttribute("JobList", userservice.viewAllProgrammingJobs());
        		} catch (InstantiationException | IllegalAccessException
        				| ClassNotFoundException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
        		try {
        			List<Object> li = userservice.viewSizeLess501Jobs();
        			for(int i = 0; i < li.size();i++){
        				System.out.println(li.get(i).toString());
        			}
        			
        		} catch (InstantiationException | IllegalAccessException
        				| ClassNotFoundException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}		
        		try {
        			request.getRequestDispatcher("/Queryresult/listJobProgrammingWithBio.jsp").forward(request, response);
        		} catch (ServletException | IOException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
            }
            
            private void viewLanguageGoodFromKoriyama(HttpServletRequest request, HttpServletResponse response)
                    throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        		// TODO Auto-generated method stub
        		UserService userservice = new UserService();
        		try {
        			request.setAttribute("JobList", userservice.viewLanguageGoodFromKoriyama());
        		} catch (InstantiationException | IllegalAccessException
        				| ClassNotFoundException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
        		try {
        			List<Object> li = userservice.viewLanguageGoodFromKoriyama();
        			for(int i = 0; i < li.size();i++){
        				System.out.println(li.get(i).toString());
        			}
        			
        		} catch (InstantiationException | IllegalAccessException
        				| ClassNotFoundException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}		
        		try {
        			request.getRequestDispatcher("/Queryresult/listJobLanguageGoodFromKoriyama.jsp").forward(request, response);
        		} catch (ServletException | IOException e) {
        			// TODO Auto-generated catch block
        			e.printStackTrace();
        		}
            }
    
    private void noVulgarCBio(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		// TODO Auto-generated method stub
		UserService userservice = new UserService();
		try {
			request.setAttribute("CompanyList", userservice.findallnoVulgarCBio());
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			List<Object> li = userservice.findallCompany();
			for(int i = 0; i < li.size();i++){
				System.out.println(li.get(i).toString());
			}
			
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		try {
			request.getRequestDispatcher("/Queryresult/listCompany.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    private void noVulgarUsername(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		// TODO Auto-generated method stub
		UserService userservice = new UserService();
		try {
			request.setAttribute("UserList", userservice.findallnoVulgarUUsername());
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			List<Object> li = userservice.findall();
			for(int i = 0; i < li.size();i++){
				System.out.println(li.get(i).toString());
			}
			
		} catch (InstantiationException | IllegalAccessException
				| ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		try {
			request.getRequestDispatcher("/Queryresult/list.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    private void newUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		UserService userservice = new UserService();
		Map<String,String[]> paramMap = request.getParameterMap();
    	System.out.println(paramMap);

		User form = new User();
		List<String> info = new ArrayList<String>();
		
		for(String name : paramMap.keySet()) {
			
			String[] values = paramMap.get(name);
			info.add(values[0]);
			System.out.println(name + ": " + Arrays.toString(values));
		}
		form.setUsername(info.get(2));
		form.setPassword(info.get(3));
		form.setFirstName(info.get(4));
		form.setLastName(info.get(5));
		form.setIsAdmin(info.get(6));
		form.setNeedVisaSponsor(info.get(7));
		form.setLanguageProficiency(info.get(8));

		try {
			userservice.regist(form);
			
			response.sendRedirect( request.getContextPath() + "/jsps/main.jsp");
		} catch (ClassNotFoundException | UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    private void newJob(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		UserService userservice = new UserService();
		Map<String,String[]> paramMap = request.getParameterMap();
    	System.out.println(paramMap);

		Job form = new Job();
		List<String> info = new ArrayList<String>();
		
		for(String name : paramMap.keySet()) {
			
			String[] values = paramMap.get(name);
			info.add(values[0]);
			System.out.println(name + ": " + Arrays.toString(values));
		}
		form.setJobTitle(info.get(2));
		form.setJobLocation(info.get(3));
		form.setJobSalary(info.get(4));
		form.setJobLanguage(info.get(5));
		form.setJobCompany(info.get(6));
		form.setJobDescription(info.get(7));
		form.setJobResidence(info.get(8));
		form.setJobEmployment(info.get(9));

		try {
			userservice.addJob(form);
			
			response.sendRedirect( request.getContextPath() + "/jsps/main.jsp");
		} catch (ClassNotFoundException | UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    private void newCompany(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
		UserService userservice = new UserService();
		Map<String,String[]> paramMap = request.getParameterMap();
    	System.out.println(paramMap);

		Company form = new Company();
		List<String> info = new ArrayList<String>();
		
		for(String name : paramMap.keySet()) {
			
			String[] values = paramMap.get(name);
			info.add(values[0]);
			System.out.println(name + ": " + Arrays.toString(values));
		}
		form.setUsername(info.get(2));
		form.setPassword(info.get(3));
		form.setCompanyName(info.get(4));
		form.setCompanyLocation(info.get(5));
		form.setCompanyBio(info.get(6));
		form.setCompanySize(info.get(7));

		try {
			userservice.addCompany(form);
			
			response.sendRedirect( request.getContextPath() + "/jsps/main.jsp");
		} catch (ClassNotFoundException | UserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

}

