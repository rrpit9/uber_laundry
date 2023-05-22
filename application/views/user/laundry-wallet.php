<!DOCTYPE html>
<html lang="en">
	<head>
		<title><?=$page['page']='Laundry Wallet Management';?> | <?=SITE_TITLE;?></title>
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
					
					
					
					<div class="row padding-top">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-heading">
									
									<span class="panel-title"><i class="fa fa-list"></i> Laundry Income Transection for <?=$laundry->row()->vendor_name ?></span>
									
									
									
								</div>
								<div class="panel-body">
									
									<table id="table2" class="table table-condensed table-hover table-bordered">
										<thead>
											<tr>
												<th>Sl.</th>										
												<th>Laundry Name</th>											
												
												<th>Amount</th>
												<th>Trancection</th>
												<th>Remark</th>
												<th>Date</th>
												
												
											</tr>
										</thead>
										<tbody>
											<?php if($income) { $i=1;
												foreach ($income->result_array() as $key => $value)
												{
												?>
												<tr class="bg-success">
													<td><?=$i;?></td>
													
													
													<td> <?=$value['vendor_name'];?></td>
													<td> <?=$value['amt'];?></td>
													<td> <?=$value['transaction_operation'];?></td>
													<td> <?=$value['remark'];?></td>
													<td> <?=$value['added_date'];?></td>
													
													
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
					
					
					<div class="row padding-top">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-heading">
									
									<span class="panel-title"><i class="fa fa-list"></i> Laundry Outcome Transection for <?=$laundry->row()->vendor_name ?></span>
									
								</div>
								<div class="panel-body">
									
									<table id="table1" class="table table-condensed table-hover table-bordered table-responsive">
										<thead>
											<tr>
												<th>Sl.</th>										
												<th>Laundry Name</th>											
												
												<th>Amount</th>
												<th>Trancection</th>
												<th>Remark</th>
												<th>Date</th>
												
												
											</tr>
										</thead>
										<tbody>
											<?php if($out) { $i1=1;
												foreach ($out->result_array() as $key => $value1)
												{
												?>
												<tr class="bg-danger">
													<td><?=$i1;?></td>
													
													
													<td> <?=$value1['vendor_name'];?></td>
													<td> <?=$value1['amt'];?></td>
													<td> <?=$value1['transaction_operation'];?></td>
													<td> <?=$value1['remark'];?></td>
													<td> <?=$value1['added_date'];?></td>
													
													
												</tr>
											<?php $i1++;  } } else { ?>
											<tr><td colspan="7">No Records Found.</td></tr>
											<?php } ?>
										</tbody>
									</table>
								</div>
							</div>
						</div>         
					</div>
					<!--//===============Main Container End=============//-->
					
					<div class="col-lg-8 col-lg-offset-2 jumbotron">
						<table class="table table-bordered table-striped table-hover">
							<tr>
								<th>In Money</th><td><?=$in_amt->row()->in_amt;?></td>
							</tr>
							<tr>
								<th>Out Money</th><td><?=$out_amt->row()->out_amt;?></td>
							</tr>
							
							<tr>
								<th>Wallet Money</th><td><?=$wallet_amt = $in_amt->row()->in_amt - $out_amt->row()->out_amt;?></td>
							</tr>
						</table>
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


