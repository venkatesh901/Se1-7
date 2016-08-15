package invoice.generator.jpa;

import java.util.List;

import invoice.generator.pojo.TimeSheet_data;

public class TimeSheet_dataDaoImpl extends
		GenericDaoJpaImpl<TimeSheet_data, Integer> {

	public List<TimeSheet_data> findwithstatus() {

		return entityManager
				.createQuery(
						"SELECT c FROM TimeSheet_data c WHERE c.accepted = :accepted")
				.setParameter("accepted", 0).getResultList();
	}

	public List getcumilativehours(int projectnumber) {

		return entityManager
				.createQuery(
						"SELECT sum(hours) as hours,userid,projectnumber FROM TimeSheet_data c group by c.userid having c.projectnumber = :projectnumber")
				.setParameter("projectnumber", projectnumber).getResultList();
	}
}
