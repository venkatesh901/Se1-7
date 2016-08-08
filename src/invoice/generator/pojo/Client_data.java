package invoice.generator.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "client_data")
public class Client_data {
	@Id
    @Column(name = "number")
	private int number;
	
    @Column(name = "name")
	private String name;

    @Column(name = "address_line_1")
	private String address_line_1;

    @Column(name = "address_line_2")
	private String address_line_2;

    @Column(name = "city")
	private String city;

    @Column(name = "state")
	private String state;
    
    @Column(name = "zip")
    private String zip;
    
	@Column(name = "email")
    private String email;
    
	@Column(name = "contact")
    private String contact;
    
	@Column(name = "invoice_freq")
    private String invoice_freq;
    
	@Column(name = "billing_terms")
    private String billing_terms;
	
    @Column(name = "invoice_grouping")
    private String invoice_grouping;

	@Column(name = "currentstate")
	private int currentstate;

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress_line_1() {
		return address_line_1;
	}

	public void setAddress_line_1(String address_line_1) {
		this.address_line_1 = address_line_1;
	}

	public String getAddress_line_2() {
		return address_line_2;
	}

	public void setAddress_line_2(String address_line_2) {
		this.address_line_2 = address_line_2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getInvoice_freq() {
		return invoice_freq;
	}

	public void setInvoice_freq(String invoice_freq) {
		this.invoice_freq = invoice_freq;
	}

	public String getBilling_terms() {
		return billing_terms;
	}

	public void setBilling_terms(String billing_terms) {
		this.billing_terms = billing_terms;
	}

	public String getInvoice_grouping() {
		return invoice_grouping;
	}

	public void setInvoice_grouping(String invoice_grouping) {
		this.invoice_grouping = invoice_grouping;
	}

	public int getCurrentstate() {
		return currentstate;
	}

	public void setCurrentstate(int currentstate) {
		this.currentstate = currentstate;
	}
	
	

	
}
