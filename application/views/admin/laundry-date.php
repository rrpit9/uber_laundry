<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Laundry Date Management';?> | <?=SITE_TITLE;?></title>
	<?php $this->load->view('include/header'); ?>

	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>  
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.1/moment.min.js"></script>  
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/js/bootstrap-datetimepicker.min.js"></script>  

	<link rel = "stylesheet" href = "https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.7.14/css/bootstrap-datetimepicker.min.css">  
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
				"Management"=>base_url()."auth/laundry_management",
				"Dashboard"=>base_url()."auth/laundry_dashboard/".end($this->uri->segments)
			];
			?>
			<?php $this->load->view('include/sidebar',$page); ?>
			<!--========== Sidebar End ===============-->
		</div>
		<div class="right-container" id="right-container">
			<div class="container-fluid">

				<?php $this->load->view('include/page-top',$page); ?>
				<!--//===============Main Container Start=============//-->

				<div class="container-fluid">

					<?php 
					if ($laundry_date->num_rows()>0) {
						

						?>
						<div class="row padding-top">
							<div class="col-lg-12">
								<div class="panel panel-primary">
									<div class="panel-heading">

										<span class="panel-title"><i class="fa fa-list"></i>Add New Date <?=$laundry->row()->vendor_name ?></span>

									</div>
									<div class="panel-body">
										<?=form_open_multipart('auth/add_laundry_date',['class'=>'form-horizontal']); ?>

										<input type="hidden" name="laundry_id" value="<?= $laundry->row()->id ?>">
										<div class="form-group">
											<label for="select" class="col-lg-3 control-label">Select Date: </label>
											<div class="col-lg-3">
												<select name="date_id" class="form-control" required>
													<option value="">Please Select Date</option>
													<?php foreach($laundry_date->result_array() as $value): ?>
														<option value="<?= $value['id']; ?>"><?= $value['day_name']; ?></option>
													<?php endforeach; ?>
												</select>
											</div>
										</div>

										<div class="form-group">
											<label class="col-lg-3 control-label">Laundry Open Time:</label>
											<div class="col-lg-3">
												<input type = 'text' class="form-control" id="opentime" name="opentime" required />  

											</div>

											<label class="col-lg-3 control-label">Loundry Close Time:</label>
											<div class="col-lg-3">
												<input type = 'text' class="form-control" id="closetime" name="closetime" onkeypress="return readOnly1(event);" required />  

											</div>

										</div>
										

										<div class="form-group">
											<div class="col-lg-9 col-lg-offset-3">
												
												<button type="submit" class="btn btn-primary">Add Date</button>
											</div>
										</div>

									</form>

								</div>
							</div>
						</div>         
					</div>  

					<?php 
					
				}
				?>

				<div class="row padding-top">
					<div class="col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">

								<span class="panel-title"><i class="fa fa-list"></i> Laundry Banner List for <?=$laundry->row()->vendor_name ?></span>
								
							</div>
							<div class="panel-body">

								<table id="table1" class="table table-condensed table-hover table-bordered">
									<thead>
										<tr>
											<th>Sl.</th>										

											<th>Day</th>											
											<th>Open Time</th>											
											<th>Close Time</th>											

											<th>Day No</th>
											<th>Action</th>

										</tr>
									</thead>
									<tbody>
										<?php if($data) { $i=1;
											foreach ($data->result_array() as $key => $value)
											{
												?>
												<tr class="<?=($value['status']==1)?"bg-success":"bg-danger";?>">
													<td><?=$i;?></td>


													<td> <?=$value['day'];?></td>
													<td> <?=$value['open_time'];?> -(<?=date("g:i A", strtotime($value['open_time']))?> )</td>
													<td> <?=$value['close_time'];?> -(<?=date("g:i A", strtotime($value['close_time']))?> )</td>
													<td> <?=$value['day_no'];?></td>
													<td>
														<div class="btn-group">														
															<a class="btn btn-sm btn-info" href="<?=base_url('auth/edit_date/'.$value['id'].'');?>"> Edit </a>

															<?php if($value['status']==1)
															{ ?>
																<a href="<?=base_url('auth/date_status/'.$value['id'].'/0');?>"  class="btn btn-sm btn-warning">De-Activate</a> <?php
															}else
															{ ?>
																<a href="<?=base_url('auth/date_status/'.$value['id'].'/1');?>" class="btn btn-sm btn-primary">Activate</a>
															<?php } ?>

															<a class="btn btn-sm btn-success" href="<?=base_url('auth/add_time_slot/'.$value['id'].'');?>"> Add Time Slot </a>
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


		<script type = "text/javascript">  
			$(function () {  
				$('#opentime').datetimepicker({  
					format: 'HH:mm'  
				});  
			});

			$(function () {  
				$('#closetime').datetimepicker({  
					format: 'HH:mm'  
				});  
			});  


			var specialKeys = new Array();
			specialKeys.push(8); //Backspace
			function readOnly1(e) {
				var keyCode = e.which ? e.which : e.keyCode
				var ret = ((keyCode > 4 && keyCode <4) || specialKeys.indexOf(keyCode) != -1);
				
				return ret;
			}
		</script>