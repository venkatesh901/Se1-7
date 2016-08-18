package invoice.generator.servlet;

import invoice.generator.jpa.People_dataDaoImpl;
import invoice.generator.pojo.People_data;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  request.getRequestDispatcher("/index.jsp")
          .forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	        
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	      
	        int usertype = -1;
	        String redirecttopage = "";
	        String name ="";
	        
	        if(username.toLowerCase().equals("accountant") && password.toLowerCase().equals("pass1234")){
	        	usertype = 1;
	        	redirecttopage = "accountant";
	            name = "Accountant";
	        	
	        }
	        else
	        {
	        	
	        	int userid = Integer.parseInt(username); 
	        	
	        	People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();
	        	People_data people = people_dataDaoImpl.read(userid);
	        	name = people.getName();
	        	
	        	if(people==null){
	        		usertype = -1;	
	        	}
	        	
	       	else {
	       		
	        	if(people.getRole().equals("Project Manager") && password.toLowerCase().equals("pass1234")){
	        	usertype = 2;
	        	redirecttopage = "projects";
	           // name = "Manager";

	            }
	        
		       else if(people.getRole().equals("Developer") && password.toLowerCase().equals("pass1234")){
	        	usertype = 3;
	        	redirecttopage = "timesheets";
	            //name = "Developer";

	          
		       }
	          }
	            HttpSession session = request.getSession();
	            session.setAttribute("userid", userid);

	        }
	        if (usertype == -1) {
	            
	            request.setAttribute("error", "Invalid credentials");
	            request.getRequestDispatcher("/index.jsp").forward(request, response);
	            
	        } else {

	        	HttpSession session = request.getSession();
	            session.setAttribute("usertype", "" + usertype);
	            session.setAttribute("name", name);
	            response.sendRedirect(request.getContextPath() + "/"+redirecttopage);
	        }
	}

}
