<%@page import="invoice.generator.pojo.Client_data"%>

<%
	Client_data editdata = null;
	if (request.getAttribute("editdata") != null) {
		editdata = (Client_data) request.getAttribute("editdata");
	}
%>


<form action="clients" method="post" role="form"
	class="form-horizontal form-label-left">
	<input type="hidden" name="action" value="getclient">

	<div >
		<label class="control-label col-md-3 ">Number
			<span class="required">*</span>
		</label>
		<div class="col-md-5">
			<input type="number" name="number" required="required"
				class="form-control col-md-7">
		</div>
			<button class="btn btn-primary col-md-2" type="submit" style="height: 35px">Submit</button>
		
	</div>


</form>


<%
	if (editdata != null) {
%>

<form action="clients" method="post" role="form"
	class="form-horizontal form-label-left mr30">


	<input type="hidden" name="action" value="edit">
	<input type="hidden" name="number"
		value="<%out.print(editdata.getNumber());%>">

	<div class="row setup-content">



		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Name
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="name" required="required"
					class="form-control col-md-7 col-xs-12"
					value="<%out.print(editdata.getName());%>">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Address
				Line 1 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="addressline1" required="required"
					value="<%out.print(editdata.getAddress_line_1());%>"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Address
				Line 2 <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="addressline2" required="required"
					value="<%out.print(editdata.getAddress_line_2());%>"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">City
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="city" required="required"
					value="<%out.print(editdata.getCity());%>"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">State
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="state" required="required"
					value="<%out.print(editdata.getState());%>"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Zip
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="zip" required="required"
					value="<%out.print(editdata.getZip());%>"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Email
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="email" required="required"
					value="<%out.print(editdata.getEmail());%>"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Contact
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="contact" required="required"
					value="<%out.print(editdata.getContact());%>"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Invoice
				Freq</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<select class="form-control" name="invoicefreq">

					<option class="" value="Weekly">Weekly</option>
					<option class="" value="BiWeekly">BiWeekly</option>
					<option class="" value="Monthly">Monthly</option>
					<option class="" value="Monthly-Cal">Monthly-Cal</option>


				</select>
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Billing
				Terms</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<select class="form-control" name="billingterms">

					<option class="" value="Due on Recipt">Due on Recipt</option>
					<option class="" value="Net 10 Days">Net 10 Days</option>
					<option class="" value="Net 20 Days">Net 20 Days</option>
					<option class="" value="Net 30 Days">Net 30 Days</option>
					<option class="" value="Net 60 Days">Net 60 Days</option>


				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Invoice
				Grouping </label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<select class="form-control" name="invoicegrouping">

					<option class="" value="Project">Project</option>
					<option class="" value="Invoice">Invoice</option>
				</select>
			</div>
		</div>


	</div>

	<button class="btn btn-success btn-add mr30" type="submit">Submit</button>

</form>
<%
	}
%>