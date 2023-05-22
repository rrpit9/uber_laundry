<!DOCTYPE html>
<html lang="en">
<head>
  	<title><?=$page['page']='New Laundry Request';?> | <?=SITE_TITLE;?></title>
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

								<span class="panel-title"><i class="fa fa-list"></i> New Laundry Request</span>
								
							</div>
							<div class="panel-body">

								<table id="table1" class="table table-condensed table-hover table-bordered">
									<thead>
										<tr>
											<th>Sl.</th>										
											<th>Name</th>											
											<th>DOJ</th>
											<th>Mobile</th>
											<th>Address</th>
											<th>Info</th>
											<th>Img</th>
										
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
									  			<td><?=$value['vendor_gps_address'];?></td>
									  			<td><?=$value['loundry_info'];?></td>
									  			<td><img src="<?=base_url('uploads/'.$value['vendor_image']);?>" style="" id="blah" height="50" width="50"></td>
									  			<td>
									  				<div class="btn-group">
									  		
													<a class="btn btn-sm btn-info" href="<?=base_url('auth/approve_laundry/'.$value['id'].'');?>"> approve </a>
													<!-- <a onclick="return condelUser()" class="btn btn-sm btn-danger" href="<?=base_url('auth/deleteData/users/'.$value['id'].'/user-management');?>"> Delete </a> -->
												

												
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