package invoice.generator.servlet;

import invoice.generator.jpa.People_dataDaoImpl;
import invoice.generator.jpa.ProjectPersonDaoImpl;
import invoice.generator.jpa.Project_dateDaoImpl;
import invoice.generator.pojo.People_data;
import invoice.generator.pojo.ProjectPerson_data;
import invoice.generator.pojo.Project_data;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManagerProjectPersonServlet
 */
@WebServlet("/managerprojectperson")
public class ManagerProjectPersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ManagerProjectPersonServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		List<ProjectPerson_data> projectpersonData = new ProjectPersonDaoImpl()
				.findAll();

		request.setAttribute("projectpersonData", projectpersonData);

		List<Project_data> projectsData = new Project_dateDaoImpl().findAll();
    	request.setAttribute("projectdata", projectsData);
    	
    	
    	List<People_data> peopleData = new People_dataDaoImpl().findAll();
		request.setAttribute("peopledata", peopleData);
		request.getRequestDispatcher("/managerprojectperson.jsp").forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getParameter("action");
		if (action.equals("add")) {

			String personname = request.getParameter("personname");
			String projectnumber = request.getParameter("projectnumber");
			
			ProjectPerson_data peopleperson_data = new ProjectPerson_data();
			peopleperson_data.setProject_number(Integer.parseInt(projectnumber));
			peopleperson_data.setProject_name(personname);
			ProjectPersonDaoImpl projectPersonDaoImpl = new ProjectPersonDaoImpl();
			projectPersonDaoImpl.create(peopleperson_data);


		}
		doGet(request, response);
	}

}
