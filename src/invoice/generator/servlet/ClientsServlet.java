package invoice.generator.servlet;

import invoice.generator.jpa.Client_dataDaoImpl;
import invoice.generator.pojo.Client_data;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClientsServlet
 */
@WebServlet("/clients")
public class ClientsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ClientsServlet() {
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

		List<Client_data> clientData = new Client_dataDaoImpl().findAll();

		request.setAttribute("clientData", clientData);
		request.getRequestDispatcher("/clients.jsp").forward(request, response);

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

			String number = request.getParameter("number");
			String name = request.getParameter("name");
			String addressline1 = request.getParameter("addressline1");
			String addressline2 = request.getParameter("addressline2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String email = request.getParameter("email");
			String contact = request.getParameter("contact");
			String invoicefreq = request.getParameter("invoicefreq");
			String billingterms = request.getParameter("billingterms");
			String invoicegrouping = request.getParameter("invoicegrouping");

			request.setAttribute("activetab", "2");

			Client_dataDaoImpl client_dataDaoImpl = new Client_dataDaoImpl();

			if (client_dataDaoImpl.read(Integer.parseInt(number)) != null) {

				request.setAttribute("message",
						"Client number already taken, Please choose another");

			} else {

				Client_data client_data = new Client_data();
				client_data.setNumber(Integer.parseInt(number));
				client_data.setName(name);
				client_data.setAddress_line_1(addressline1);
				client_data.setAddress_line_2(addressline2);
				client_data.setCity(city);
				client_data.setState(state);
				client_data.setZip(zip);
				client_data.setEmail(email);
				client_data.setContact(contact);
				client_data.setInvoice_freq(invoicefreq);
				client_data.setBilling_terms(billingterms);
				client_data.setInvoice_grouping(invoicegrouping);
				client_dataDaoImpl.create(client_data);
				request.setAttribute("message", "Client added successfully");

			}

		}

		else if (action.equals("getclient")) {
			String number = request.getParameter("number");
			Client_dataDaoImpl client_dataDaoImpl = new Client_dataDaoImpl();
			request.setAttribute("editdata",
					client_dataDaoImpl.read(Integer.parseInt(number)));
			request.setAttribute("activetab", "3");
		}

		else if (action.equals("edit")) {

			String number = request.getParameter("number");
			String name = request.getParameter("name");
			System.out.println(name);
			String addressline1 = request.getParameter("addressline1");
			String addressline2 = request.getParameter("addressline2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			String email = request.getParameter("email");
			String contact = request.getParameter("contact");
			String invoicefreq = request.getParameter("invoicefreq");
			String billingterms = request.getParameter("billingterms");
			String invoicegrouping = request.getParameter("invoicegrouping");

			request.setAttribute("activetab", "3");

			Client_dataDaoImpl client_dataDaoImpl = new Client_dataDaoImpl();

			Client_data client_data = new Client_data();
			client_data.setNumber(Integer.parseInt(number));
			client_data.setName(name);
			client_data.setAddress_line_1(addressline1);
			client_data.setAddress_line_2(addressline2);
			client_data.setCity(city);
			client_data.setState(state);
			client_data.setZip(zip);
			client_data.setEmail(email);
			client_data.setContact(contact);
			client_data.setInvoice_freq(invoicefreq);
			client_data.setBilling_terms(billingterms);
			client_data.setInvoice_grouping(invoicegrouping);
			client_dataDaoImpl.update(client_data);
			request.setAttribute("message", "Client updated successfully");

		}

		else if (action.equals("inactive")) {

			request.setAttribute("activetab", "4");

			String number = request.getParameter("number");
			Client_dataDaoImpl client_dataDaoImpl = new Client_dataDaoImpl();
			Client_data client_data = client_dataDaoImpl.read(Integer
					.parseInt(number));
			if (client_data != null) {
				client_data.setCurrentstate(1);
				client_dataDaoImpl.update(client_data);
				request.setAttribute("message", "Client inactived successfully");

			} else {

				request.setAttribute("message", "Invalid client id");

			}
		} else if (action.equals("active")) {

			request.setAttribute("activetab", "5");

			String number = request.getParameter("number");
			Client_dataDaoImpl client_dataDaoImpl = new Client_dataDaoImpl();
			Client_data client_data = client_dataDaoImpl.read(Integer
					.parseInt(number));
			if (client_data != null) {
				client_data.setCurrentstate(0);
				client_dataDaoImpl.update(client_data);
				request.setAttribute("message", "Client Actived successfully");

			} else {

				request.setAttribute("message", "Invalid client id");

			}
		}

		doGet(request, response);

	}

}
