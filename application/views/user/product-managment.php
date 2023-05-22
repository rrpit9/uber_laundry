<!DOCTYPE html>
<html lang="en">
	<head>
		<title><?=$page['page']='Product Management';?> | <?=SITE_TITLE;?></title>
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
					
					<div class="container-fluid">
						
						
						<div class="row padding-top">
							<div class="col-lg-12">
								<div class="panel panel-primary">
									<div class="panel-heading">
										
										<span class="panel-title"><i class="fa fa-list"></i> Add New Product for <b><?=$laundry->row()->vendor_name ?></b></span>
										
									</div>
									<div class="panel-body">
										<?=form_open_multipart('user/add_new_product',['class'=>'form-horizontal']); ?>
										<input type="hidden" name="laundry_id" value="<?=$laundry->row()->id ?>">
										
										<div class="form-group">
											<label for="select" class="col-lg-3 control-label">Select Category : </label>
											<div class="col-lg-3">
												<select name="category" class="form-control" required>
													<option value="">Select Category</option>
													<?php foreach($category->result_array() as $value): ?>
													<option value="<?= $value['id']; ?>"><?= $value['name']; ?></option>
													<?php endforeach; ?>
												</select>
											</div>
											
											<label class="col-lg-3 control-label">Product Name : </label>
											<div class="col-lg-3">
												<input type="text" value="" name="product_name" class="form-control " id="" placeholder="Product Name" required>
											</div>
										</div>
										
										
										<div class="form-group">
											
											
											<label class="col-lg-3 control-label">Product Price : </label>
											<div class="col-lg-3">
												<input type="text" value="0.00" name="item_price" class="form-control" placeholder="Product Price" onkeypress="return IsDoublefun(event);" required>
											</div>
											
											<label class="col-lg-3 control-label">Product Tax : </label>
											<div class="col-lg-3">
												<input type="text" value="0.00" name="item_tax" class="form-control" id="" placeholder="Product Tax" onkeypress="return IsDoublefun(event);" required>
											</div>
										</div>
										
										<div class="form-group">
											
											
											<label class="col-lg-3 control-label">Product Offer Price : </label>
											<div class="col-lg-3">
												<input type="text" value="0.00" name="offer_price" class="form-control" placeholder="Product Offer Price" onkeypress="return IsDoublefun(event);" required>
											</div>
											
											
											<label for="select" class="col-lg-3 control-label">Select Product Unit :</label>
											<div class="col-lg-3">
												<select name="unit" class="form-control" required>
													<option value="">Select Unit :</option>
													<?php foreach($units->result_array() as $unit): ?>
													<option value="<?= $unit['id']; ?>"><?= $unit['unit_name']; ?></option>
													<?php endforeach; ?>
												</select>
											</div>
											
										</div>
										
										
										
										<div class="form-group">
											<label class="col-lg-3 control-label">Description :	</label>
											<div class="col-lg-3">
												<textarea rows="3" name="description" class="form-control" required placeholder="Product Description"></textarea>
											</div>
											
											
											<label for="select" class="col-lg-3 control-label">Status : </label>
											<div class="col-lg-3">
												<select name="status" class="form-control" required>
													
													<option value="1">Active</option>
													<option value="0">De-Active</option>
													
												</select>
											</div>
										</div>
										
										
										
										
										<div class="form-group">
											<label class="col-lg-3 control-label">Choose Product Photo:</label>
											<div class="col-lg-3">
												<input type="file" accept="image" name="image" id="image_path" class="form-control image_path">
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
									
									<span class="panel-title"><i class="fa fa-list"></i> Laundry Product List for <?=$laundry->row()->vendor_name ?></span>
									
								</div>
								<div class="panel-body">
									
									<table id="table1" class="table table-condensed table-hover table-bordered">
										<thead>
											<tr>
												<th>Sl.</th>										
												<th>Img</th>											
												<th>Name</th>											
												<th>Unit</th>											
												
												<th>Category</th>
												<th>Price</th>
												<th>Tex</th>
												<th>Offer Price</th>
												<th>Description</th>
												<th>Add Date</th>
												<th>Action</th>
												
											</tr>
										</thead>
										<tbody>
											<?php if($products) { $i=1;
												foreach ($products->result_array() as $key => $value)
												{
												?>
												<tr class="<?=($value['status']==1)?"bg-success":"bg-danger";?>">
													<td><?=$i;?></td>
													
													<td><img src="<?=base_url('uploads/'.$value['item_image']);?>" style="" id="blah" height="50" width="50"></td>									  		
													<td> <?=$value['item_name'];?></td>
													<td> <?=$value['unitname'];?></td>
													
													<td> <?=$value['category_name'];?></td>
													<td> <?=$value['item_price'];?>/- <?=$value['currency_symbol'];?></td>
													<td> <?=$value['tax'];?></td>
													<td> <?=$value['item_offer_price'];?></td>
													<td> <?=$value['item_description'];?></td>
													<td> <?=$value['added_date_time'];?></td>
													
													<td>
														<div class="btn-group">														
															<a class="btn btn-sm btn-info" href="<?=base_url('user/product_edit/'.$value['id'].'');?>"> Edit </a>													
															
															<?php if($value['status']==1)
																{ ?>
																<a href="<?=base_url('user/product_status/'.$value['id'].'/0');?>" class="btn btn-sm btn-warning">De-Activate</a> <?php
																}else
																{ ?>
																<a href="<?=base_url('user/product_status/'.$value['id'].'/1');?>" class="btn btn-sm btn-primary">Activate</a>
															<?php } ?>
															<a class="btn btn-sm btn-danger" href="<?=base_url('user/delete_product/'.$value['id'].'');?>"> Delete </a>
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


</script>