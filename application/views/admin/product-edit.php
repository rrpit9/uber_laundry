<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Edit Product';?> | <?=SITE_TITLE;?></title>
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

									<span class="panel-title"><i class="fa fa-list"></i> Edit Product for <b><?=$laundry->row()->vendor_name ?></b></span>

								</div>
								<div class="panel-body">
									<?=form_open_multipart('auth/update_product',['class'=>'form-horizontal']); ?>
									<input type="hidden" name="product_id" value="<?=$product->row()->id ?>">

									<div class="form-group">
										<label for="select" class="col-lg-3 control-label">Select Category : </label>
										<div class="col-lg-3">
											<select name="category" class="form-control" required>
												<option value="">Select Category</option>
												<?php foreach($category->result_array() as $value): ?>
												

												<option value="<?= $value['id']; ?>" <?= ($value['id']==$product->row()->category_id)?"selected":"" ?> ><?= $value['name']; ?></option>

												<?php endforeach; ?>
											</select>
										</div>

										<label class="col-lg-3 control-label">Product Name : </label>
										<div class="col-lg-3">
											<input type="text" value="<?=$product->row()->item_name ?>" name="product_name" class="form-control "  placeholder="Product Name" required>
										</div>
									</div>

									
									<div class="form-group">
										
										
										<label class="col-lg-3 control-label">Product Price : </label>
										<div class="col-lg-3">
											<input type="text" value="<?=$product->row()->item_price ?>" name="item_price" class="form-control" placeholder="Product Price" onkeypress="return IsDoublefun(event);" required>
										</div>

										<label class="col-lg-3 control-label">Product Tax : </label>
										<div class="col-lg-3">
											<input type="text" value="<?=$product->row()->tax ?>" name="item_tax" class="form-control" id="" placeholder="Product Tax" onkeypress="return IsDoublefun(event);" required>
										</div>
									</div>

									<div class="form-group">
										
										
										<label class="col-lg-3 control-label">Product Offer Price : </label>
										<div class="col-lg-3">
											<input type="text" value="<?=$product->row()->item_offer_price ?>" name="offer_price" class="form-control" placeholder="Product Offer Price" onkeypress="return IsDoublefun(event);" required>
										</div>


										<label for="select" class="col-lg-3 control-label">Select Product Unit :</label>
										<div class="col-lg-3">
											<select name="unit" class="form-control" required>
												<option value="">Select Unit :</option>
												<?php foreach($units->result_array() as $unit): ?>
												

												<option value="<?= $unit['id']; ?>" <?= ($unit['id']==$product->row()->unit_id)?"selected":"" ?> ><?= $unit['unit_name']; ?></option>

												<?php endforeach; ?>
											</select>
										</div>

									</div>

									
									
									<div class="form-group">
										<label class="col-lg-3 control-label">Description :	</label>
										<div class="col-lg-3">
											<textarea rows="3" name="description" class="form-control" required placeholder="Product Description"><?=$product->row()->item_description ?></textarea>
										</div>
										

										<label for="select" class="col-lg-3 control-label">Status : </label>
										<div class="col-lg-3">
											<select name="status" class="form-control" required>

												<option value="1" <?= ('1'==$product->row()->status)?'selected':'' ?>>Active</option>
												<option value="0" <?= ('0'==$product->row()->status)?'selected':'' ?>>De-Active</option>

											</select>
										</div>
									</div>


									

									<div class="form-group">
										<label class="col-lg-3 control-label">Choose Product Photo:</label>
										<div class="col-lg-3">
											<input type="file" accept="image" name="image" id="image_path" class="form-control image_path">
										</div>

										<div class="col-lg-3">

											<img src="<?=base_url('uploads/'.$product->row()->item_image);?>" style="" id="blah" height="50" width="50">
										</div>
									</div>

									<div class="form-group">
										<div class="col-lg-9 col-lg-offset-3">
											
											<button type="submit" class="btn btn-primary">Update</button>
										</div>
									</div>

								</form>

							</div>
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


		</script>