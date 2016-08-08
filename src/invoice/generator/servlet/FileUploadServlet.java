package invoice.generator.servlet;

import invoice.generator.commons.FileParser;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import sun.swing.FilePane;

/**
 * Servlet implementation class FileUploadServlet
 */
@WebServlet("/FileUploadServlet")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FileUploadServlet() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {
			List<FileItem> items = new ServletFileUpload(
					new DiskFileItemFactory()).parseRequest(request);
			for (FileItem item : items) {
				if (item.isFormField()) {
					String fieldName = item.getFieldName();
					String fieldValue = item.getString();
				} else {
					String fieldName = item.getFieldName();
					String fileName = FilenameUtils.getName(item.getName());

					InputStream inputStream = item.getInputStream();

					FileParser fileParser = new FileParser(inputStream);
					if (fieldName.equals("clientfile")) {

						System.out.println("Client file");
						fileParser.clientFileParser();

					} else if (fieldName.equals("companyfile")) {

						fileParser.companyFileParser();
					}

					else if (fieldName.equals("projectfile")) {

						fileParser.projectFileParser();
					}

					else if (fieldName.equals("peoplefile")) {

						fileParser.peopleFileParser();
					} else if (fieldName.equals("projectpersonfile")) {

						fileParser.projectPersonFileParser();
					}

				}
			}

			System.out.println("EXIT");

			response.sendRedirect(request.getContextPath()
					+ "/accountant?uploaded=true");

		} catch (FileUploadException e) {
			throw new ServletException("Cannot parse multipart request.", e);
		}

	}

}
