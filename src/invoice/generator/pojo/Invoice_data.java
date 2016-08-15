package invoice.generator.pojo;

public class Invoice_data {

	private String employeeName;
	private String projectrange;
	private double rate;
	private int hours;
	private double amount;

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getProjectrange() {
		return projectrange;
	}

	public void setProjectrange(String projectrange) {
		this.projectrange = projectrange;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public int getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

}
