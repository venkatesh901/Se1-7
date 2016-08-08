<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="invoice.generator.pojo.Client_data"%>

<%
	ArrayList<Client_data> clientData = (ArrayList<Client_data>) request.getAttribute("clientData");
%>

<div class="box-body table-responsive no-padding">

	<table class="table table-bordered table-striped" id="example2">
		<thead>
			<tr>
				<th>Status</th>

				<th>Number</th>
				<th>Name</th>
				<th>Address Line 1</th>
				<th>Address Line 2</th>
				<th>City</th>
				<th>State</th>
				<th>Zip</th>
				<th>Email</th>
				<th>Contact</th>
				<th>Invoice Freq</th>
				<th>Billing Terms</th>
				<th>Invoice Grouping</th>

			</tr>
		</thead>
		<tbody>

			<%
				for (Client_data client : clientData) {
			%>
			<tr>
			<td>
			    <% if(client.getCurrentstate() ==0) { %>
				<span class="label label-success">Active</span>
				<% } else {
				
					%>
									<span class="label label-danger">In Active</span>
					
					 <% 
					
				} %>
				</td>
				<td>
					<%
						out.print(client.getNumber());
					%>
				</td>
				<td>
					<%
						out.print(client.getName());
					%>
				</td>
				<td>
					<%
						out.print(client.getAddress_line_1());
					%>
				</td>

				<td>
					<%
						out.print(client.getAddress_line_2());
					%>
				</td>
				<td>
					<%
						out.print(client.getCity());
					%>

				</td>
				<td>
					<%
						out.print(client.getState());
					%>

				</td>
				<td>
					<%
						out.print(client.getZip());
					%>

				</td>
				<td>
					<%
						out.print(client.getEmail());
					%>

				</td>
				<td>
					<%
						out.print(client.getContact());
					%>

				</td>
				<td>
					<%
						out.print(client.getInvoice_freq());
					%>

				</td>
				<td>
					<%
						out.print(client.getBilling_terms());
					%>

				</td>
				<td>
					<%
						out.print(client.getInvoice_grouping());
					%>

				</td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>
</div>

