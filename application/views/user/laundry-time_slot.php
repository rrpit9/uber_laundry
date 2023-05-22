<!DOCTYPE html>
<html lang="en">
	<head>
		<title><?=$page['page']='Add Laundry Time Slot';?> | <?=SITE_TITLE;?></title>
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
				<?php $this->load->view('include/sidebar',$page); ?>
				<!--========== Sidebar End ===============-->
			</div>
			<div class="right-container" id="right-container">
				<div class="container-fluid">
					<?php 
						$page['link_page']= [
						"Day List"=>base_url()."user/laundry_date",
						//"Dashboard"=>base_url()."user/add_time_slot/".end($this->uri->segments)
						];
					?>
					<?php $this->load->view('include/page-top',$page); ?>
					<!--//===============Main Container Start=============//-->
					
					<div class="container-fluid">
						
						
						<div class="row padding-top">
							<div class="col-lg-12">
								<div class="panel panel-primary">
									<div class="panel-heading">
										
										<span class="panel-title"><i class="fa fa-list"></i>Add Time Slot </span>
										
									</div>
									<div class="panel-body">
										<?=form_open_multipart('user/insert_time_slot',['class'=>'form-horizontal']); ?>
										
										<input type="hidden" name="day_id" value="<?= $date_time->id?>">	
										<input type="hidden" name="vendor_id" value="<?= $date_time->vendor_id?>">	
										
										<div class="form-group">
											<label class="col-lg-3 control-label">Start Time Slot:</label>
											<div class="col-lg-3">
												<input type = 'text' class="form-control" id="time_slot" name="time_slot" required />  
												
											</div>
											
											<label class="col-lg-3 control-label">End Time Slot:</label>
											<div class="col-lg-3">
												<input type = 'text' class="form-control" id="end_time_slot" name="end_time_slot" required />  
												
											</div>
											
											
										</div>
										
										
										<div class="form-group">
											<div class="col-lg-9 col-lg-offset-3">
												
												<button type="submit" class="btn btn-primary">Add Time Slot</button>
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
									
									<span class="panel-title"><i class="fa fa-list"></i> Laundry Banner List for <?= $laundry->vendor_name ?></span>
									
								</div>
								<div class="panel-body">
									
									<table id="table1" class="table table-condensed table-hover table-bordered">
										<thead>
											<tr>
												<th>Sl.</th>										
												
												<th>Day</th>											
												<th>Time Slot</th>											
												<th>Show Time Slot</th>											
												
												<th>Day No</th>
												<th>Action</th>
												
											</tr>
										</thead>
										<tbody>
											<?php if($time_slot) { $i=1;
												foreach ($time_slot->result_array() as $key => $value)
												{
												?>
												<tr class="bg-success">
													<td><?=$i;?></td>
													
													
													<td> <?=$value['day_name'];?></td>
													<td> <?=$value['org_slot_time'];?> - <?=$value['org_time_slot_to'];?></td>
													<td> <?=$value['display_slot_time'];?> - <?=$value['display_time_slot_to'];?></td>
													<td> <?=$value['day_sno'];?></td>
													<td>
														<div class="btn-group">														
															
															
															<a class="btn btn-sm btn-danger" href="<?=base_url('user/delete_time_slot/'.$value['id'].'');?>"> Delete Time Slot </a>
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
		$('#time_slot').datetimepicker({  
			format: 'HH:mm'  
		});  
	});
	
	
	$(function () {  
		$('#end_time_slot').datetimepicker({  
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