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
 * Servlet implementation class ProjectPerson
 */
@WebServlet("/projectperson")
public class ProjectPersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProjectPersonServlet() {
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

		
	
    	request.getRequestDispatcher("/projectpersons.jsp").forward(request,
				response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
