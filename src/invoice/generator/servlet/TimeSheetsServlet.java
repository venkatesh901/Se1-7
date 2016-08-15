package invoice.generator.servlet;

import invoice.generator.jpa.Project_dateDaoImpl;
import invoice.generator.jpa.TimeSheet_dataDaoImpl;
import invoice.generator.pojo.Project_data;
import invoice.generator.pojo.TimeSheet_data;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TimeSheetsServlet
 */
@WebServlet("/timesheets")
public class TimeSheetsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TimeSheetsServlet() {
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
		request.setAttribute("projectdata", projectsData);

		List<TimeSheet_data> timesheetdata = new TimeSheet_dataDaoImpl()
				.findwithstatus();
		request.setAttribute("timesheetdata", timesheetdata);

		request.getRequestDispatcher("/timesheet.jsp").forward(request,
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

			String projectnumber = request.getParameter("projectnumber");
			String date = request.getParameter("date");
			String hours = request.getParameter("hours");

			TimeSheet_data timeSheet_data = new TimeSheet_data();
			timeSheet_data.setDate(date);
			timeSheet_data.setHours(Integer.parseInt(hours));

			HttpSession session = request.getSession();
			int userid = (Integer) session.getAttribute("userid");

			if (session.getAttribute("usertype").equals("2")) {

				timeSheet_data.setAccepted(1);
			}

			timeSheet_data.setUserid(userid);
			timeSheet_data.setProjectnumber(Integer.parseInt(projectnumber));
			TimeSheet_dataDaoImpl timeSheet_dataDaoImpl = new TimeSheet_dataDaoImpl();
			timeSheet_dataDaoImpl.create(timeSheet_data);
			request.setAttribute("message", "Your time sheet recorded for "
					+ date);

		}

		if (action.equals("approve")) {

			String id = request.getParameter("id");

			TimeSheet_dataDaoImpl timeSheet_dataDaoImpl = new TimeSheet_dataDaoImpl();
			TimeSheet_data timeSheet_data = timeSheet_dataDaoImpl.read(Integer
					.parseInt(id));
			timeSheet_data.setAccepted(1);
			timeSheet_dataDaoImpl.update(timeSheet_data);
			request.setAttribute("message", "Time sheet accepted");

			request.setAttribute("activetab", "2");

		} else {
			String id = request.getParameter("id");
			request.setAttribute("activetab", "2");

			TimeSheet_dataDaoImpl timeSheet_dataDaoImpl = new TimeSheet_dataDaoImpl();
			TimeSheet_data timeSheet_data = timeSheet_dataDaoImpl.read(Integer
					.parseInt(id));
			timeSheet_dataDaoImpl.delete(timeSheet_data);
			request.setAttribute("message", "Time sheet rejected");

		}
		doGet(request, response);

	}

}
