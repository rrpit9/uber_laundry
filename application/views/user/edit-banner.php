<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Laundry Banner Management';?> | <?=SITE_TITLE;?></title>
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
					"Banner Management"=>base_url()."user/laundry_banner"
				];
				?>
				<?php $this->load->view('include/page-top',$page); ?>
				<!--//===============Main Container Start=============//-->

				<div class="container-fluid">


					<div class="row padding-top">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-heading">

									<span class="panel-title"><i class="fa fa-list"></i>Edit banner for <?=$laundry->row()->vendor_name ?></span>

								</div>
								<div class="panel-body">
									<?=form_open_multipart('user/update_banner',['class'=>'form-horizontal']); ?>

									<div class="form-group">

										<input type="hidden" name="banner_id" value="<?=$banner->row()->id ?>">
										<label class="col-lg-3 control-label">Serial Number</label>
										<div class="col-lg-3">
											<input type="text" value="<?=$banner->row()->sno ?>" name="sr_number"  onkeypress="return IsNumeric(event);" maxlength="3" class="form-control date" id="" placeholder="Serial Number" required>
										</div>


									</div>


									<div class="form-group">
										<label class="col-lg-3 control-label">Choose Banner:</label>
										<div class="col-lg-3">
											<input type="file" accept="image" name="image" id="image_path" class="form-control image_path">
										</div>
										<div class="col-lg-4">

											<img src="<?=base_url('uploads/'.$banner->row()->banner_image);?>" style="" id="blah" height="100" width="100">
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

								<span class="panel-title"><i class="fa fa-list"></i> Laundry banner List for <?=$laundry->row()->vendor_name ?></span>
								
							</div>
							<div class="panel-body">

								<table id="table1" class="table table-condensed table-hover table-bordered">
									<thead>
										<tr>
											<th>Sl.</th>										
											<th>Banner</th>											
											<th>Laundry Name</th>
											<th>Serial Number</th>
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

													<td><img src="<?=base_url('uploads/'.$value['banner_image']);?>" style="" id="blah" height="50" width="50"> </td>									  		
													<td> <?=$value['vendor_name'];?></td>
													<td> <?=$value['sno'];?></td>

													<td>
														<div class="btn-group">														
															<a class="btn btn-sm btn-info" href="<?=base_url('auth/edit_banner/'.$value['id'].'');?>"> Edit </a>

															<a href="<?=base_url('auth/banner_delete/'.$value['id'].'');?>" class="btn btn-sm btn-success">Delete Banner</a>
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