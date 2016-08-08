<%@page import="invoice.generator.pojo.People_data"%>

<%
	People_data editdata = null;
	if (request.getAttribute("editdata") != null) {
		editdata = (People_data) request.getAttribute("editdata");
	}
%>


<form action="people" method="post" role="form"
	class="form-horizontal form-label-left">
	<input type="hidden" name="action" value="getperson">

	<div>
		<label class="control-label col-md-3 ">Person id <span
				class="required">*</span>
		</label>
		<div class="col-md-5">
			<input type="number" name="id" required="required"
				class="form-control col-md-7">
		</div>
		<button class="btn btn-primary col-md-2" type="submit"
			style="height: 35px">Submit</button>

	</div>


</form>


<%
	if (editdata != null) {
%>

<form action="people" method="post" role="form"
	class="form-horizontal form-label-left mr30">


	<input type="hidden" name="action" value="edit">
	<input type="hidden" name="id" value="<%out.print(editdata.getId());%>">
	
	<div class="form-group">
		<label class="control-label col-md-3 col-sm-3 col-xs-12">Name
			<span class="required">*</span>
		</label>
		<div class="col-md-6 col-sm-6 col-xs-12">
			<input type="text" name="name" required="required" value="<%out.print(editdata.getName());%>"
				class="form-control col-md-7 col-xs-12">
		</div>
	</div>


	<div class="form-group">
		<label class="control-label col-md-3 col-sm-3 col-xs-12">Title
			<span class="required">*</span>
		</label>
		<div class="col-md-6 col-sm-6 col-xs-12">
			<input type="text" name="title" required="required" value="<%out.print(editdata.getTitle());%>"
				class="form-control col-md-7 col-xs-12">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3 col-sm-3 col-xs-12">Bill
			Rate <span class="required">*</span>
		</label>
		<div class="col-md-6 col-sm-6 col-xs-12">
			<input type="number" name="billrate" required="required" value="<%out.print(editdata.getBill_rate());%>"
				class="form-control col-md-7 col-xs-12">
		</div>
	</div>

	<div class="form-group">
		<label class="control-label col-md-3 col-sm-3 col-xs-12"> Role
			<span class="required">*</span>
		</label>
		<div class="col-md-6 col-sm-6 col-xs-12">
			<div class="radio">
				<label><input type="radio" name="role" checked="checked"
						value="Project Manager">Project Manager</label>
			</div>
			<div class="radio">
				<label><input type="radio" name="role" value="Developer">Developer</label>
			</div>

		</div>
	</div>

	<button class="btn btn-success btn-add mr30" type="submit">Submit</button>
</form>
<%
	}
%>