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
			<?php $this->load->view('include/sidebar',$page); ?>
			<!--========== Sidebar End ===============-->
		</div>
		<div class="right-container" id="right-container">
			<div class="container-fluid">

				<?php $this->load->view('include/page-top',$page); ?>
				<!--//===============Main Container Start=============//-->
				<div class="row padding-top">

					<div class="col-md-10">
						<!-- <h2>Order Invoice  </h2> -->
						<div class="invoice thumbnail" id="container"> 
							<a class="btn btn-link address-number hidden-print" onclick="printDiv('container');"><!--Print--> <i class="fa fa-print"></i></a> <b> </b>
							<div class="invoice-logo-space text-center"> 
								<!-- <img src="" width="165">  -->
							</div>
							<p class="text-center"><strong>Reg. Office : </strong>
							</br>
							<?= SITE_TITLE?></p>
							<h4 class="text-center pb-30" style="
							padding: 0;
							border-top: 1px dotted #333;
							line-height: 0;
							margin: 0;
							margin-top: 2em;
							">

							<strong style="
							background: #fff;
							padding: 0 10px;
							">Invoice</strong> </h4>


							<br> 
							<div class="row invoice-logo">
								<div class="col-xs-5">
									<address>
										<h5 class="text-danger"><strong>Shipping Address</strong></h5>
										<abbr>Name : </abbr> <strong><?= $booking->row()->user_name ?></strong><br>
										<abbr>Mobile : </abbr> <strong><?= $booking->row()->user_mobile_no ?></strong><br>
										<abbr>Email : </abbr> <strong><?= $booking->row()->user_email_id ?></strong><br>
										<abbr>Address : </abbr>
										<strong> <?= $booking->row()->delivery_address ?>								
										<br>Colony / Locality<br>Landmark
									</strong>
								</address>
							</div>
							<div class="col-xs-5 col-md-offset-2">
								<address>
									<abbr>Invoice No : </abbr> 

									<strong>
										<span class="text-danger"><?= $booking->row()->invoice_number ?>(<?= $booking->row()->book_status ?>)</span>
									</strong>
									<br>
									<abbr>Order Date : </abbr> <strong><?= $booking->row()->invoice_date ?></strong><br>
									<abbr>Delivery Date : </abbr> <strong><?= $booking->row()->drop_time ?></strong>
								</address>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="table  table-responsive ">


									<table class="table table-striped col-md-12 table table-bordered table-advance">
										<thead>
											<tr  class="info">
												<th>Sl.</th>										
												<th>Item Name</th>											
												<th>Item Desc</th>
												<th>Price</th>
												<th>Tax</th>
												<th>Offer Price</th>
												<th>Qty</th>
												<th>Total </th>
											</tr>
										</thead>
										<tbody>
											<?php if($booking_item) { $i=1;
												foreach ($booking_item->result_array() as $key => $value)
												{
													?>
													<tr >
														<td><?=$i;?></td>

														<td><?=$value['item_name'];?></td>

														<td> <?=$value['item_description'];?></td>
														<td><?=$value['price'];?></td>
														<td><?=$value['tax_amt'];?></td>
														<td><?=$value['offer_price'];?></td>
														<td><?=$value['qty'];?></td>
														<td><?= $booking->row()->currency_symbol ?> <?=$value['total_amount'];?></td>

													</tr>
													<?php $i++;  } } else { ?>
														<tr><td colspan="7">No Records Found.</td></tr>
													<?php } ?>
												</tbody>
											</table>

											<table class="table table-striped col-md-12 table table-bordered table-advance">

												<tbody>
													<tr>
														<td colspan="2"></td>
														<td>Total </td>
														<th><?= $booking->row()->currency_symbol ?> <?= $booking->row()->total_item_price ?></th>
													</tr>


													<tr>
														<td colspan="2"></td>
														<td>Tax Amount</td>
														<th><?= $booking->row()->currency_symbol ?> <?= $booking->row()->tax_amt ?></th>
													</tr>

													<tr >
														<td colspan="2"></td>
														<td class="success">Total Amount</td>
														<th class="success"><?= $booking->row()->currency_symbol ?> <?= $booking->row()->total_amt ?></th>
													</tr>
													<tr>
														<td colspan="2">Transaction Id - 
															<strong> <?= $booking->row()->online_transaction_id ?> </strong></td>
															<td>Pay By Online</td>
															<th><?= $booking->row()->currency_symbol ?> <?= $booking->row()->paid_by_online ?></th>
														</tr>

														<tr>
															<td colspan="2"></td>
															<td>Pay By Case</td>
															<th><?= $booking->row()->currency_symbol ?> <?= $booking->row()->paid_by_cash ?></th>
														</tr>
														<tr>
															<td colspan="2">Laundry - <strong><?= $booking->row()->vendor_name ?></strong></td>
															<td>Pay By Wallet</td>
															<th><?= $booking->row()->currency_symbol ?> <?= $booking->row()->paid_by_wallet ?></th>
														</tr>
														<tr>
															<td colspan="2">Laundry Mobile - <strong><?= $booking->row()->vendor_mobile_no ?></strong></td>
															<td>Coupan Discount</td>
															<th><?= $booking->row()->currency_symbol ?> <?= $booking->row()->paid_by_promo ?></th>
														</tr>

														<tr>
															<td colspan="4">
																Laundry Address - <strong><?= $booking->row()->vendor_address ?></strong></td>	
															</tr>
														</tbody>
													</table>
													
													<table class="table table-striped col-md-12 table table-bordered table-advance">

														<tbody>

															<tr>
																<td colspan="2">Pickup By - 
																	<strong> <?= $booking->row()->pickup_boy_name ?>  (<?= $booking->row()->pickup_boy_number ?>) </strong></td>
																	<td colspan="2">Drop By - 
																		<strong> <?= $booking->row()->drop_boy_name ?>  (<?= $booking->row()->drop_boy_number ?>)</strong></td>
																	</tr>


																</tbody>
															</table>

														</div>
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

							function printDiv(divName) 
							{
								var printContents = document.getElementById(divName).innerHTML;
								var originalContents = document.body.innerHTML;

								document.body.innerHTML = printContents;

								window.print();

								document.body.innerHTML = originalContents;
							}
						</script>