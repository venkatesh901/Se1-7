package invoice.generator.servlet;

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
	        else if(username.toLowerCase().equals("pmanager") && password.toLowerCase().equals("pass1234")){
	        	usertype = 2;
	        	redirecttopage = "projects";
	            name = "Manager";

	        }
	        
	        
	        else if(username.toLowerCase().equals("developer") && password.toLowerCase().equals("dev1234")){
	        	usertype = 3;
	        	redirecttopage = "developer";
	            name = "Developer";

	        }
	        
	       
	        if (usertype == -1) {
	            
	            request.setAttribute("error", "Invalid credentials");
	            request.getRequestDispatcher("/index.jsp").forward(request, response);
	            
	        } else {
	            HttpSession session = request.getSession();
	            session.setAttribute("usertype", "" + usertype);
	            session.setAttribute("name", name);
	            
	            System.out.println("Testing");
	            
	            response.sendRedirect(request.getContextPath() + "/"+redirecttopage);
	        }
	}

}
