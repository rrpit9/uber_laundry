<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Booking Management';?> | <?=SITE_TITLE;?></title>
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
				<div class="row padding-top">

					

					<div class="col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">

								<span class="panel-title"><i class="fa fa-list"></i> <?= $page['page'] ?></span>

							</div>
							<div class="panel-body">

								<table id="table1" class="table table-condensed table-hover table-bordered">
									<thead>
										<tr>
											<th>Sl.</th>										
											<th>Customer Name</th>											
											<th>Booking Time</th>										
											<th>Pickup Address</th>
											<th>Laundry Name / Mobile</th>
											<th>Laundry Address</th>
											<th>Total </th>
											<th>Pickup Boy</th>
											<th>Drop Boy</th>
											
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<?php if($booking) { $i=1;
											foreach ($booking->result_array() as $key => $value)
											{
											?>
											<tr class="<?=($value['booking_status']==9)?"bg-danger":"bg-success";?>">
												<td><?=$i;?></td>

												<td><?=$value['user_name'];?> (<?=$value['user_mobile_no'];?>)</td>

												<td> <?=$value['placed_time'];?></td>
												
												<td><?=$value['delivery_address'];?></td>
												<td><?=$value['vendor_name'];?> / <?=$value['vendor_mobile_no'];?></td>
												<td><?=$value['vendor_address'];?></td>
												<td><?=$value['currency_symbol'];?>  <?=$value['total_amt'];?></td>
												<td><?=$value['pickup_boy_name'];?>  <?=$value['pickup_boy_number'];?></td>
												<td><?=$value['drop_boy_name'];?>  <?=$value['drop_boy_number'];?></td>
												<td><?=$value['book_status'];?></td>
												<td>
													<div class="btn-group">

														<a class="btn btn-sm btn-info" href="<?=base_url('Auth/booking_details/'.$value['id'].'');?>" target="_blank"> Details </a>													

														<button type="button" onclick="order_action('<?= $value['id']?>')" class="btn btn-sm btn-success" data-target="#stack1" data-toggle="modal"> Status </button>

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
	




	<div id="stack1" class="modal fade" tabindex="-1" data-width="200">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
					<h4 class="modal-title">Change Status</h4>
				</div>
				<div class="modal-body">

					<div id="allView">					
					</div>


					<input  type="hidden" id="id" />
				</div>
			</div>
		</div>
	</div>

