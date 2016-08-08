<%@page import="invoice.generator.pojo.Company_data"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList<Company_data> companyData = (ArrayList<Company_data>) request.getAttribute("companyData");
%>

<div class="table-responsive">

<table class="table table-bordered table-striped" id="example2">
	<thead>
		<tr>
			<th >Name</th>
			<th >Address Line 1</th>
			<th>Address Line 2</th>
			<th>City</th>
			<th>State</th>
			<th>Zip</th>
		</tr>
	</thead>
	<tbody>

		<%
			for (Company_data company : companyData) {
		%>
		<tr>
			<td>
				<%
					out.print(company.getName());
				%> <br />
			</td>
			<td>
				<%
					out.print(company.getAddress_line_1());
				%>
			</td>
			<td>
				<%
					out.print(company.getAddress_line_2());
				%>
			</td>

			<td>
				<%
					out.print(company.getCity());
				%>
			</td>
			<td>
				<%
					out.print(company.getState());
				%>

			</td>
			<td>
				<%
					out.print(company.getZip());
				%>

			</td>

		</tr>
		<%
			}
		%>

	</tbody>
</table>
</div>

