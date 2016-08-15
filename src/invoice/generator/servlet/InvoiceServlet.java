package invoice.generator.servlet;

import invoice.generator.jpa.ProjectPersonDaoImpl;
import invoice.generator.jpa.Project_dateDaoImpl;
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
 * Servlet implementation class InvoiceServlet
 */
@WebServlet("/invoice")
public class InvoiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InvoiceServlet() {
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

		List<Project_data> project_data = new Project_dateDaoImpl()
				.findAll();
		request.setAttribute("projectdata", project_data);

		request.getRequestDispatcher("/generateinvoice.jsp").forward(request,
				response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setAttribute("generateinvoice", true);
		request.setAttribute("projectnumber", request.getParameter("projectnumber"));
		doGet(request, response);
	}

}
