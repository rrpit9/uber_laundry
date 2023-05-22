<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Laundry Rider Management';?> | <?=SITE_TITLE;?></title>
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

				<?php $this->load->view('include/page-top',$page); ?>
				<!--//===============Main Container Start=============//-->

				<div class="container-fluid">


					<div class="row padding-top">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-heading">

									<span class="panel-title"><i class="fa fa-list"></i>Add New Rider <?=$laundry->row()->vendor_name ?></span>

								</div>
								<div class="panel-body">
									<?=form_open_multipart('auth/add_new_rider',['class'=>'form-horizontal']); ?>


									
									<div class="form-group">
										
										<input type="hidden" name="laundry_id" value="<?=$laundry->row()->id ?>">
										<label class="col-lg-3 control-label">Rider Name</label>
										<div class="col-lg-3">
											<input type="text" value="" name="rider_name" class="form-control date" id="" placeholder="Rider Name" required>
										</div>

										<label class="col-lg-3 control-label">Password</label>
										<div class="col-lg-3">
											<input type="text" value="" name="rider_password" class="form-control" id="" placeholder="Password" required>
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-3 control-label">Contact Number</label>
										<div class="col-lg-3">
											<input type="text" value="" name="mobile" class="form-control date" id="" onkeypress="return IsNumeric(event);" maxlength="10" placeholder="Contact Number" required>
										</div>

										<label class="col-lg-3 control-label">Email id</label>
										<div class="col-lg-3">
											<input type="text" value="" name="email" class="form-control date" id="" placeholder="Email id" required>
										</div>
									</div>
									
									<div class="form-group">
										<label class="col-lg-3 control-label">Address</label>
										<div class="col-lg-3">
											<textarea rows="4" name="address" class="form-control" required placeholder="Address"></textarea>
										</div>
										

										<label for="select" class="col-lg-3 control-label">Status</label>
										<div class="col-lg-3">
											<select name="status" class="form-control" required>

												<option value="1">Active</option>
												<option value="0">De-Active</option>

											</select>
										</div>

										

									</div>


									<div class="form-group">
										

										<label class="col-lg-3 control-label">ID Card Number</label>
										<div class="col-lg-3">
											<input type="text" value="" name="id_number" class="form-control" id="" placeholder="ID Card Number" required>
										</div>
										<label class="col-lg-3 control-label">Choose ID Card:</label>
										<div class="col-lg-3">
											<input type="file" accept="image" name="id_image" id="image_path" class="form-control image_path">
										</div>
									</div>

									<div class="form-group">

										

										<label class="col-lg-3 control-label">Choose Photo:</label>
										<div class="col-lg-3">
											<input type="file" accept="image" name="image" id="image_path" class="form-control image_path">

										</div>

									</div>

									<div class="form-group">
										<div class="col-lg-9 col-lg-offset-3">
											<button type="reset" class="btn btn-default">Reset</button>
											<button type="submit" class="btn btn-primary">Submit</button>
										</div>
									</div>

								</form>

							</div>
						</div>
					</div>         
				</div>  

				<div class="row padding-top">
					<div class="col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">

								<span class="panel-title"><i class="fa fa-list"></i> Laundry Rider List for <?=$laundry->row()->vendor_name ?></span>
								
							</div>
							<div class="panel-body">

								<table id="table1" class="table table-condensed table-hover table-bordered">
									<thead>
										<tr>
											<th>Sl.</th>										
											<th>Rider</th>											
											<th>Laundry Name</th>											

											<th>Mobile</th>
											<th>Email</th>
											<th>ID Number</th>
											<th>DOJ</th>
											<th>Wallet</th>
											<th>Action</th>

										</tr>
									</thead>
									<tbody>
										<?php if($data) { $i=1;
											foreach ($data->result_array() as $key => $value)
											{
											?>
											<tr class="bg-success">
												<td><?=$i;?></td>

												<td><img src="<?=base_url('uploads/'.$value['rider_photo']);?>" style="" id="blah" height="50" width="50"></td>									  		
												<td> <?=$value['rider_name'];?></td>
												<td> <?=$value['rider_mobile_no'];?></td>
												<td> <?=$value['rider_email_id'];?></td>
												<td> <?=$value['rider_identy_card_no'];?></td>
												<td> <?=$value['rider_added_date_time'];?></td>
												<td> <?=$value['wallet_balance'];?></td>

												<td>
													<div class="btn-group">														
														<a class="btn btn-sm btn-info" href="<?=base_url('user/rider_edit/'.$value['id'].'');?>"> Edit </a>

														<a href="<?=base_url('user/rider_delete/'.$value['id'].'');?>" class="btn btn-sm btn-success">Delete Rider</a>
													</div>
												</td>
											</tr>
											<?php $i++;  } } else { ?>
											<tr><td colspan="7">No Records Found.</td></tr>
											<?php } ?>
										</tbody>
									</table>
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