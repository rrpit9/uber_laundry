<!DOCTYPE html>
<html lang="en">
<head>
	<title><?=$page['page']='Edit Category';?> | <?=SITE_TITLE;?></title>
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
				"Category Management"=>base_url()."auth/category_management",
				//"Dashboard"=>base_url()."auth/laundry_dashboard/".end($this->uri->segments)
			];
			?>
				<?php $this->load->view('include/page-top',$page); ?>
				<!--//===============Main Container Start=============//-->
				<div class="row padding-top">
					<div class="col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">

								<span class="panel-title"><i class="fa fa-list"></i>Edit Banner</span>

							</div>
							<div class="panel-body">
								<?=form_open_multipart("auth/update_category/".$data['id'],['class'=>'form-horizontal']); ?>

								<div class="form-group">


									<label class="col-lg-3 control-label">Banner S.No.</label>
									<div class="col-lg-3">
										<input type="text" value="<?= $data['name']?>" name="category_name" class="form-control date" id="" placeholder="Category Name" required>
									</div>


									<label for="select" class="col-lg-3 control-label">Status</label>
									<div class="col-lg-3">
										<select name="status" class="form-control" required>

											<option value="1" <?= ("1"==$data['status'])?"selected":"" ?>>Active</option>
											<option value="0" <?= ("0"==$data['status'])?"selected":"" ?>>De-Active</option>
										</select>
									</div>
								</div>


								<div class="form-group">
									<label class="col-lg-3 control-label">Choose Photo:</label>
									<div class="col-lg-3">
										<input type="file" accept="image" name="image" id="image_path" class="form-control image_path">
									</div>
									<div class="col-lg-4">

										<img src="<?=base_url('uploads/'.$data['icon']);?>" style="" id="blah" height="100" width="100">
									</div>
								</div>

								<div class="form-group">
									<div class="col-lg-9 col-lg-offset-3">

										<button type="submit" class="btn btn-primary">Submit</button>
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
