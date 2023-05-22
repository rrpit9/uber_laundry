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
					"Day List"=>base_url()."user/laundry_date"
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

					
						<div class="row padding-top">
							<div class="col-lg-12">
								<div class="panel panel-primary">
									<div class="panel-heading">

										<span class="panel-title"><i class="fa fa-list"></i></span>

									</div>
									<div class="panel-body">
										<?=form_open_multipart('user/update_laundry_date',['class'=>'form-horizontal']); ?>

										<input type="hidden" name="date_id" value="<?= $date_time->id ?>">
										<div class="form-group">
											<label class="col-lg-3 control-label">Day:</label>
											<div class="col-lg-3">
												<input type = 'text' class="form-control" value="<?= $date_time->day_name ?>" readonly />  
													  
											</div>

											

										</div>

										<div class="form-group">
											<label class="col-lg-3 control-label">Laundry Open Time:</label>
											<div class="col-lg-3">
												<input type = 'text' value="<?= $date_time->open_time ?>" class="form-control" id="opentime" name="opentime" onkeypress="return readOnly1(event);" required />  
													  
											</div>

											<label class="col-lg-3 control-label">Loundry Close Time:</label>
											<div class="col-lg-3">
												<input type = 'text' value="<?= $date_time->close_time ?>" class="form-control" id="closetime" name="closetime" onkeypress="return readOnly1(event);" required />  
													 
											</div>

										</div>
										

										<div class="form-group">
											<div class="col-lg-9 col-lg-offset-3">
												
												<button type="submit" class="btn btn-primary">Update Time</button>
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