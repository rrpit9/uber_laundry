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
					<?php
			$page['link_page']= [
				"Management"=>base_url()."auth/laundry_management",
				"Dashboard"=>base_url()."auth/laundry_dashboard/".end($this->uri->segments)
			];
			?>
					<?php $this->load->view('include/page-top',$page); ?>
					<!--//===============Main Container Start=============//-->



					<div class="row padding-top">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-heading">

									<span class="panel-title"><i class="fa fa-list"></i> Send to bank request of <?=$laundry->row()->vendor_name ?></span>


									<button class="btn btn-success pull-right r-zero m-b-10 addBtn navbar-right" onclick="return addBtn()"> <i class="fa fa-plus"></i> Add New</button>
								</div>
								<div class="panel-body">
									<?php
								$arrcurrency=get_symbol_by_laundry_id($laundry->row()->id);
									?>

									<table id="table2" class="table table-condensed table-hover table-bordered">
										<thead>
											<tr>
												<th>Sl.</th>
												<th>Laundry Name</th>

												<th>Amount</th>
												<th>Transaction</th>
												<th>Remark</th>
												<th>Date</th>
												<th>Action</th>

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
													<td> <?=$arrcurrency['c_symbol'].$value['amt'];?></td>
													<td> <?=$value['transaction_operation'];?></td>
													<td> <?=$value['remark'];?></td>
													<td> <?=$value['added_date'];?></td>

													<td>
														<div class="btn-group">


															<a href="<?=base_url('auth/delete_wallet/'.$value['id'].'/'.$value['vendor_id'].'');?>" class="btn btn-sm btn-danger">Delete</a>
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


					<div class="row padding-top">
						<div class="col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-heading">

									<span class="panel-title"><i class="fa fa-list"></i> Wallet Transaction of <?=$laundry->row()->vendor_name ?></span>

								</div>
								<div class="panel-body">

									<table id="table1" class="table table-condensed table-hover table-bordered table-responsive">
										<thead>
											<tr>
												<th>Sl.</th>
												<th>Laundry Name</th>

												<th>Amount</th>
												<th>Transaction</th>
												<th>Remark</th>
												<th>Date</th>
												<th>Action</th>

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
													<td> <?=$arrcurrency['c_symbol'].$value1['amt'];?></td>
													<td> <?=$value1['transaction_operation'];?></td>
													<td> <?=$value1['remark'];?></td>
													<td> <?=$value1['added_date'];?></td>

													<td>
														<div class="btn-group">


															<a href="<?=base_url('auth/delete_wallet/'.$value1['id'].'/'.$value1['vendor_id'].'');?>" class="btn btn-sm btn-danger">Delete</a>
														</div>
													</td>
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
								<th>Wallet Balance</th><td><?echo  $arrcurrency['c_symbol'].$laundry->row()->wallet_balance;?></td>
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



	function addBtn(txt,type)
	{

		$('#addModal').modal('show');
	}

</script>


<div class="modal fade" id="addModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body" style="padding: 0px;">
				<div class="panel panel-primary" style="margin-bottom: 0px;">
					<div class="panel-heading">
						<p class="panel-title">Laundry Wallet for <?=$laundry->row()->vendor_name ?>
						<button type="button" class="close pull-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button></p>
					</div>
					<div class="panel-body jumbotron">
						<?=form_open('auth/insertWallet',['class'=>'form-horizontal']); ?>
						<div class="col-lg-12">
							<h3 class="txtcenter" id="txt"></h3>
							<div class="form-group">
								<input type="hidden" name="laundry_id" value="<?=$laundry->row()->id ?>" id="type">
								<label>Amount</label>
								<input type="text" name="amount" class="form-control" onkeypress="return IsDoublefun(event);" required>
							</div>

							<div class="form-group">
								<label>Option</label>
								<select name="type_wallet" class="form-control" required>

									<option value="1">Add</option>
									<option value="0">Remove</option>

								</select>
							</div>

							<div class="form-group">

								<label>	Trancection</label>
								<textarea rows="3" name="trancection" class="form-control" required placeholder="Trancection"></textarea>
							</div>
							<div class="form-group">

								<label>Remark</label>
								<textarea rows="3" name="remark" class="form-control" required placeholder="Remark"></textarea>
							</div>

							<div class="form-group">
								<button class="btn btn-primary r-zero" type="submit">Submit</button>
							</div>
						</form></div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
