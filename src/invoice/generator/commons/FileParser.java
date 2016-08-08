package invoice.generator.commons;

import invoice.generator.jpa.Client_dataDaoImpl;
import invoice.generator.jpa.Company_dataDaoImpl;
import invoice.generator.jpa.People_dataDaoImpl;
import invoice.generator.jpa.ProjectPersonDaoImpl;
import invoice.generator.jpa.Project_dateDaoImpl;
import invoice.generator.pojo.Client_data;
import invoice.generator.pojo.Company_data;
import invoice.generator.pojo.People_data;
import invoice.generator.pojo.ProjectPerson_data;
import invoice.generator.pojo.Project_data;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class FileParser {

	InputStream inputStream;

	public FileParser(InputStream inputStream) {

		this.inputStream = inputStream;
	}

	public void companyFileParser() throws IOException {

		BufferedReader reader = new BufferedReader(new InputStreamReader(
				inputStream));
		String array_line;
		boolean firstline = true;
		while ((array_line = reader.readLine()) != null) {

			if (firstline) {
				firstline = false;
				continue;
			}
			String[] array = array_line.split(",");
			Company_data company_data = new Company_data();
			company_data.setName(array[0]);
			company_data.setAddress_line_1(array[1]);
			company_data.setAddress_line_2(array[2]);
			company_data.setCity(array[3]);
			company_data.setState(array[4]);
			company_data.setZip(array[5]);
			Company_dataDaoImpl companyDaoImpl = new Company_dataDaoImpl();
			companyDaoImpl.create(company_data);

		}
		reader.close();
	}

	public void projectFileParser() throws IOException {

		BufferedReader reader = new BufferedReader(new InputStreamReader(
				inputStream));
		String array_line;
		boolean firstline = true;
		while ((array_line = reader.readLine()) != null) {

			if (firstline) {
				firstline = false;
				continue;
			}
			String[] array = array_line.split(",");
			Project_data project_data = new Project_data();
			project_data.setClient(Integer.parseInt(array[0]));
			project_data.setProject_number(Integer.parseInt(array[1]));
			project_data.setProject_name(array[2]);
			project_data.setState_date(array[3]);
			project_data.setEnd_date(array[4]);
			project_data.setStatus(array[5]);
			project_data.setProject_manager(array[6]);
			project_data.setClient_contact(array[7]);
			project_data.setBudget(Integer.parseInt(array[8]));
			Project_dateDaoImpl project_dateDaoImpl = new Project_dateDaoImpl();
			project_dateDaoImpl.create(project_data);

		}
		reader.close();
	}

	public void clientFileParser() throws IOException {

		BufferedReader reader = new BufferedReader(new InputStreamReader(
				inputStream));
		String array_line;
		boolean firstline = true;
		while ((array_line = reader.readLine()) != null) {

			System.out.println("Testing");
			if (firstline) {
				firstline = false;
				continue;
			}
			String[] array = array_line.split(",");
			Client_data client_data = new Client_data();
			client_data.setNumber(Integer.parseInt(array[0]));
			client_data.setName(array[1]);
			client_data.setAddress_line_1(array[2]);
			client_data.setAddress_line_2(array[3]);
			client_data.setCity(array[4]);
			client_data.setState(array[5]);
			client_data.setZip(array[6]);
			client_data.setEmail(array[7]);
			client_data.setContact(array[8]);
			client_data.setInvoice_freq(array[9]);
			client_data.setBilling_terms(array[10]);
			client_data.setInvoice_grouping(array[11]);
			Client_dataDaoImpl client_dataDaoImpl = new Client_dataDaoImpl();
			client_dataDaoImpl.create(client_data);

		}
		reader.close();
	}

	public void peopleFileParser() throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				inputStream));
		String array_line;
		boolean firstline = true;
		while ((array_line = reader.readLine()) != null) {

			if (firstline) {
				firstline = false;
				continue;
			}
			String[] array = array_line.split(",");
			People_data people_data = new People_data();
			people_data.setName(array[0]);
			people_data.setTitle(array[1]);
			people_data.setBill_rate(Integer.parseInt(array[2]));
			people_data.setRole(array[3]);
			People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();

			people_dataDaoImpl.create(people_data);
		}
		reader.close();
	}

	public void projectPersonFileParser() throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(
				inputStream));
		String array_line;
		boolean firstline = true;
		while ((array_line = reader.readLine()) != null) {

			if (firstline) {
				firstline = false;
				continue;
			}
			String[] array = array_line.split(",");
			ProjectPerson_data peopleperson_data = new ProjectPerson_data();
			peopleperson_data.setProject_number(Integer.parseInt(array[0]));
			peopleperson_data.setProject_name(array[1]);
			ProjectPersonDaoImpl projectPersonDaoImpl = new ProjectPersonDaoImpl();

			Project_dateDaoImpl project_dateDaoImpl = new Project_dateDaoImpl();
			if (project_dateDaoImpl.findWithName(
					peopleperson_data.getProject_name()).size() == 0) {

				projectPersonDaoImpl.create(peopleperson_data);
			}
		}
		reader.close();
	}

}
