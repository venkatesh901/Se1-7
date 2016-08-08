<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="invoice.generator.pojo.Project_data"%>

<%
	ArrayList<Project_data> projectsData = (ArrayList<Project_data>) request.getAttribute("projectsData");
%>

<div class="table-responsive">

	<table class="table table-bordered table-striped" id="example2">
		<thead>
			<tr>
				<th>Status</th>

				<th>Client</th>
				<th>Project Number</th>
				<th>Project Name</th>
				<th>State Date</th>
				<th>End Date</th>
				<th>Project Manager</th>
				<th>Client Contact</th>
				<th>Budget</th>

			</tr>
		</thead>
		<tbody>

			<%
				for (Project_data project : projectsData) {
			%>
			<tr>

				<td>
					<%
						if(project.getStatus().equals("In Progress")) {
					%> <span
						class="label label-success"><% out.print(project.getStatus()); %></span>
					<%
						} else {
					%> <span class="label label-danger"><% out.print(project.getStatus());%></span>

					<%
						}
					%>
				</td>
				<td>
					<%
						out.print(project.getClient());
					%>
				</td>
				<td>
					<%
						out.print(project.getProject_number());
					%>
				</td>
				<td>
					<%
						out.print(project.getProject_name());
					%>
				</td>

				<td>
					<%
						out.print(project.getState_date());
					%>
				</td>
				<td>
					<%
						out.print(project.getEnd_date());
					%>

				</td>

				<td>
					<%
						out.print(project.getProject_manager());
					%>

				</td>
				<td>
					<%
						out.print(project.getClient_contact());
					%>

				</td>
				<td>
					<%
						out.print(project.getBudget());
					%>

				</td>
			</tr>
			<%
				}
			%>

		</tbody>
	</table>
</div>

