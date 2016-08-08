<%@page import="invoice.generator.pojo.People_data"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="invoice.generator.pojo.Project_data"%>

<%
	ArrayList<People_data> peopleData = (ArrayList<People_data>) request.getAttribute("peopleData");
%>

<div class="table-responsive">

	<table class="table table-bordered table-striped" id="example2">
		<thead>
			<tr>
				<th>Status</th>
				<th>Id</th>
				<th>Name</th>
				<th>Title</th>
				<th>Bill Rate</th>
				<th>Role</th>

			</tr>
		</thead>
		<tbody>

			<%
				for (People_data people : peopleData) {
			%>
			<tr>
				<td>
					<%
						if(people.getCurrentstate() ==0) {
					%> <span
						class="label label-success">Active</span> <%
 	} else {
 %> <span class="label label-danger">In Active</span> <%
 	}
 %>
				</td>
				<td>
					<%
						out.print(people.getId());
					%>
				</td>
				<td>
					<%
						out.print(people.getName());
					%>
				</td>
				<td>
					<%
						out.print(people.getTitle());
					%>
				</td>

				<td>
					<%
						out.print(people.getBill_rate());
					%>
				</td>
				<td>
					<%
						out.print(people.getRole());
					%>

				</td>

			</tr>
			<%
				}
			%>

		</tbody>
	</table>
</div>

