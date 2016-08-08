<form action="people" method="post" role="form"
	class="form-horizontal form-label-left">


	<input type="hidden" name="action" value="add">
	<div class="row setup-content">
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Name
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="name" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Title
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="title" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Bill
				Rate <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" name="billrate" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">
				Role <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="radio">
					<label><input type="radio" name="role" checked="checked" value="Project Manager">Project Manager</label>
				</div>
				<div class="radio">
					<label><input type="radio" name="role" value="Developer">Developer</label>
				</div>

			</div>
		</div>

</div>

	<button class="btn btn-success btn-add mr30" type="submit">Submit</button>

</form>