<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Edit Laundry';?> | <?=SITE_TITLE;?></title>
	<?php $this->load->view('include/header'); ?>
</head>
<body>
	<!--===========top nav start=======-->
	<?php $this->load->view('include/topbar'); ?>
	<!--===========top nav end===========-->
	<div class="wrapper" id="wrapper">
		<div class="left-container" id="left-container">
			<!--========== Sidebar Start =============-->
			<?php 
			$page['link_page']= [
				"Laundry Management"=>base_url()."auth/laundry_management"
			];
			?>
			<?php $this->load->view('include/sidebar',$page); ?>
			<!--========== Sidebar End ===============-->
		</div>
		<div class="right-container" id="right-container">
			<div class="container-fluid">
				<?php 

// echo "<pre>";print_r($data->id); die();
				?>
				<?php $this->load->view('include/page-top',$page); ?>
				<!--//===============Main Container Start=============//-->
				<div class="row padding-top">
					<div class="col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">

								<span class="panel-title"><i class="fa fa-list"></i>Update Laundry</span>
								
							</div>
							<div class="panel-body">
								<?=form_open_multipart("auth/update_laundry/".$data['id'],['class'=>'form-horizontal']); ?>
								<legend>Update Laundry</legend>
								<div class="form-group">
									<label for="select" class="col-lg-3 control-label">Select Country</label>
									<div class="col-lg-3">
										<select name="country" class="form-control" required>
											<option value="">Please Select Country</option>
											<?php foreach($country->result_array() as $value): ?>
												<option value="<?= $value['id']; ?>" <?= ($value['id']==$data['country_id'])?"selected":"" ?> ><?= $value['country_name']; ?></option>
											<?php endforeach; ?>
										</select>
									</div>

									<label class="col-lg-3 control-label">Laundry Name</label>
									<div class="col-lg-3">
										<input type="text" value="<?= $data['vendor_name'] ?>" name="laundry_name" class="form-control date" id="" placeholder="Laundry Name" required>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-3 control-label">Contact Number</label>
									<div class="col-lg-3">
										<input type="text" value="<?= $data['contact_number'] ?>" name="mobile" class="form-control date" id="" onkeypress="return IsNumeric(event);" maxlength="10" placeholder="Contact Number" readonly required>
									</div>

									<label class="col-lg-3 control-label">Email id</label>
									<div class="col-lg-3">
										<input type="text" value="<?= $data['contact_email_id'] ?>" name="email" class="form-control date" id="" placeholder="Email id" required>
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-3 control-label">Enter Google Location:</label>
									<div class="col-lg-3">
										<input type="text" value="<?= $data['vendor_gps_address'] ?>" name="locality" class="form-control" id="address" placeholder="Enter Google Location" >
									</div>

									<div class="col-lg-3">
										<input type="text" name="latitude" id="latitude" class="form-control" value="<?= $data['vendor_lat'] ?>" placeholder="Latitude" readonly />
									</div>

									<div class="col-lg-3">
										<input type="text" name="longitude" id="longitude" class="form-control" value="<?= $data['vendor_long'] ?>" placeholder="Longitude" readonly />
									</div>


								</div>
								<div class="form-group">
									<label for="select" class="col-lg-3 control-label">Status</label>
									<div class="col-lg-3">
										<select name="status" class="form-control" required>

											<option value="1" <?= ("1"==$data['vendor_status'])?"selected":"" ?>>Active</option>
											<option value="0" <?= ("0"==$data['vendor_status'])?"selected":"" ?>>De-Active</option>

										</select>
									</div>

									<label class="col-lg-3 control-label">Is Recommended</label>
									<div class="col-lg-3">
										<input class="form-check-input" type="checkbox" name="recommended" value="1" id="" <?= ("1"==$data['is_recomended'])?"checked":"" ?>>
									</div>

								</div>
								

								<div class="form-group">
									<label class="col-lg-3 control-label">Laundry Display Address</label>
									<div class="col-lg-3">
										<textarea rows="4" name="display_address" class="form-control" required placeholder="Laundry Display Address"><?= $data['vendor_display_address'] ?></textarea>
									</div>

									<label class="col-lg-3 control-label">Loundry Info</label>
									<div class="col-lg-3">
										<textarea rows="4" name="loundry_info" class="form-control" required placeholder="Loundry Info"><?= $data['loundry_info'] ?></textarea>
									</div>

								</div>

								<div class="form-group">
									
									<label class="col-lg-3 control-label">Password:</label>
									<div class="col-lg-3">
										<input type="text" value="<?= $data['contact_password'] ?>" name="password" class="form-control" id="password" placeholder="Enter Password" >
									</div>

									

								</div>

								<div class="form-group">
									
									

									<label class="col-lg-3 control-label">Choose Photo:</label>
									<div class="col-lg-3">
										<input type="file" accept="image" name="image" id="image_path" class="form-control image_path">
									</div>
									<div class="col-lg-4">

										<img src="<?=base_url('uploads/'.$data['vendor_image']);?>" style="" id="blah" height="100" width="100">
									</div>
								</div>

								<div class="form-group">
									<div class="col-lg-9 col-lg-offset-3">
										<button type="submit" class="btn btn-primary">Update</button>
									</div>
								</div>

							</form>

						</div>
					</div>
				</div>         
			</div>
			<!--//===============Main Container End=============//-->
		</div>
	</div>
</div>
<!--==========Footer Start=============-->
<?php $this->load->view('include/footer'); ?>
<!--==========Footer End=============-->   
</body>
</html>


<style type="text/css">
	.btn-circle{
		border-radius: 50%;
	}
	.Udeactive{
		background: darkred;
		color: #fff;
	}
	.Uactive{
		background: darkgreen;
		color: #fff;
	}
</style>
<script
src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyAxjhYRYF55ECyydEsfYaKCfk8kpgwKkEw&libraries=places">
< script src = "http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" >
</script>
<script type="text/javascript">
	var input = document.getElementById('address');
	var options = {
		componentRestrictions: {
			country: 'in'
		}
	};
	var autocomplete = new google.maps.places.Autocomplete(input, options);
	google.maps.event.addListener(autocomplete, 'place_changed', function() {
		var place = autocomplete.getPlace();
		var lat = place.geometry.location.lat(),
		lng = place.geometry.location.lng();
		$('#latitude').val(lat);
		$('#longitude').val(lng);

	})

	var specialKeys = new Array();
	specialKeys.push(8); //Backspace
	function IsNumeric(e) {
		var keyCode = e.which ? e.which : e.keyCode
		var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
		
		return ret;
	}
</script>