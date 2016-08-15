<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="invoice.generator.jpa.People_dataDaoImpl"%>
<%@page import="invoice.generator.pojo.People_data"%>
<%@page import="invoice.generator.pojo.Invoice_data"%>
<%@page import="java.util.List"%>
<%@page import="invoice.generator.pojo.TimeSheet_data"%>
<%@page import="java.util.ArrayList"%>
<%@page import="invoice.generator.pojo.Client_data"%>
<%@page import="invoice.generator.jpa.TimeSheet_dataDaoImpl"%>
<%@page import="invoice.generator.jpa.Client_dataDaoImpl"%>
<%@page import="invoice.generator.pojo.Project_data"%>
<%@page import="invoice.generator.jpa.Project_dateDaoImpl"%>

<script src="js/printThis.js"></script>
<script src="js/jspdf.debug.js"></script>

<script>
	function sendemail() {

		
		$.ajax({
			url : 'sendemail',
			type : 'POST',
			dataType : 'html',
			data : 'to=' + $("#to").val()+ '&htmlContent=' + $("#invoicedata").html(),
			success : function(data) {

			},
			error : function(e) {

			}

		});
	}
	function printelement() {

		$(".invoicedata").printThis({
			debug : false,
			importCSS : true,
			printContainer : true,
			loadCSS : "css/bootstrap.css",
			pageTitle : "Invoice",
			removeInline : false
		});

	}

	$(function() {

		$('#print').click(function() {
			var doc = new jsPDF();
			doc.addHTML($('.invoicedata')[0], 15, 15, {
				'background' : '#fff',
			}, function() {
				doc.save('invoice.pdf');
			});
		});
	});
