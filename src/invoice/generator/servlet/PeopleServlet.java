package invoice.generator.servlet;

import invoice.generator.jpa.Client_dataDaoImpl;
import invoice.generator.jpa.People_dataDaoImpl;
import invoice.generator.pojo.Client_data;
import invoice.generator.pojo.People_data;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PeopleServlet
 */
@WebServlet("/people")
public class PeopleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PeopleServlet() {
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

		List<People_data> peopleData = new People_dataDaoImpl().findAll();
		request.setAttribute("peopleData", peopleData);

		request.getRequestDispatcher("/people.jsp").forward(request, response);
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

			String name = request.getParameter("name");
			String title = request.getParameter("title");
			String billrate = request.getParameter("billrate");
			String role = request.getParameter("role");

			People_data people_data = new People_data();
			people_data.setName(name);
			people_data.setTitle(title);
			people_data.setBill_rate(Integer.parseInt(billrate));
			people_data.setRole(role);
			People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();
			people_dataDaoImpl.create(people_data);
			request.setAttribute("activetab", "2");
			request.setAttribute("message", "Person Added successfully");

		}

		else if (action.equals("getperson")) {
			String id = request.getParameter("id");
			People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();
			request.setAttribute("editdata",
					people_dataDaoImpl.read(Integer.parseInt(id)));
			request.setAttribute("activetab", "3");
		}

		else if (action.equals("edit")) {

			request.setAttribute("activetab", "3");

			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String title = request.getParameter("title");
			String billrate = request.getParameter("billrate");
			String role = request.getParameter("role");
			People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();

			if (people_dataDaoImpl.read(Integer.parseInt(id)) == null) {

				request.setAttribute("message", "Incorrect Person id");

			} else {

				People_data people_data = new People_data();
				people_data.setId(Integer.parseInt(id));
				people_data.setName(name);
				people_data.setTitle(title);
				people_data.setBill_rate(Integer.parseInt(billrate));
				people_data.setRole(role);
				people_dataDaoImpl.update(people_data);
				request.setAttribute("message", "Person Updated successfully");
			}

		}

		else if (action.equals("inactive")) {
			request.setAttribute("activetab", "4");
			String id = request.getParameter("id");
			People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();
			People_data people_data = people_dataDaoImpl.read(Integer
					.parseInt(id));
			if (people_data != null) {
				people_data.setCurrentstate(1);
				people_dataDaoImpl.update(people_data);
				request.setAttribute("message", "Person inactived successfully");
			} else {
				request.setAttribute("message", "Invalid person id");
			}

		}

		else if (action.equals("active")) {
			request.setAttribute("activetab", "4");
			String id = request.getParameter("id");
			People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();
			People_data people_data = people_dataDaoImpl.read(Integer
					.parseInt(id));
			if (people_data != null) {
				people_data.setCurrentstate(0);
				people_dataDaoImpl.update(people_data);
				request.setAttribute("message", "Person Actived successfully");
			} else {
				request.setAttribute("message", "Invalid person id");
			}

		}
		doGet(request, response);

	}

}
