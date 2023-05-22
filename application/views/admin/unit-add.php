<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Add Unit';?> | <?=SITE_TITLE;?></title>
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
					"Unit Management"=>base_url()."auth/unit_management",
				//"Dashboard"=>base_url()."auth/laundry_dashboard/".end($this->uri->segments)
				];
				?>
				<?php $this->load->view('include/page-top',$page); ?>
				<!--//===============Main Container Start=============//-->
				<div class="row padding-top">
					<div class="col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">

								<span class="panel-title"><i class="fa fa-list"></i>Add New Unit</span>
								
							</div>
							<div class="panel-body">
								<?=form_open_multipart('auth/add_new_unit',['class'=>'form-horizontal']); ?>

								<div class="form-group">
									

									<label class="col-lg-3 control-label">Unit Name</label>
									<div class="col-lg-3">
										<input type="text" value="" name="unit_name" class="form-control date" id="" placeholder="Unit Name" required>
									</div>


									<!-- <label for="select" class="col-lg-3 control-label">Status</label>
									<div class="col-lg-3">
										<select name="status" class="form-control" required>

											<option value="1">Active</option>
											<option value="0">De-Active</option>
										</select>
									</div> -->
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
