<%@page import="invoice.generator.jpa.People_dataDaoImpl"%>
<%@page import="invoice.generator.jpa.Project_dateDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="invoice.generator.pojo.TimeSheet_data"%>

<%
	ArrayList<TimeSheet_data> timesheetdata = (ArrayList<TimeSheet_data>) request.getAttribute("timesheetdata");
	
	Project_dateDaoImpl project_dateDaoImpl = new Project_dateDaoImpl();
	People_dataDaoImpl people_dataDaoImpl = new People_dataDaoImpl();
%>

<div class="box-body table-responsive no-padding">

	<table class="table table-bordered table-striped" id="example2">
		<thead>
			<tr>
				<th>User</th>
				<th>Hours</th>
				<th>Date</th>
				<th>Project</th>
				<th>Options</th>

			</tr>
		</thead>
		<tbody>


			<%
				for (TimeSheet_data timeData : timesheetdata) {
			%>
			<tr>

				<td>
					<%
						out.print(people_dataDaoImpl.read(timeData.getUserid()).getName());
					%>
				</td>
				<td>
					<%
						out.print(timeData.getHours());
					%>
				</td>
				<td>
					<%
						out.print(timeData.getDate());
					%>
				</td>

				<td>
					<%
						out.print(project_dateDaoImpl.read(timeData.getProjectnumber()).getProject_name());
					%>
				</td>
				<td>
					<form action="timesheets" method="post" class="sidebar-form">
					    <input type="hidden" name="action" value="approve">
					
						<input type="hidden" name="id" class="form-control"
							value="<%out.print(timeData.getId());%>"
							placeholder="Search..." />
						<button type='submit' class="btn btn-success">Approve</button>
					</form>
					<form action="timesheets" method="post" class="sidebar-form">
					    <input type="hidden" name="action" value="decline">
					
						<input type="hidden" name="id" class="form-control"
							value="<%out.print(timeData.getId());%>"
							placeholder="Search..." />
						<button type='submit' class="btn btn-danger">Decline</button>
					</form>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>

</div>