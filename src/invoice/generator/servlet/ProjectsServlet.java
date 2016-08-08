package invoice.generator.servlet;

import invoice.generator.jpa.Client_dataDaoImpl;
import invoice.generator.jpa.Project_dateDaoImpl;
import invoice.generator.pojo.Client_data;
import invoice.generator.pojo.Project_data;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProjectsServlet
 */
@WebServlet("/projects")
public class ProjectsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProjectsServlet() {
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

		List<Project_data> projectsData = new Project_dateDaoImpl().findAll();

		request.setAttribute("projectsData", projectsData);

		request.getRequestDispatcher("/projects.jsp")
				.forward(request, response);

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

			String projectnumber = request.getParameter("projectnumber");
			String clientnumber = request.getParameter("clientnumber");
			String projectname = request.getParameter("projectname");
			String startdate = request.getParameter("startdate");
			String enddate = request.getParameter("enddate");
			String status = request.getParameter("status");
			String projectmanager = request.getParameter("projectmanager");
			String clientcontact = request.getParameter("clientcontact");
			String budget = request.getParameter("budget");

			request.setAttribute("activetab", "2");
			Project_dateDaoImpl projectdataDaoImpl = new Project_dateDaoImpl();
			if (projectdataDaoImpl.read(Integer.parseInt(projectnumber)) != null) {

				request.setAttribute("message",
						"Project number already taken, Please choose another");

			}

			else {

				Client_dataDaoImpl client_dataDaoImpl = new Client_dataDaoImpl();

				if (client_dataDaoImpl.read(Integer.parseInt(clientnumber)) == null) {

					request.setAttribute("message",
							"Client number does not exist");
				}

				else {

					Project_data project_data = new Project_data();
					project_data.setClient(Integer.parseInt(clientnumber));
					project_data.setProject_number(Integer
							.parseInt(projectnumber));
					project_data.setProject_name(projectname);
					project_data.setState_date(startdate);
					project_data.setEnd_date(enddate);
					project_data.setStatus("In Progress");
					project_data.setProject_manager(projectmanager);
					project_data.setClient_contact(clientcontact);
					project_data.setBudget(Integer.parseInt(budget));
					projectdataDaoImpl.create(project_data);
					request.setAttribute("message",
							"Project added successfully");

				}
			}

		}

		else if (action.equals("getproject")) {
			String projectnumber = request.getParameter("projectnumber");
			Project_dateDaoImpl project_dataDaoImpl = new Project_dateDaoImpl();
			request.setAttribute("editdata",
					project_dataDaoImpl.read(Integer.parseInt(projectnumber)));
			request.setAttribute("activetab", "3");

		}

		else if (action.equals("edit")) {

			String projectnumber = request.getParameter("projectnumber");
			String clientnumber = request.getParameter("clientnumber");
			String projectname = request.getParameter("projectname");
			String startdate = request.getParameter("startdate");
			String enddate = request.getParameter("enddate");
			String status = request.getParameter("status");
			String projectmanager = request.getParameter("projectmanager");
			String clientcontact = request.getParameter("clientcontact");
			String budget = request.getParameter("budget");

			request.setAttribute("activetab", "3");
			Project_data project_data = new Project_data();
			project_data.setClient(Integer.parseInt(clientnumber));
			project_data.setProject_number(Integer.parseInt(projectnumber));
			project_data.setProject_name(projectname);
			project_data.setState_date(startdate);
			project_data.setEnd_date(enddate);
			project_data.setStatus("Open");
			project_data.setProject_manager(projectmanager);
			project_data.setClient_contact(clientcontact);
			project_data.setBudget(Integer.parseInt(budget));
			Project_dateDaoImpl projectdataDaoImpl = new Project_dateDaoImpl();
			projectdataDaoImpl.update(project_data);
			request.setAttribute("message", "Project updated successfully");

		} else if (action.equals("inactive")) {
			request.setAttribute("activetab", "4");

			String number = request.getParameter("projectnumber");
			Project_dateDaoImpl project_dataDaoImpl = new Project_dateDaoImpl();
			Project_data project_data = project_dataDaoImpl.read(Integer
					.parseInt(number));
			if (project_data != null) {
				project_data.setStatus("Closed");
				project_dataDaoImpl.update(project_data);
				request.setAttribute("message",
						"Project inactived successfully");

			} else {

				request.setAttribute("message", "Invalid Project id");

			}
		} else if (action.equals("active")) {

			request.setAttribute("activetab", "5");

			String number = request.getParameter("projectnumber");
			Project_dateDaoImpl project_dataDaoImpl = new Project_dateDaoImpl();
			Project_data project_data = project_dataDaoImpl.read(Integer
					.parseInt(number));
			if (project_data != null) {
				project_data.setStatus("In Progress");
				project_dataDaoImpl.update(project_data);
				request.setAttribute("message",
						"Project Actived successfully");

			} else {

				request.setAttribute("message", "Invalid Project id");

			}
		}

		doGet(request, response);

	}
}