</script>
<%
	if (request.getAttribute("generateinvoice") != null) {

		String projectnumber = (String) request
		.getAttribute("projectnumber");
		

		Project_dateDaoImpl project_dateDaoImpl = new Project_dateDaoImpl();
		Project_data project_data = project_dateDaoImpl.read(Integer.parseInt(projectnumber));
		
		Client_dataDaoImpl client_dataDaoImpl = new Client_dataDaoImpl();
		Client_data client = client_dataDaoImpl.read(project_data.getClient());
		
		TimeSheet_dataDaoImpl timeSheet_dataDaoImpl = new TimeSheet_dataDaoImpl();
		List<Object[]> timesheetdata = timeSheet_dataDaoImpl.getcumilativehours(Integer
		.parseInt(projectnumber));
		
		double outstandingdue = 0;
		
		List<Invoice_data> invoice_data = new ArrayList<Invoice_data>();
		

		for (Object[] timesheet : timesheetdata) {

	 
	         long hours = (Long)timesheet[0];
	         int userid = (Integer)timesheet[1];
	        
	         Invoice_data invoice = new Invoice_data();
	         invoice.setHours((int)hours);
	         invoice.setProjectrange(project_data.getState_date().substring(0, project_data.getState_date().lastIndexOf("/")) + " - "+project_data.getEnd_date().substring(0, project_data.getEnd_date().lastIndexOf("/")));
	        
	         People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();
	         People_data people_data =  people_dataDaoImpl.read(userid);

	         invoice.setAmount((int)hours * people_data.getBill_rate());
	         invoice.setRate(people_data.getBill_rate());
	         invoice.setEmployeeName(people_data.getName());
	         
	         outstandingdue+=invoice.getAmount();
	         invoice_data.add(invoice);
		

		}
%>
<button type="button" class="btn btn-primary" id="print">Save</button>

<div class="input-group pull-right" style="float: right;width: 300px;">
	<input type="text" class="form-control" id="to" placeholder="Enter email address">
	<span class="input-group-btn">
		<button class="btn btn-default" type="button" onclick="sendemail()">Email!</button>
	</span>
</div>

<div class="invoicedata" style="margin-top: 30px;" id="invoicedata">
	<table width=600 cellpadding=7 cellspacing=0>

		<tr>
			<td width=89 valign=top style="border: none;"><img
					id="logoimage" SRC="logo.png" align=bottom width=76 height=91 /></td>
			<td width=473 style="border: none;">
				<p align=center>
					<font size=5><b>Eagle Consulting Invoice</b></font>
				</p>
			</td>
		</tr>
	</table>
	<br />
	<table width=600 cellpadding=7 cellspacing=0>

		<tr valign=top>
			<td width=300
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p style="margin-top: 25px">To:</p>
				<p>
					<%
						out.print(client.getName());
					%>
				</p>
				<p>
					<%
						out.print(client.getAddress_line_1());
					%>
					<%
						out.print(client.getAddress_line_2());
					%>
				</p>
				<p>
					<%
						out.print(client.getCity());
					%>,
					<%
						out.print(client.getState());
					%>
					<%
						out.print(client.getZip());
					%>
				</p>
				<p>
					<br>
				</p>
				<p>
					Client ID:
					<%
					out.print(client.getNumber());
				%>
				</p>
				<p>
					<br>
				</p>
				<p>
					project:
					<%
					out.print(project_data.getProject_name());
				%>
				</p>
				<p>
					<br>
				</p>
			</td>
			<td width=300
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p style="margin-top: 25px">
					Invoice Number:
					<%
					out.print(client.getNumber());
				%>
				</p>
				<p>
					<br>
				</p>
				<p>
					Invoice Date:
					<%
					Date date = new Date();
										 String formatted= new SimpleDateFormat("M/dd/yyyy").format(date);
										 out.print(formatted);
				%>

				</p>
				<p>
					<br>
				</p>
				<p>
					payment Terms:
					<%
					out.print(client.getBilling_terms());
				%>
				</p>
				<p>
					<br>
				</p>
				<p>
					Billing Frequency:
					<%
					out.print(client.getInvoice_freq());
				%>
				</p>
				<p>
					<br>
				</p>
				<p>
					Total Amount Due: $
					<%
					out.print(outstandingdue);
				%>
				</p>
			</td>
		</tr>
	</table>
	<p>
		<br>
	</p>
	<p>Details</p>
	<p>
		<br>
	</p>
	<table width=600 cellpadding=7 cellspacing=0>

		<tr valign=top>
			<td width=70
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p>
					<B>Date</B>
				</p>
			</td>
			<td width=216
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p>
					<B>Description</B>
				</p>
			</td>
			<td width=80
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p align=right>
					<B>Rate</B>
				</p>
			</td>
			<td width=64
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p align=right>
					<B>Hours</B>
				</p>
			</td>
			<td width=88
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p align=right>
					<B>Amount</B>
				</p>
			</td>
		</tr>

		<%
			for (Invoice_data invoice : invoice_data) {
		%>

		<tr valign=top>
			<td width=70
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p>
					<%
						out.print(invoice.getProjectrange());
					%>
					<br>
				</p>
			</td>
			<td width=216
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p>
					<%
						out.print(invoice.getEmployeeName());
					%>
					<br>
				</p>
			</td>
			<td width=80
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p align=right>
					<%
						out.print(invoice.getRate());
					%>
					<br>
				</p>
			</td>
			<td width=64
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p align=right>
					<%
						out.print(invoice.getHours());
					%>
					<br>
				</p>
			</td>
			<td width=88
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p align=right>
					<%
						out.print(invoice.getAmount());
					%>
					<br>
				</p>
			</td>
		</tr>

		<%
			}
		%>

		<tr valign=top>
			<td colspan=4 width=472
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p align=right>Total</p>
			</td>
			<td width=88
				style="border: 1px solid; padding-left: 8px; padding-right: 8px">
				<p align=right>
					<span class="totalamountdue">
						<%
							out.print(outstandingdue);
						%>
					</span>
				</p>
			</td>
		</tr>
	</table>

	<p>
		<br>
	</p>
	<p>
		<br>
	</p>
	<p>Remit payment To:</p>
	<p style="margin-left: 5px;">Eagle Consulting</p>
	<p style="margin-left: 5px;">2501 E Memorial Road</p>
	<p style="margin-left: 5px;">Edmond, Ok 73013</p>
	<p>
		<br>
	</p>
	<p>
		<br>
	</p>
	<%
		}
	%>
</div>
