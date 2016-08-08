<%@page import="invoice.generator.pojo.ProjectPerson_data"%>
<%@page import="invoice.generator.pojo.People_data"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="invoice.generator.pojo.Project_data"%>

<%
	ArrayList<ProjectPerson_data> projectpersonData = (ArrayList<ProjectPerson_data>) request.getAttribute("projectpersonData");
%>

<div class="table-responsive">

	<table class="table table-bordered table-striped" id="example2">
		<thead>
			<tr>
				<th>Id</th>
				<th>Project Number</th>
				<th>Person Name</th>

			</tr>
		</thead>
		<tbody>

			<%
				for (ProjectPerson_data projectperson : projectpersonData) {
			%>
			<tr>
				<td>
					<%
						out.print(projectperson.getId());
					%> <br />
				</td>
				<td>
					<%
						out.print(projectperson.getProject_number());
					%>
				</td>
				<td>
					<%
						out.print(projectperson.getProject_name());
					%>
				</td>



			</tr>
			<%
				}
			%>

		</tbody>
	</table>
</div>

