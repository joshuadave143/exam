
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-reorder"></i>Information
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="/Registration" id="info" class="form-horizontal form-bordered" method="post">
					<input type="hidden" name="time" value="<?=$time['time']?>" required>
					<input type="hidden" name="date" value="<?=$time['date']?>" required>
					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">First Name</label>
							<div class="col-md-3">
								<input type="text" name="firstname" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Last Name</label>
							<div class="col-md-3">
								<input type="text" name="lastname" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Age</label>
							<div class="col-md-3">
								<input type="text" name="age" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Gender</label>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="gender" value="Male" required> Male </label>
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="gender" value="Female" required> Female </label>
								
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Address</label>
							<div class="col-md-3">
								<input type="text" name="address" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Cellphone #</label>
							<div class="col-md-3">
								<input type="text" name="phone_no" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Email</label>
							<div class="col-md-3">
								<input type="email" name="email" required>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">Concerns</label>
							<div class="col-md-3">
								<textarea class="form-control" name="concerns">
								</textarea>
							</div>
						</div>
					</div>

					<div class="form-actions">
						<div class="row">
							<div class="col-md-offset-3 col-md-9">
								<button type="submit" id="submit" class="btn btn-success">Submit</button>
							</div>
						</div>
					</div>
				</form>
				<!-- END FORM-->
			</div>
		</div>
		<!-- END PORTLET-->
	</div>

</div>