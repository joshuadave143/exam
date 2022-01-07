
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PORTLET-->
		<div class="portlet">
			<div class="portlet-title">
				<div class="caption">
					<i class="fa fa-reorder"></i>Time
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="/Registration" class="form-horizontal form-bordered" method="post">
					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">Date</label>
							<div class="col-md-3">
								<input type="text" name="date" id="date" data-date-format="yyyy-mm-dd" required>
							</div>
						</div>
					</div>

					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">Available start times (AM)</label>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-default active">
									<input type="radio" class="toggle" name="time" value="8:00 AM" required> 8:00 AM </label>
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="time" value="9:00 AM" required> 9:00 AM </label>
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="time" value="10:00 AM" required> 10:00 AM </label>
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="time" value="11:00 AM" required> 11:00 AM </label>
								
							</div>
						</div>
					</div>
					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">Available start times (PM)</label>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="time" value="1:00 PM" required> 1:00 PM </label>
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="time" value="2:00 PM" required> 2:00 PM </label>
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="time" value="3:00 PM" required> 3:00 PM </label>
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="time" value="4:00 PM" required> 4:00 PM </label>
								<label class="btn btn-default">
									<input type="radio" class="toggle" name="time" value="4:00 PM" required> 5:00 PM </label>
							</div>
						</div>
					</div>

					<div class="form-actions">
						<div class="row">
							<div class="col-md-offset-3 col-md-9">
								<button type="submit" id="next" class="btn btn-success">Next</button>
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