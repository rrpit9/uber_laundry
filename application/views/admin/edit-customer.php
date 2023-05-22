<!DOCTYPE html>
<html lang="en">
	<head>
		<title><?=$page['page']='Edit Customer';?> | <?=SITE_TITLE;?></title>
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
					"Customer Management"=>base_url()."auth/customer_management"
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
									
									<span class="panel-title"><i class="fa fa-list"></i>Update Customer</span>
									
								</div>
								<div class="panel-body">
									<?=form_open_multipart("auth/update_customer/".$data['id'],['class'=>'form-horizontal']); ?>
									<legend>Update Customer</legend>
									<div class="form-group">
										
										<label class="col-lg-3 control-label">Customer Name</label>
										<div class="col-lg-3">
											<input type="text" value="<?= $data['full_name'] ?>" name="customer_name" class="form-control date" id="" placeholder="Customer Name" required>
										</div>
										
										
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">Contact Number</label>
										<div class="col-lg-3">
											<input type="text" value="<?= $data['mobile_number'] ?>" name="mobile" class="form-control date" id="" onkeypress="return IsNumeric(event);" maxlength="10" placeholder="Contact Number" readonly required>
										</div>
										
										<label class="col-lg-3 control-label">Email id</label>
										<div class="col-lg-3">
											<input type="text" value="<?= $data['email_id'] ?>" name="email" class="form-control date" id="" placeholder="Email id" readonly required>
										</div>
									</div>
									<div class="form-group">
										<label class="col-lg-3 control-label">Enter Google Location:</label>
										<div class="col-lg-3">
											<input type="text" value="<?= $data['gps_address'] ?>" name="locality" class="form-control" id="address" placeholder="Enter Google Location" >
										</div>
										
										<div class="col-lg-3">
											<input type="text" name="latitude" id="latitude" class="form-control" value="<?= $data['gps_lat'] ?>" placeholder="Latitude" readonly />
										</div>
										
										<div class="col-lg-3">
											<input type="text" name="longitude" id="longitude" class="form-control" value="<?= $data['gps_long'] ?>" placeholder="Longitude" readonly />
										</div>
										
										
									</div>
									<div class="form-group">
										<label for="select" class="col-lg-3 control-label">Status</label>
										<div class="col-lg-3">
											<select name="status" class="form-control" required>
												
												<option value="1" <?= ("1"==$data['user_status'])?"selected":"" ?>>Active</option>
												<option value="0" <?= ("0"==$data['user_status'])?"selected":"" ?>>De-Active</option>
												
											</select>
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