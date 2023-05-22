<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Laundry Management';?> | <?=SITE_TITLE;?></title>
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
			//	"Page"=>"page_link"
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

								<span class="panel-title"><i class="fa fa-list"></i> Laundry List</span>
								<a class="btn btn-sm btn-danger navbar-right" href="<?=base_url('auth/add_laundry');?>"> <b>Add Laundry</b> </a>
							</div>
							<div class="panel-body">

								<table id="table1" class="table table-condensed table-hover table-bordered">
									<thead>
										<tr>
											<th>Sl.</th>										
											<th>Name</th>											
											<th>DOJ</th>
											<th>Mobile</th>
											<th>Status</th>
										</tr>
									</thead>
									<tbody>
										<?php if($data) { $i=1;
											foreach ($data->result_array() as $key => $value)
											{
												?>
												<tr class="<?=($value['vendor_status']==1)?"bg-success":"bg-danger";?>">
													<td><?=$i;?></td>

													<td><?=$value['vendor_name'];?></td>

													<td> <?=$value['vendor_registration_date'];?></td>
													<td><?=$value['contact_number'];?></td>
													<td>
														<div class="btn-group">

															<a class="btn btn-sm btn-info" href="<?=base_url('auth/edit_laundry/'.$value['id'].'');?>"> Edit </a>
															<!-- <a onclick="return condelUser()" class="btn btn-sm btn-danger" href="<?=base_url('auth/deleteData/users/'.$value['id'].'/user-management');?>"> Delete </a> -->
															<?php if($value['vendor_status']==1)
															{ ?>
																<a href="<?=base_url('auth/laundry_status/'.$value['id'].'/0');?>" onclick="return unblock()" class="btn btn-sm btn-warning">De-Activate</a> <?php
															}else
															{ ?>
																<a href="<?=base_url('auth/laundry_status/'.$value['id'].'/1');?>" onclick="return block()" class="btn btn-sm btn-primary">Activate</a>
															<?php } ?>

															<a href="<?=base_url('auth/laundry_dashboard/'.$value['id'].'');?>" class="btn btn-sm btn-success">Laundry Dashboard</a>

													<!-- <a href="<?=base_url('auth/laundry_banner/'.$value['id'].'');?>" class="btn btn-sm btn-success">Add Banner</a>
													<a href="<?=base_url('auth/laundry_rider/'.$value['id'].'');?>" class="btn btn-sm btn-primary">Rider</a>
													<a href="<?=base_url('auth/laundry_date/'.$value['id'].'');?>" class="btn btn-sm btn-info">Laundry Date</a> -->
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