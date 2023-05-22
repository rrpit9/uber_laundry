<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Edit Rider Management';?> | <?=SITE_TITLE;?></title>
	<?php $this->load->view('include/header'); ?>
</head>
<body>
	<!--===========top nav start=======-->
	<?php $this->load->view('include/topbar'); ?>
	<!--===========top nav end===========-->
	<div class="wrapper" id="wrapper">
		<div class="left-container" id="left-container">
			<!--========== Sidebar Start =============-->
			<?php $this->load->view('include/sidebar',$page); ?>
			<!--========== Sidebar End ===============-->
		</div>
		<div class="right-container" id="right-container">
			<div class="container-fluid">
				<?php 
				$page['link_page']= [
					"Management"=>base_url()."auth/laundry_management",
					"Dashboard"=>base_url()."auth/laundry_dashboard/".end($this->uri->segments)
				];
				?>

				<?php $this->load->view('include/page-top',$page); ?>
				<!--//===============Main Container Start=============//-->

				<div class="container-fluid">


					<div class="row padding-top">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-heading">

									<span class="panel-title"><i class="fa fa-list"></i>Edit Rider <?=$rider->row()->rider_name ?></span>

								</div>
								<div class="panel-body">
									<?=form_open_multipart('auth/update_rider/'.$rider->row()->id,['class'=>'form-horizontal']); ?>


									
									<div class="form-group">
										
										<input type="hidden" name="rider_id" value="<?=$rider->row()->id ?>">
										<label class="col-lg-3 control-label">Rider Name</label>
										<div class="col-lg-3">
											<input type="text" value="<?=$rider->row()->rider_name ?>" name="rider_name" class="form-control date" id="" placeholder="Rider Name" required>
										</div>

										<label class="col-lg-3 control-label">Password</label>
										<div class="col-lg-3">
											<input type="text" value="<?=$rider->row()->rider_password ?>" name="rider_password" class="form-control" id="" placeholder="Password" required>
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-3 control-label">Contact Number</label>
										<div class="col-lg-3">
											<input type="text" value="<?=$rider->row()->rider_mobile_no ?>" name="mobile" class="form-control date" id="" onkeypress="return IsNumeric(event);" maxlength="10" placeholder="Contact Number" required>
										</div>

										<label class="col-lg-3 control-label">Email id</label>
										<div class="col-lg-3">
											<input type="text" value="<?=$rider->row()->rider_email_id ?>" name="email" class="form-control date" id="" placeholder="Email id" required>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">Address</label>
										<div class="col-lg-3">
											<textarea rows="4" name="address" class="form-control" required placeholder="Address"><?=$rider->row()->rider_permanant_address ?></textarea>
										</div>
										

										<label for="select" class="col-lg-3 control-label">Status</label>
										<div class="col-lg-3">
											<select name="status" class="form-control" required>

												<option value="1" <?= ("1"== $rider->row()->rider_status)?"selected":"" ?>>Active</option>
												<option value="0" <?= ("0"== $rider->row()->rider_status)?"selected":"" ?>>De-Active</option>

											</select>
										</div>

										

									</div>


									<div class="form-group">
										

										<label class="col-lg-3 control-label">ID Card Number</label>
										<div class="col-lg-3">
											<input type="text" value="<?=$rider->row()->rider_identy_card_no ?>" name="id_number" class="form-control" id="" placeholder="ID Card Number" required>
										</div>

									</div>

									<div class="form-group">
										

										
										<label class="col-lg-3 control-label">Choose ID Card:</label>
										<div class="col-lg-3">
											<input type="file" accept="image" name="id_image" id="image_path" class="form-control image_path">
										</div>

										<div class="col-lg-4">

											<img src="<?=base_url('uploads/'.$rider->row()->rider_identy_card_photo);?>" style="" id="blah" height="100" width="100">
										</div>
									</div>

									<div class="form-group">

										

										<label class="col-lg-3 control-label">Choose Photo:</label>
										<div class="col-lg-3">
											<input type="file" accept="image" name="image" id="image_path" class="form-control image_path">

										</div>

										<div class="col-lg-4">

											<img src="<?=base_url('uploads/'.$rider->row()->rider_photo);?>" style="" id="blah" height="100" width="100">
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

				
			</div>
		</div>
		<!--==========Footer Start=============-->
		<?php $this->load->view('include/footer'); ?>
		<!--==========Footer End=============-->   
	</body>
	</html>

	<script type="text/javascript">

	</script>
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


	<script type="text/javascript">

		var specialKeys = new Array();
	specialKeys.push(8); //Backspace
	function IsNumeric(e) {
		var keyCode = e.which ? e.which : e.keyCode
		var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
		
		return ret;
	}
</script>