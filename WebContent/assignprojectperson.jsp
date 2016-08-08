<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="invoice.generator.pojo.People_data"%>
<%@page import="invoice.generator.pojo.Project_data"%>

<%
	ArrayList<People_data> peopledata = null;
	if (request.getAttribute("peopledata") != null) {
		peopledata = (ArrayList<People_data>) request.getAttribute("peopledata");
	}
	

	ArrayList<Project_data> projectdata = (ArrayList<Project_data>) request.getAttribute("projectdata");
%>


<form action="managerprojectperson" method="post" role="form"
	class="form-horizontal form-label-left">
	
    <input type="hidden" name="action" value="add">

	<div>

		<div class="form-group">

			<label class="control-label col-md-3 ">Choose Person <span
					class="required">*</span>
			</label>
			<div class="col-md-5">
				<select class="form-control" name="personname" id="personname"
					required>

					<%
						if(peopledata !=null) {
									for (People_data person: peopledata) {
					%>
					<option value="<%out.print(person.getName());%>">
						<%
							out.print(person.getName());
						%>
					</option>
					<%
						}
								 }
					%>
				</select>
			</div>
		</div>

		<div class="form-group">

			<label class="control-label col-md-3 ">Choose Project <span
					class="required">*</span>
			</label>
			<div class="col-md-5">
				<select class="form-control" name="projectnumber" id="projectnumber"
					required>

					<%
						if(projectdata !=null) {

									for (Project_data project: projectdata) {
					%>
					<option value="<%out.print(project.getProject_number());%>"
						class="<%out.print(project.getProject_name());%>">
						<%
							out.print(project.getProject_name());
						%>
					</option>
					<%
						} }
					%>
				</select>
			</div>
		</div>


	</div>




	<button class="btn btn-primary col-md-2" type="submit" align="center"
		style="height: 35px;margin-left: 150px;">Submit</button>

</form>
