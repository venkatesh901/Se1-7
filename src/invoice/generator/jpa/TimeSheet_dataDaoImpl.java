package invoice.generator.jpa;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.List;
import java.util.Locale;

import invoice.generator.pojo.People_data;
import invoice.generator.pojo.TimeSheet_data;

public class TimeSheet_dataDaoImpl extends
		GenericDaoJpaImpl<TimeSheet_data, Integer> {

	public List<TimeSheet_data> findwithstatus() {

		return entityManager
				.createQuery(
						"SELECT c FROM TimeSheet_data c WHERE c.accepted = :accepted")
				.setParameter("accepted", 0).getResultList();
	}

	public double usedbudget(int projectnumber) {

		List<Object[]> data = entityManager
				.createQuery(
						"SELECT sum(hours) as hours,userid,projectnumber FROM TimeSheet_data c group by c.userid having c.projectnumber = :projectnumber")
				.setParameter("projectnumber", projectnumber).getResultList();
		double outstandingdue = 0;
		System.out.println("size"+data.size());
		for (Object[] timesheet : data) {
			long hours = (Long) timesheet[0];
			int userid = (Integer) timesheet[1];

			People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();
			People_data people_data = people_dataDaoImpl.read(userid);
			System.out.println(outstandingdue);
			double billrate =  hours * people_data.getBill_rate();
			outstandingdue += billrate;
			
			

		}
		System.out.println(outstandingdue);
		return outstandingdue;
	}

	public List getcumilativehours(int projectnumber) {

		return entityManager
				.createQuery(
						"SELECT sum(hours) as hours,userid,projectnumber FROM TimeSheet_data c group by c.userid having c.projectnumber = :projectnumber")
				.setParameter("projectnumber", projectnumber).getResultList();
	}

	public List getworkedhours() {

		return entityManager
				.createQuery(
						"SELECT sum(hours) as hours,userid,projectnumber FROM TimeSheet_data c group by c.userid")
				.getResultList();
	}

}
