package invoice.generator.jpa;

import java.util.ArrayList;
import java.util.List;

import invoice.generator.pojo.ProjectPerson_data;

public class ProjectPersonDaoImpl extends GenericDaoJpaImpl<ProjectPerson_data,Integer>{

	public ArrayList<Integer> getProjects(String personname) {
		
		List<ProjectPerson_data> data =  entityManager
				.createQuery(
						"SELECT c FROM ProjectPerson_data c WHERE c.project_name = :personname")
				.setParameter("personname", personname).getResultList();
		
		ArrayList<Integer> projectnumbers = new ArrayList<Integer> ();
		for (ProjectPerson_data projectPerson_data : data) {
			
			projectnumbers.add(projectPerson_data.getProject_number());
		}
		
		return projectnumbers;
	}
	
}
