<%@page import="invoice.generator.jpa.ProjectPersonDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="invoice.generator.pojo.People_data"%>
<%@page import="invoice.generator.pojo.Project_data"%>

<%
	ArrayList<Project_data> projectdata = (ArrayList<Project_data>) request.getAttribute("projectdata");

	ProjectPersonDaoImpl projectPersonDaoImpl = new ProjectPersonDaoImpl();
	
	ArrayList<Integer> projectnumbers = projectPersonDaoImpl.getProjects((String)session.getAttribute("name"));
	
%>

<form action="timesheets" method="post" role="form"
	class="form-horizontal form-label-left">
	<input type="hidden" name="action" value="add">

	<div class="row setup-content">

		<div class="form-group">

			<label class="control-label col-md-3 ">Choose Project <span
					class="required">*</span>
			</label>
			<div class="col-md-6">
				<select class="form-control" name="projectnumber" id="projectnumber"
					required>

					<%
						if(projectdata !=null) {
             	for (Project_data project: projectdata) {
             		
             		if(projectnumbers.contains(project.getProject_number())) {
					%>
					<option value="<%out.print(project.getProject_number());%>"
						class="<%out.print(project.getProject_name());%>">
						<%
							out.print(project.getProject_name());
						%>
					</option>
					<%
						} } }
					%>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Enter
				Date <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">

				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<input type="text" name="date" class="form-control"
						data-inputmask="'alias': 'mm/dd/yyyy'" data-mask id="datemask" />
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">
				Hours <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" name="hours" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>


	</div>

	<button class="btn btn-success btn-add mr30" type="submit">Submit</button>

</form>

<script src="js/input-mask/jquery.inputmask.js" type="text/javascript"></script>
<script src="js/input-mask/jquery.inputmask.date.extensions.js"
	type="text/javascript"></script>
<script src="js/input-mask/jquery.inputmask.extensions.js"
	type="text/javascript"></script>

<script type="text/javascript" src="js/moment/moment.min.js"></script>
<script type="text/javascript" src="js/datepicker/daterangepicker.js"></script>

<script>
	$(function() {
	

	});

	$(document).ready(function() {

		$('#datemask').daterangepicker({
			singleDatePicker : true,
			calender_style : "picker_4"
		}, function(start, end, label) {
			console.log(start.toISOString(), end.toISOString(), label);
		});

		$('#datemask1').daterangepicker({
			singleDatePicker : true,
			calender_style : "picker_4"
		}, function(start, end, label) {
			console.log(start.toISOString(), end.toISOString(), label);
		});
	});
</script>