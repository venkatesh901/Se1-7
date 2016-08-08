
<form action="projects" method="post" role="form"
	class="form-horizontal form-label-left">


	<input type="hidden" name="action" value="add">
	<div class="row setup-content">
		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Project
				Number <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" name="projectnumber" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Client
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" name="clientnumber" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Project
				Name Line <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="projectname" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Start
				Date <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">

				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<input type="text" name="startdate" class="form-control"
						data-inputmask="'alias': 'mm/dd/yyyy'" data-mask id="datemask" />
				</div>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">End
				Date <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<input type="text" name="enddate" class="form-control"
						data-inputmask="'alias': 'mm/dd/yyyy'" data-mask id="datemask1" />
				</div>
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Project
				Manager <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="projectmanager" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Client
				Contact <span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="text" name="clientcontact" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-md-3 col-sm-3 col-xs-12">Budget
				<span class="required">*</span>
			</label>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<input type="number" name="budget" required="required"
					class="form-control col-md-7 col-xs-12">
			</div>
		</div>



	</div>

	<button class="btn btn-success btn-add mr30" type="submit">Submit</button>

</form>