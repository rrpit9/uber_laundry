<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	ob_start();
	class ApiRider extends CI_Controller {

		function __construct(){
			parent::__construct();
			date_default_timezone_set('Asia/Kolkata');
		}


		public function rider_login()
		{
			$email_id =post('email_id');
			$user_pwd =post('password');
			$device_token =post('device_token');
			$device_type =post('device_type');

			is_blank($email_id,"Email Id");
			is_blank($user_pwd,"Password");
			//is_blank($device_token,"Device Token");

			$query = $this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`rider_email_id`='$email_id' AND `rider_listing`.`rider_password`='$user_pwd' or `rider_listing`.`rider_mobile_no`='$email_id' AND `rider_listing`.`rider_password`='$user_pwd'");


			if ($query->num_rows() > 0)
			{
				$row = $query->row();
				if($row->rider_status!="2")
				{
					$fields['device_token'] = $device_token;
					$this->db->where(['id'=>$row->id])->update('rider_listing', $fields);



					$res['rider_id'] = $row->id;
					$res['rider_name'] = $row->rider_name;
					$res['mobile'] = $row->rider_mobile_no;
					$res['email'] = $row->rider_email_id;
					$res['password'] = $row->rider_password;
					$res['confirm_password'] = $row->rider_confirm_password;
					$res['address'] = $row->rider_permanant_address;
					$res['id_card_no'] = $row->rider_identy_card_no;
					$res['id_card_img'] = base_url()."uploads/".$row->rider_identy_card_photo;
					$res['profile_img'] = base_url()."uploads/".$row->rider_photo;
					$res['vender_id'] = $row->vendor_id;
					$res['status'] = $row->rider_status;
					$res['join_date'] = $row->rider_added_date_time;
					$res['wallet_amt'] = $row->wallet_balance;
					$result['data'] = $res;
					$result['msg'] = "Successfully Login .";
					success_response($result);

				}
				else {
					$res = "Your account is deleted please contact to your laundry.";
					fail_response($res);
				}
			}
			else
			{
				$res = "Email Id or Password not found.";
				fail_response($res);
			}
		}
		public function update_rider()
		{
			$rider_id =post('rider_id');
			is_blank($rider_id,"Rider id");
			is_rider_not($rider_id);
			$rider_name =post('rider_name');
			$password =post('password');
			$permanant_address =post('permanant_address');
			$id_card_no =post('id_card_no');

			is_blank($rider_name,"Rider Name");
			is_blank($password,"Password");
			is_blank($permanant_address,"Address");
			is_blank($id_card_no,"Card No");

			$fields['rider_name'] = $rider_name;
			$fields['rider_password'] = $password;
			$fields['rider_confirm_password'] = $password;
			$fields['rider_permanant_address'] = $permanant_address;
			$fields['rider_identy_card_no'] = $id_card_no;
			if(isset($_FILES['id_card_image']) && is_uploaded_file($_FILES['id_card_image']['tmp_name']))
			{
				$fields['rider_identy_card_photo'] = saveImageFile('id_card_image','uploads/');
			}
			if(isset($_FILES['rider_image']) && is_uploaded_file($_FILES['rider_image']['tmp_name']))
			{
				$fields['rider_photo'] = saveImageFile('rider_image','uploads/');
			}

			$this->db->where(['id'=>$rider_id])->update('rider_listing', $fields);

			$rowinfo =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$rider_id' ")->row_array();
			$response2['rider_id'] 	= $rowinfo['id'];
			$response2['rider_name'] 	= $rowinfo['rider_name'];
			$response2['rider_mobile_no'] 	= $rowinfo['rider_mobile_no'];
			$response2['rider_email_id'] 	= $rowinfo['rider_email_id'];
			$response2['rider_password'] 	= $rowinfo['rider_password'];
			$response2['rider_permanant_address'] 	= $rowinfo['rider_permanant_address'];
			$response2['rider_identy_card_no'] 	= $rowinfo['rider_identy_card_no'];
			$response2['rider_identy_card_photo'] 	= base_url()."uploads/".$rowinfo['rider_identy_card_photo'];
			$response2['rider_photo'] 	= base_url()."uploads/".$rowinfo['rider_photo'];
			$response2['vendor_id'] 	= $rowinfo['vendor_id'];
			$response2['status'] 	= $rowinfo['rider_status'];
			$response2['added_date_time'] 	= $rowinfo['rider_added_date_time'];
			$response2['wallet'] 	= $rowinfo['wallet_balance'];
			$response2['msg'] = "Rider Data Successfully.";
			success_response($response2);
		}

		public function rider_profile()
		{
			$rider_id =post('rider_id');
			$device_token =post('device_token');
			$device_type =post('device_type');

			is_blank($rider_id,"Rider Id");
			//is_blank($device_token,"Device Token");

			$query = $this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`id`='$rider_id' and rider_status !='"."2"."'");


			if ($query->num_rows() > 0)
			{

				$row = $query->row();
				if($device_token!=null && $device_token!="")
				{
					$fields['device_token'] = $device_token;
					$fields['device_type'] = $device_type;

					$this->db->where(['id'=>$row->id])->update('rider_listing', $fields);
				}


				$rider_id=$row->id;
				$res['rider_id'] = $row->id;
				$res['rider_name'] = $row->rider_name;
				$res['mobile'] = $row->rider_mobile_no;
				$res['email'] = $row->rider_email_id;
				$res['password'] = $row->rider_password;
				$res['confirm_password'] = $row->rider_confirm_password;
				$res['address'] = $row->rider_permanant_address;
				$res['id_card_no'] = $row->rider_identy_card_no;
				$res['id_card_img'] = base_url()."uploads/".$row->rider_identy_card_photo;
				$res['profile_img'] = base_url()."uploads/".$row->rider_photo;
				$res['vender_id'] = $row->vendor_id;
				$res['status'] = $row->rider_status;
				$res['join_date'] = $row->rider_added_date_time;
				$res['wallet_amt'] = $row->wallet_balance;
					$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$row->vendor_id."");
				// 	echo "SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				// 	LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."";

			$rowlaundry = $laundry->row();
						$res['currency_name'] 	= $rowlaundry->currency_name;
						$res['currency_symbol'] 	= $rowlaundry->currency_symbol;

$order_status="2,3";
				$querybk = $this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`pickup_boy_id` =". $rider_id ." AND `all_booking`.`booking_status` IN(". $order_status.")");
				$count="0";
				if($querybk->num_rows()>0)
				{
					$count   =$querybk->num_rows();
				}

				$res['pickup_count'] = $count;


				$order_status="7";
				$querybk = $this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`pickup_boy_id` =". $rider_id ." AND `all_booking`.`booking_status` IN(". $order_status.")");
				$count="0";
				if($querybk->num_rows()>0)
				{
					$count   =$querybk->num_rows();
				}
				$res['drop_count'] = $count;


				$order_status="8";
				$querybk = $this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`pickup_boy_id` =". $rider_id ." AND `all_booking`.`booking_status` IN(". $order_status.")");
				$count="0";
				if($querybk->num_rows()>0)
				{
					$count   =$querybk->num_rows();
				}
				$res['completed'] = $count;

				$result['data'] = $res;
				$result['msg'] = "Data Fetched .";
				success_response($result);
			}
			else
			{
				$res = "Rider account closed.";
				fail_response($res);
			}
		}


		public function rider_wallet_transaction()
		{
			$rider_id =post('rider_id');
			is_blank($rider_id,"Rider Id");
			$productarray=[];
			$categorys = $this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`id`='$rider_id'");
			if ($categorys->num_rows() > 0)
			{
			$rowrider = $categorys->row();
				$res['wallet_balance'] =$rowrider->wallet_balance;

					$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowrider->vendor_id."");

			$rowlaundry = $laundry->row();
						$res['currency_name'] 	= $rowlaundry->currency_name;
						$res['currency_symbol'] 	= $rowlaundry->currency_symbol;


				$products = $this->db->query("SELECT * from wallet_transaction_rider WHERE `wallet_transaction_rider`.`rider_id`=".$rider_id." order by id desc");



				if($products->num_rows()>0)
				{
					foreach ($products->result_array() as $key => $product)
					{
						$productres['transaction_id'] 	= $product['id'];
						$productres['amt'] 	= $product['amt'];
						$productres['currency_symbol'] 	= $rowlaundry->currency_symbol;
						$productres['transaction_operation'] 	= $product['transaction_operation'];
						$productres['remark'] 	= $product['remark'];
						$productres['added_date'] 	= $product['added_date'];
						$productres['added_date_time'] 	= $product['added_date_time'];

						$productres['booking_id'] 	= $product['booking_id'];
						$productres['status'] 	= $product['status'];
						$productarray[] = $productres;
					}

				}
					$res['msg'] = "Data found Successfully .";
			$res["transaction_list"] = $productarray;
			success_response($res);
			}
			else
			{
			    $res['wallet_balance'] ="0";
			    	$res['msg'] = "Data not found .";
			$res["transaction_list"] = [];
			fail_response($res);
			}


		}



		public function forgot_password()
		{
			$mobile_no =post('mobile_no');
			is_blank($mobile_no,"Mobile Number");

			$query = $this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`rider_mobile_no`=$mobile_no");
			if ($query->num_rows() > 0)
			{

				$row = $query->row();
				$otpcode=otpcode(4);
				$res['otp_code'] = $otpcode;

				$res['mobile'] = $row->rider_mobile_no;
				$res['msg'] = "Otp send to your registered mobile number.";
				success_response($res);
			}
			else
			{
				$res = "Mobile number not found.";
				fail_response($res);
			}
		}


		public function update_password()
		{
			$mobile_no =post('mobile_no');
			$new_password =post('new_password');
			is_blank($mobile_no,"Mobile Number");
			is_blank($new_password,"Password");

			$query = $this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`rider_mobile_no`='$mobile_no'");
			if ($query->num_rows() > 0)
			{

				$user_id = $query->row()->id;
				$fields['rider_password'] = $new_password;
				$fields['rider_confirm_password'] = $new_password;
				$this->db->where(['id'=>$user_id])->update('rider_listing', $fields);
				$res['msg'] = "Password has been changed successfully.";
				success_response($res);
			}
			else
			{
				$res = "Mobile number not found.";
				fail_response($res);
			}
		}

		public function change_rider_password()
		{
			$rider_id =post('rider_id');
			$old_password =post('old_password');
			$new_password =post('new_password');

			is_blank($rider_id,"Rider id");
			is_blank($old_password,"Old Password");
			is_blank($new_password,"New Password");
			is_rider_not($rider_id);

			$query = $this->db->query("SELECT * FROM `rider_listing` WHERE  `rider_listing`.`id`='$rider_id' AND `rider_listing`.`rider_password`='$old_password'");

			if ($query->num_rows() > 0)
			{
				$fields['rider_password'] = $new_password;
				$fields['rider_confirm_password'] = $new_password;
				$this->db->where(['id'=>$rider_id])->update('rider_listing', $fields);
				$res['msg'] = "Laundry Password Update Successfully Done.";
				success_response($res);
			}
			else
			{
				$res = "Old Password Not match.";
				fail_response($res);
			}
		}


		public function order_details()
		{


			$order_id =post('order_id');
			$order_status =post('order_status');
			is_blank(trim($order_id),"Order Id");
			//is_laundry_not($laundry_id);
			$query=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`id` = $order_id");

			//$response=[];

			if ($query->num_rows() >0)
			{
				$rowinfo = $query->row_array();
				$response['order_id'] = $rowinfo['id'];
				$response['user_id'] = $rowinfo['user_id'];
				$response['user_name'] 	= $rowinfo['user_name'];
				$response['mobile'] = $rowinfo['user_mobile_no'];
				$response['email'] 	= $rowinfo['user_email_id'];
				$response['delivery_lat'] = $rowinfo['delivery_lat'];
				$response['delivery_long'] 	= $rowinfo['delivery_long'];
				$response['delivery_address'] = $rowinfo['delivery_address'];
				$response['delivery_address_id'] 	= $rowinfo['delivery_address_id'];
				$response['pickup_date'] = $rowinfo['pickup_date'];
				$response['pickup_time'] 	= $rowinfo['pickup_time'];
				$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				$response['pickup_time_org'] 	= $rowinfo['pickup_time_org'];
				$response['placed_time'] = $rowinfo['placed_time'];
				$response['confirm_time'] = $rowinfo['confirm_time'];
				$response['allot_for_pickup_time'] = $rowinfo['allot_for_pickup_time'];
				$response['picked_up_time'] = $rowinfo['picked_up_time'];
				$response['received_at_loundry_time'] = $rowinfo['received_at_loundry_time'];
				$response['in_process_time'] = $rowinfo['in_process_time'];
				$response['order_ready_time'] = $rowinfo['order_ready_time'];
				$response['allot_for_drop_time'] = $rowinfo['allot_for_drop_time'];
				$response['drop_time'] = $rowinfo['drop_time'];
				$response['pickup_otp'] = $rowinfo['pickup_otp'];
				$response['drop_otp'] = $rowinfo['drop_otp'];
				$response['total_item_price'] = $rowinfo['total_item_price'];
				$response['tax_percent'] = $rowinfo['tax_percent'];
				$response['tax_amt'] = $rowinfo['tax_amt'];
				$response['delivery_label'] = "Applicable Delivery Charge";

				$querybk = $this->db->query("SELECT * from booking_list where id='".$rowinfo['id']."'");

					$response['delivery_charge'] = $querybk->row()->delivery_charge;

				$response['total_amt'] = $rowinfo['total_amt'];
				$response['paid_by_promo'] = $rowinfo['paid_by_promo'];
				$response['paid_by_wallet'] = $rowinfo['paid_by_wallet'];
				$response['paid_by_online'] = $rowinfo['paid_by_online'];
				$response['paid_by_cash'] = $rowinfo['paid_by_cash'];
				$response['skip_for_pay'] = $rowinfo['skip_for_pay'];
				$response['pickup_boy_id'] = $rowinfo['pickup_boy_id'];
				$response['pickup_boy_name'] = $rowinfo['pickup_boy_name'];
				$response['pickup_boy_number'] = $rowinfo['pickup_boy_number'];
				$response['drop_boy_id'] = $rowinfo['drop_boy_id'];
				$response['drop_boy_name'] = $rowinfo['drop_boy_name'];
				$response['drop_boy_number'] = $rowinfo['drop_boy_number'];
				$response['applied_promocode'] = $rowinfo['applied_promocode'];
				$response['applied_promocode_id'] = $rowinfo['applied_promocode_id'];
				$response['add_to_wallet_by_promocode'] = $rowinfo['add_to_wallet_by_promocode'];
				$response['add_to_wallet_by_promo_status'] = $rowinfo['add_to_wallet_by_promo_status'];
				$response['invoice_date'] = $rowinfo['invoice_date'];
				$response['invoice_number'] = $rowinfo['invoice_number'];
				$response['vendor_id'] = $rowinfo['vendor_id'];
				$response['vendor_name'] = $rowinfo['vendor_name'];
				$response['vendor_mobile_no'] = $rowinfo['vendor_mobile_no'];
				$response['vendor_lat'] = $rowinfo['vendor_lat'];
				$response['vendor_long'] = $rowinfo['vendor_long'];
				$response['vendor_address'] = $rowinfo['vendor_address'];
				$response['country_id'] = $rowinfo['country_id'];
				$response['country_name'] = $rowinfo['country_name'];
				$response['country_code'] = $rowinfo['country_code'];
				$response['currency_name'] = $rowinfo['currency_name'];
				$response['currency_symbol'] = $rowinfo['currency_symbol'];
				$response['vendor_image'] = $rowinfo['vendor_image'];
				$response['cancellation_reason'] = $rowinfo['cancellation_reason'];
				$response['cancelled_by_id'] = $rowinfo['cancelled_by_id'];
				$response['cancelled_time'] = $rowinfo['cancelled_time'];
				$response['booking_status'] = $rowinfo['booking_status'];
				$response['online_transaction_id'] = $rowinfo['online_transaction_id'];
				$response['book_status'] = $rowinfo['book_status'];



									$productarray2=[];
												$productsok = $this->db->query("SELECT * FROM `addon_charges_in_booking` WHERE `addon_charges_in_booking`.`booking_id`=".$rowinfo['id']."");
													if($productsok->num_rows()>0)
													{
														foreach ($productsok->result_array() as $key => $product2)
														{

								$productres2['addon_id'] 	= $product2['id'];
								$productres2['title'] 	= $product2['title'];
								$productres2['increase_decrease'] 	= $product2['increase_decrease'];
								$productres2['addon_amount'] 	= get_round($product2['addon_amount'],2);
								$productres2['currency_name'] 	= $rowinfo['currency_name'];
								$productres2['currency_symbol'] 	= $rowinfo['currency_symbol'];

								$productarray2[] = $productres2;
															}

														}


									$response["addon_list"] = $productarray2;

				$products = $this->db->query("SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` AS `item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id`= `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id`=".$rowinfo['id']."");
				$total_qty="0";
				$productarray=[];
				if($products->num_rows()>0)
				{
					foreach ($products->result_array() as $key => $product)
					{
						$productres['booking_product_id'] 	= $product['id'];
						$productres['item_id'] 	= $product['item_id'];
						$productres['item_name'] 	= $product['item_name'];
						$productres['unit_id'] 	= $product['unit_id'];
						$productres['unit_name'] 	= $product['unit_name'];
						$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
						$productres['item_description'] 	= $product['item_description'];
						$productres['price'] 	= $product['price'];
						$productres['offer_price'] 	= $product['offer_price'];
						$productres['qty'] 	= $product['qty'];
						$total_qty=$total_qty+$product['qty'];
						$productres['is_type_bucket'] 	= $product['is_type_bucket'];
					if($product['is_type_bucket']=="1")
					{
					$row_bucket=get_total_item_in_bucket($product['id'],$rowinfo['id']);
					$productres['total_item'] 	=$row_bucket['total_item'];
					$productres['total_amount'] 	=$row_bucket['total_item_price'];
					}
					else {
					$productres['total_amount'] 	= $product['total_amount'];
					$productres['total_item'] 	=$product['qty'];
					// code...
					}



						$productres['total_amount'] 	= $product['total_amount'];
						$productres['category_name'] 	= $product['category_name'];
						$productres['category_id'] 	= $product['category_id'];
						$productres['tax_percent'] 	= $product['tax_percent'];
						$productres['tax_amt'] 	= $product['tax_amt'];
						$productarray[] = $productres;
					}
				}

				$response['total_qty'] = $total_qty;
				$pickBoySend=[];
				$pickup_boy_id = $rowinfo['pickup_boy_id'];
				$pickupBoyInfo =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$pickup_boy_id' ");
				if ($pickupBoyInfo->num_rows()>0)
				{
					$pickupBoyData = $pickupBoyInfo->row_array();
					$pickupBoy['rider_id'] 	= $pickupBoyData['id'];
					$pickupBoy['rider_name'] 	= $pickupBoyData['rider_name'];
					$pickupBoy['rider_mobile_no'] 	= $pickupBoyData['rider_mobile_no'];
					$pickupBoy['rider_email_id'] 	= $pickupBoyData['rider_email_id'];
					$pickupBoy['rider_password'] 	= $pickupBoyData['rider_password'];
					$pickupBoy['rider_permanant_address'] 	= $pickupBoyData['rider_permanant_address'];
					$pickupBoy['rider_identy_card_no'] 	= $pickupBoyData['rider_identy_card_no'];
					$pickupBoy['rider_identy_card_photo'] 	= base_url()."uploads/".$pickupBoyData['rider_identy_card_photo'];
					$pickupBoy['rider_photo'] 	= base_url()."uploads/".$pickupBoyData['rider_photo'];
					$pickupBoy['vendor_id'] 	= $pickupBoyData['vendor_id'];
					$pickupBoy['status'] 	= $pickupBoyData['rider_status'];
					$pickupBoy['added_date_time'] 	= $pickupBoyData['rider_added_date_time'];
					$pickupBoy['wallet'] 	= $pickupBoyData['wallet_balance'];

					$pickBoySend['data']=$pickupBoy;
					$pickBoySend['status']=true;
					$pickBoySend['msg']="Pickup Boy aasigned.";
				}
				else
				{
					$pickBoySend['status']=false;
					$pickBoySend['msg']="Pickup Boy not aasigned.";
				}



				$response["pickup_boy"] = $pickBoySend;
				$dropBoySend=[];

				$drop_boy_id = $rowinfo['drop_boy_id'];
				$DropBoyInfo =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$drop_boy_id' ");
				if ($DropBoyInfo->num_rows()>0) {

					$dropBoyData = $DropBoyInfo->row_array();
					$dropBoy['rider_id'] 	= $dropBoyData['id'];
					$dropBoy['rider_name'] 	= $dropBoyData['rider_name'];
					$dropBoy['rider_mobile_no'] 	= $dropBoyData['rider_mobile_no'];
					$dropBoy['rider_email_id'] 	= $dropBoyData['rider_email_id'];
					$dropBoy['rider_password'] 	= $dropBoyData['rider_password'];
					$dropBoy['rider_permanant_address'] 	= $dropBoyData['rider_permanant_address'];
					$dropBoy['rider_identy_card_no'] 	= $dropBoyData['rider_identy_card_no'];
					$dropBoy['rider_identy_card_photo'] 	= base_url()."uploads/".$dropBoyData['rider_identy_card_photo'];
					$dropBoy['rider_photo'] 	= base_url()."uploads/".$dropBoyData['rider_photo'];
					$dropBoy['vendor_id'] 	= $dropBoyData['vendor_id'];
					$dropBoy['status'] 	= $dropBoyData['rider_status'];
					$dropBoy['added_date_time'] 	= $dropBoyData['rider_added_date_time'];
					$dropBoy['wallet'] 	= $dropBoyData['wallet_balance'];
					$dropBoySend['data']=$dropBoy;
					$dropBoySend['status']=true;
					$dropBoySend['msg']="Drop Boy aasigned.";
					}else{
					$dropBoySend['status']=false;
					$dropBoySend['msg']="Drop Boy not aasigned.";
				}
				$response["drop_boy"] = $dropBoySend;
				$response["order_product"] = $productarray;


				$result["order_data"] = $response;
				$result['msg'] = "Order Data Done.";

				success_response($result);
				}else{
				$result = "Order Data not found.";
				fail_response($result);
			}

		}

		public function getBucketDetails()
		{


			$bucket_id =post('bucket_id');
			is_blank($bucket_id,"Bucket Id");
			$array=[];
			$querybucket= $this->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`id`=".$bucket_id." AND `booking_list_item`.`is_type_bucket`=1");
			if($querybucket->num_rows() > 0)
			{
			$row_bucket=$querybucket->row();

			$querybooking= $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`id`=".$row_bucket->booking_id);
			if($querybooking->num_rows() > 0)
			{
					$row_booking=$querybooking->row();

					$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
						`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
						LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$row_booking->vendor_id."");
						$rowlaundry = $laundry->row();
							$currency_name	= $rowlaundry->currency_name;
							$currency_symbol	= $rowlaundry->currency_symbol;


					$products = $this->db->query("SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` AS `item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id`= `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id`=".$row_booking->id." and `booking_list_item`.`bucket_id`=".$bucket_id."");

					$productarray=[];
					$bucket_amount=0;
					$bucket_tax=0;
					$bucket_total_item =0;
					if($products->num_rows()>0)
					{
						foreach ($products->result_array() as $key => $product)
						{
							$productres['booking_product_id'] 	= $product['id'];
							$productres['item_id'] 	= $product['item_id'];
							$productres['item_name'] 	= $product['item_name'];
							$productres['unit_id'] 	= $product['unit_id'];
							$productres['unit_name'] 	= $product['unit_name'];
							$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
							$productres['item_description'] 	= $product['item_description'];
							$productres['price'] 	= $product['price'];
							$productres['offer_price'] 	= $product['offer_price'];
							$productres['qty'] 	= $product['qty'];
							$productres['total_amount'] 	= round($product['total_amount']);
							$bucket_total_item=$bucket_total_item+$product['qty'];
							$bucket_amount=$bucket_amount+round($product['total_amount']);
							$bucket_tax=$bucket_tax+round($product['tax_amt']);
							$productres['category_name'] 	= $product['category_name'];
							$productres['category_id'] 	= $product['category_id'];
							$productres['is_type_bucket'] 	= $product['is_type_bucket'];
							$productres['total_item'] 	= $product['qty'];
							$productres['currency_name'] 	= $currency_name;
							$productres['currency_symbol'] 	= $currency_symbol;

							$productres['tax_percent'] 	= $product['tax_percent'];
							$productres['tax_amt'] 	= round($product['tax_amt']);
							$productarray[] = $productres;
						}

					}
					$result["product_list"] = $productarray;
					$result['bucket_name'] = $row_bucket->item_name;
					$result['bucket_unit'] = $row_bucket->unit_name;
					$result['currency_name'] = $currency_name;
					$result['currency_symbol'] = $currency_symbol;
					$result['bucket_description'] = $row_bucket->item_description;
					$result['bucket_qty'] = $row_bucket->qty;
					$result['bucket_amount'] = round($bucket_amount);
					$result['bucket_tax'] = round($bucket_tax);
					$result['bucket_total'] = round($bucket_amount+$bucket_tax);
					$result['bucket_total_item'] = round($bucket_total_item);


					$result['msg'] = "Data found Successfully .";
					success_response($result);
				}
				else {
					// code...boooking not found
					$res = "Booking not found.";
					fail_response($res);
				}
			}
			else {
				// code...bucket not found
				$res = "Bucket not found.";
				fail_response($res);
			}



		}

		public function pickup_boy_order_list()
		{
			//"SELECT * FROM `all_booking` WHERE `all_booking`.`pickup_boy_id` =". $rider_id ." AND `all_booking`.`booking_status` IN(". $order_status.")"

			$rider_id =post('rider_id');
			$order_status =post('order_status');
			is_blank(trim($rider_id),"Rider Id");
			is_rider_not($rider_id);
			$add_query ='';
			if (post('order_status')!="")
			{
				$add_query = $add_query." AND `all_booking`.`booking_status` IN(". $order_status.")";
			}

			if (post('dateFrom')!="" && post('dateTo')!="")
			{
				$dateFrom=post('dateFrom');
				$dateTo=post('dateTo');
				$add_query = $add_query." AND
				DATE_FORMAT(`placed_time`,'%Y-%m-%d') >= DATE_FORMAT('".$dateFrom."','%Y-%m-%d')  AND DATE_FORMAT(placed_time,'%Y-%m-%d') <= DATE_FORMAT('".$dateTo."','%Y-%m-%d')";
			}else
			{
				$dateFrom=date('Y-m-d');
				$dateTo=date('Y-m-d');
			}

			$add_query = $add_query." ORDER BY id DESC";

			$query=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`pickup_boy_id` =". $rider_id ."".$add_query."");
$currency_symbol="";
			$array=[];
			foreach ($query->result_array() as $key => $rowinfo)
			{
				$response['order_id'] = $rowinfo['id'];
				$currency_symbol=$rowinfo['currency_symbol'];
				$response['user_id'] = $rowinfo['user_id'];
				$response['user_name'] 	= $rowinfo['user_name'];
				$response['mobile'] = $rowinfo['user_mobile_no'];
				$response['email'] 	= $rowinfo['user_email_id'];
				$response['delivery_lat'] = $rowinfo['delivery_lat'];
				$response['delivery_long'] 	= $rowinfo['delivery_long'];
				$response['delivery_address'] = $rowinfo['delivery_address'];
				$response['delivery_address_id'] 	= $rowinfo['delivery_address_id'];
				$response['pickup_date'] = $rowinfo['pickup_date'];
				$response['pickup_time'] 	= $rowinfo['pickup_time'];
				$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				$response['pickup_time_org'] 	= $rowinfo['pickup_time_org'];
				$response['placed_time'] = $rowinfo['placed_time'];
				$response['confirm_time'] = $rowinfo['confirm_time'];
				$response['allot_for_pickup_time'] = $rowinfo['allot_for_pickup_time'];
				$response['picked_up_time'] = $rowinfo['picked_up_time'];
				$response['received_at_loundry_time'] = $rowinfo['received_at_loundry_time'];
				$response['in_process_time'] = $rowinfo['in_process_time'];
				$response['order_ready_time'] = $rowinfo['order_ready_time'];
				$response['allot_for_drop_time'] = $rowinfo['allot_for_drop_time'];
				$response['drop_time'] = $rowinfo['drop_time'];
				$response['pickup_otp'] = $rowinfo['pickup_otp'];
				$response['drop_otp'] = $rowinfo['drop_otp'];
				$response['total_item_price'] = $rowinfo['total_item_price'];
				$response['tax_percent'] = $rowinfo['tax_percent'];
				$response['tax_amt'] = $rowinfo['tax_amt'];
				$response['total_amt'] = $rowinfo['total_amt'];
				$response['paid_by_promo'] = $rowinfo['paid_by_promo'];
				$response['paid_by_wallet'] = $rowinfo['paid_by_wallet'];
				$response['paid_by_online'] = $rowinfo['paid_by_online'];
				$response['paid_by_cash'] = $rowinfo['paid_by_cash'];
				$response['skip_for_pay'] = $rowinfo['skip_for_pay'];
				$response['pickup_boy_id'] = $rowinfo['pickup_boy_id'];
				$response['pickup_boy_name'] = $rowinfo['pickup_boy_name'];
				$response['pickup_boy_number'] = $rowinfo['pickup_boy_number'];
				$response['drop_boy_id'] = $rowinfo['drop_boy_id'];
				$response['drop_boy_name'] = $rowinfo['drop_boy_name'];
				$response['drop_boy_number'] = $rowinfo['drop_boy_number'];
				$response['applied_promocode'] = $rowinfo['applied_promocode'];
				$response['applied_promocode_id'] = $rowinfo['applied_promocode_id'];
				$response['add_to_wallet_by_promocode'] = $rowinfo['add_to_wallet_by_promocode'];
				$response['add_to_wallet_by_promo_status'] = $rowinfo['add_to_wallet_by_promo_status'];
				$response['invoice_date'] = $rowinfo['invoice_date'];
				$response['invoice_number'] = $rowinfo['invoice_number'];
				$response['vendor_id'] = $rowinfo['vendor_id'];
				$response['vendor_name'] = $rowinfo['vendor_name'];
				$response['vendor_mobile_no'] = $rowinfo['vendor_mobile_no'];
				$response['vendor_lat'] = $rowinfo['vendor_lat'];
				$response['vendor_long'] = $rowinfo['vendor_long'];
				$response['vendor_address'] = $rowinfo['vendor_address'];
				$response['country_id'] = $rowinfo['country_id'];
				$response['country_name'] = $rowinfo['country_name'];
				$response['country_code'] = $rowinfo['country_code'];
				$response['currency_name'] = $rowinfo['currency_name'];
				$response['currency_symbol'] = $rowinfo['currency_symbol'];
				$response['vendor_image'] = $rowinfo['vendor_image'];
				$response['cancellation_reason'] = $rowinfo['cancellation_reason'];
				$response['cancelled_by_id'] = $rowinfo['cancelled_by_id'];
				$response['cancelled_time'] = $rowinfo['cancelled_time'];
				$response['booking_status'] = $rowinfo['booking_status'];
				$response['online_transaction_id'] = $rowinfo['online_transaction_id'];
				$response['book_status'] = $rowinfo['book_status'];




				$products = $this->db->query("SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` AS `item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id`= `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id`=".$rowinfo['id']."");

				$productarray=[];
				if($products->num_rows()>0)
				{
					foreach ($products->result_array() as $key => $product)
					{
						$productres['booking_product_id'] 	= $product['id'];
						$productres['item_id'] 	= $product['item_id'];
						$productres['item_name'] 	= $product['item_name'];
						$productres['unit_id'] 	= $product['unit_id'];
						$productres['unit_name'] 	= $product['unit_name'];
						$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
						$productres['item_description'] 	= $product['item_description'];
						$productres['price'] 	= $product['price'];
						$productres['offer_price'] 	= $product['offer_price'];
						$productres['qty'] 	= $product['qty'];
						$productres['total_amount'] 	= $product['total_amount'];
						$productres['category_name'] 	= $product['category_name'];
						$productres['category_id'] 	= $product['category_id'];
						$productres['tax_percent'] 	= $product['tax_percent'];
						$productres['tax_amt'] 	= $product['tax_amt'];
						$productarray[] = $productres;
					}
				}

				$pickBoySend=[];
				$pickup_boy_id = $rowinfo['pickup_boy_id'];
				$pickupBoyInfo =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$pickup_boy_id' ");
				if ($pickupBoyInfo->num_rows()>0) {
					$pickupBoyData = $pickupBoyInfo->row_array();
					$pickupBoy['rider_id'] 	= $pickupBoyData['id'];
					$pickupBoy['rider_name'] 	= $pickupBoyData['rider_name'];
					$pickupBoy['rider_mobile_no'] 	= $pickupBoyData['rider_mobile_no'];
					$pickupBoy['rider_email_id'] 	= $pickupBoyData['rider_email_id'];
					$pickupBoy['rider_password'] 	= $pickupBoyData['rider_password'];
					$pickupBoy['rider_permanant_address'] 	= $pickupBoyData['rider_permanant_address'];
					$pickupBoy['rider_identy_card_no'] 	= $pickupBoyData['rider_identy_card_no'];
					$pickupBoy['rider_identy_card_photo'] 	= base_url()."uploads/".$pickupBoyData['rider_identy_card_photo'];
					$pickupBoy['rider_photo'] 	= base_url()."uploads/".$pickupBoyData['rider_photo'];
					$pickupBoy['vendor_id'] 	= $pickupBoyData['vendor_id'];
					$pickupBoy['status'] 	= $pickupBoyData['rider_status'];
					$pickupBoy['added_date_time'] 	= $pickupBoyData['rider_added_date_time'];
					$pickupBoy['wallet'] 	= $pickupBoyData['wallet_balance'];

					$pickBoySend['data']=$pickupBoy;
					$pickBoySend['status']=true;
					$pickBoySend['msg']="Pickup Boy aasigned.";
					}else{
					$pickBoySend['status']=false;
					$pickBoySend['msg']="Pickup Boy not aasigned.";
				}



				$response["pickup_boy"] = $pickBoySend;
				$dropBoySend=[];

				$drop_boy_id = $rowinfo['drop_boy_id'];
				$DropBoyInfo =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$drop_boy_id' ");
				if ($DropBoyInfo->num_rows()>0) {

					$dropBoyData = $DropBoyInfo->row_array();
					$dropBoy['rider_id'] 	= $dropBoyData['id'];
					$dropBoy['rider_name'] 	= $dropBoyData['rider_name'];
					$dropBoy['rider_mobile_no'] 	= $dropBoyData['rider_mobile_no'];
					$dropBoy['rider_email_id'] 	= $dropBoyData['rider_email_id'];
					$dropBoy['rider_password'] 	= $dropBoyData['rider_password'];
					$dropBoy['rider_permanant_address'] 	= $dropBoyData['rider_permanant_address'];
					$dropBoy['rider_identy_card_no'] 	= $dropBoyData['rider_identy_card_no'];
					$dropBoy['rider_identy_card_photo'] 	= base_url()."uploads/".$dropBoyData['rider_identy_card_photo'];
					$dropBoy['rider_photo'] 	= base_url()."uploads/".$dropBoyData['rider_photo'];
					$dropBoy['vendor_id'] 	= $dropBoyData['vendor_id'];
					$dropBoy['status'] 	= $dropBoyData['rider_status'];
					$dropBoy['added_date_time'] 	= $dropBoyData['rider_added_date_time'];
					$dropBoy['wallet'] 	= $dropBoyData['wallet_balance'];
					$dropBoySend['data']=$dropBoy;
					$dropBoySend['status']=true;
					$dropBoySend['msg']="Drop Boy aasigned.";
					}else{
					$dropBoySend['status']=false;
					$dropBoySend['msg']="Drop Boy not aasigned.";
				}
				$response["drop_boy"] = $dropBoySend;
				$response["order_product"] = $productarray;
				$array[] = $response;
			}
			$result["order_list"] = $array;
			$result["total_cash"] = "500";
			$result["currency_symbol"] = $currency_symbol;

			$result["total_order"] = "10";

			$result['msg'] = "Order List Done.";

			success_response($result);
		}

		public function drop_boy_order_list()
		{


			$rider_id =post('rider_id');
			$order_status =post('order_status');
			is_blank(trim($rider_id),"Rider Id");
			is_rider_not($rider_id);
			$add_query ='';
			if (post('order_status')!="")
			{
				$add_query = $add_query." AND `all_booking`.`booking_status` =". $order_status;
			}

			if (post('dateFrom')!="" && post('dateTo')!="")
			{
				$dateFrom=post('dateFrom');
				$dateTo=post('dateTo');
				$add_query = $add_query." AND
				DATE_FORMAT(`placed_time`,'%Y-%m-%d') >= DATE_FORMAT('".$dateFrom."','%Y-%m-%d')  AND DATE_FORMAT(placed_time,'%Y-%m-%d') <= DATE_FORMAT('".$dateTo."','%Y-%m-%d')";
			}else
			{
				$dateFrom=date('Y-m-d');
				$dateTo=date('Y-m-d');
			}

			$add_query = $add_query." ORDER BY placed_time DESC";

			$query=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`drop_boy_id` =". $rider_id ."".$add_query."");

			$array=[];
			foreach ($query->result_array() as $key => $rowinfo)
			{
				$response['order_id'] = $rowinfo['id'];
				$response['user_id'] = $rowinfo['user_id'];
				$response['user_name'] 	= $rowinfo['user_name'];
				$response['mobile'] = $rowinfo['user_mobile_no'];
				$response['email'] 	= $rowinfo['user_email_id'];
				$response['delivery_lat'] = $rowinfo['delivery_lat'];
				$response['delivery_long'] 	= $rowinfo['delivery_long'];
				$response['delivery_address'] = $rowinfo['delivery_address'];
				$response['delivery_address_id'] 	= $rowinfo['delivery_address_id'];
				$response['pickup_date'] = $rowinfo['pickup_date'];
				$response['pickup_time'] 	= $rowinfo['pickup_time'];
				$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				$response['pickup_time_org'] 	= $rowinfo['pickup_time_org'];
				$response['placed_time'] = $rowinfo['placed_time'];
				$response['confirm_time'] = $rowinfo['confirm_time'];
				$response['allot_for_pickup_time'] = $rowinfo['allot_for_pickup_time'];
				$response['picked_up_time'] = $rowinfo['picked_up_time'];
				$response['received_at_loundry_time'] = $rowinfo['received_at_loundry_time'];
				$response['in_process_time'] = $rowinfo['in_process_time'];
				$response['order_ready_time'] = $rowinfo['order_ready_time'];
				$response['allot_for_drop_time'] = $rowinfo['allot_for_drop_time'];
				$response['drop_time'] = $rowinfo['drop_time'];
				$response['pickup_otp'] = $rowinfo['pickup_otp'];
				$response['drop_otp'] = $rowinfo['drop_otp'];
				$response['total_item_price'] = $rowinfo['total_item_price'];
				$response['tax_percent'] = $rowinfo['tax_percent'];
				$response['tax_amt'] = $rowinfo['tax_amt'];
				$response['total_amt'] = $rowinfo['total_amt'];
				$response['paid_by_promo'] = $rowinfo['paid_by_promo'];
				$response['paid_by_wallet'] = $rowinfo['paid_by_wallet'];
				$response['paid_by_online'] = $rowinfo['paid_by_online'];
				$response['paid_by_cash'] = $rowinfo['paid_by_cash'];
				$response['skip_for_pay'] = $rowinfo['skip_for_pay'];
				$response['pickup_boy_id'] = $rowinfo['pickup_boy_id'];
				$response['pickup_boy_name'] = $rowinfo['pickup_boy_name'];
				$response['pickup_boy_number'] = $rowinfo['pickup_boy_number'];
				$response['drop_boy_id'] = $rowinfo['drop_boy_id'];
				$response['drop_boy_name'] = $rowinfo['drop_boy_name'];
				$response['drop_boy_number'] = $rowinfo['drop_boy_number'];
				$response['applied_promocode'] = $rowinfo['applied_promocode'];
				$response['applied_promocode_id'] = $rowinfo['applied_promocode_id'];
				$response['add_to_wallet_by_promocode'] = $rowinfo['add_to_wallet_by_promocode'];
				$response['add_to_wallet_by_promo_status'] = $rowinfo['add_to_wallet_by_promo_status'];
				$response['invoice_date'] = $rowinfo['invoice_date'];
				$response['invoice_number'] = $rowinfo['invoice_number'];
				$response['vendor_id'] = $rowinfo['vendor_id'];
				$response['vendor_name'] = $rowinfo['vendor_name'];
				$response['vendor_mobile_no'] = $rowinfo['vendor_mobile_no'];
				$response['vendor_lat'] = $rowinfo['vendor_lat'];
				$response['vendor_long'] = $rowinfo['vendor_long'];
				$response['vendor_address'] = $rowinfo['vendor_address'];
				$response['country_id'] = $rowinfo['country_id'];
				$response['country_name'] = $rowinfo['country_name'];
				$response['country_code'] = $rowinfo['country_code'];
				$response['currency_name'] = $rowinfo['currency_name'];
				$response['currency_symbol'] = $rowinfo['currency_symbol'];
				$response['vendor_image'] = $rowinfo['vendor_image'];
				$response['cancellation_reason'] = $rowinfo['cancellation_reason'];
				$response['cancelled_by_id'] = $rowinfo['cancelled_by_id'];
				$response['cancelled_time'] = $rowinfo['cancelled_time'];
				$response['booking_status'] = $rowinfo['booking_status'];
				$response['online_transaction_id'] = $rowinfo['online_transaction_id'];
				$response['book_status'] = $rowinfo['book_status'];




				$products = $this->db->query("SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` AS `item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id`= `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id`=".$rowinfo['id']."");

				$productarray=[];
				if($products->num_rows()>0)
				{
					foreach ($products->result_array() as $key => $product)
					{
						$productres['booking_product_id'] 	= $product['id'];
						$productres['item_id'] 	= $product['item_id'];
						$productres['item_name'] 	= $product['item_name'];
						$productres['unit_id'] 	= $product['unit_id'];
						$productres['unit_name'] 	= $product['unit_name'];
						$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
						$productres['item_description'] 	= $product['item_description'];
						$productres['price'] 	= $product['price'];
						$productres['offer_price'] 	= $product['offer_price'];
						$productres['qty'] 	= $product['qty'];
						$productres['total_amount'] 	= $product['total_amount'];
						$productres['category_name'] 	= $product['category_name'];
						$productres['category_id'] 	= $product['category_id'];
						$productres['tax_percent'] 	= $product['tax_percent'];
						$productres['tax_amt'] 	= $product['tax_amt'];
						$productarray[] = $productres;
					}
				}

				$pickBoySend=[];
				$pickup_boy_id = $rowinfo['pickup_boy_id'];
				$pickupBoyInfo =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$pickup_boy_id' ");
				if ($pickupBoyInfo->num_rows()>0) {
					$pickupBoyData = $pickupBoyInfo->row_array();
					$pickupBoy['rider_id'] 	= $pickupBoyData['id'];
					$pickupBoy['rider_name'] 	= $pickupBoyData['rider_name'];
					$pickupBoy['rider_mobile_no'] 	= $pickupBoyData['rider_mobile_no'];
					$pickupBoy['rider_email_id'] 	= $pickupBoyData['rider_email_id'];
					$pickupBoy['rider_password'] 	= $pickupBoyData['rider_password'];
					$pickupBoy['rider_permanant_address'] 	= $pickupBoyData['rider_permanant_address'];
					$pickupBoy['rider_identy_card_no'] 	= $pickupBoyData['rider_identy_card_no'];
					$pickupBoy['rider_identy_card_photo'] 	= base_url()."uploads/".$pickupBoyData['rider_identy_card_photo'];
					$pickupBoy['rider_photo'] 	= base_url()."uploads/".$pickupBoyData['rider_photo'];
					$pickupBoy['vendor_id'] 	= $pickupBoyData['vendor_id'];
					$pickupBoy['status'] 	= $pickupBoyData['rider_status'];
					$pickupBoy['added_date_time'] 	= $pickupBoyData['rider_added_date_time'];
					$pickupBoy['wallet'] 	= $pickupBoyData['wallet_balance'];

					$pickBoySend['data']=$pickupBoy;
					$pickBoySend['status']=true;
					$pickBoySend['msg']="Pickup Boy aasigned.";
					}else{
					$pickBoySend['status']=false;
					$pickBoySend['msg']="Pickup Boy not aasigned.";
				}



				$response["pickup_boy"] = $pickBoySend;
				$dropBoySend=[];

				$drop_boy_id = $rowinfo['drop_boy_id'];
				$DropBoyInfo =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$drop_boy_id' ");
				if ($DropBoyInfo->num_rows()>0) {

					$dropBoyData = $DropBoyInfo->row_array();
					$dropBoy['rider_id'] 	= $dropBoyData['id'];
					$dropBoy['rider_name'] 	= $dropBoyData['rider_name'];
					$dropBoy['rider_mobile_no'] 	= $dropBoyData['rider_mobile_no'];
					$dropBoy['rider_email_id'] 	= $dropBoyData['rider_email_id'];
					$dropBoy['rider_password'] 	= $dropBoyData['rider_password'];
					$dropBoy['rider_permanant_address'] 	= $dropBoyData['rider_permanant_address'];
					$dropBoy['rider_identy_card_no'] 	= $dropBoyData['rider_identy_card_no'];
					$dropBoy['rider_identy_card_photo'] 	= base_url()."uploads/".$dropBoyData['rider_identy_card_photo'];
					$dropBoy['rider_photo'] 	= base_url()."uploads/".$dropBoyData['rider_photo'];
					$dropBoy['vendor_id'] 	= $dropBoyData['vendor_id'];
					$dropBoy['status'] 	= $dropBoyData['rider_status'];
					$dropBoy['added_date_time'] 	= $dropBoyData['rider_added_date_time'];
					$dropBoy['wallet'] 	= $dropBoyData['wallet_balance'];
					$dropBoySend['data']=$dropBoy;
					$dropBoySend['status']=true;
					$dropBoySend['msg']="Drop Boy aasigned.";
					}else{
					$dropBoySend['status']=false;
					$dropBoySend['msg']="Drop Boy not aasigned.";
				}
				$response["drop_boy"] = $dropBoySend;
				$response["order_product"] = $productarray;
				$array[] = $response;
			}
			$result["order_list"] = $array;
			$result['msg'] = "Order List Done.";

			success_response($result);
		}

		public function pickup_order_by_pickup_boy()
		{
			$rider_id =post('rider_id');
			$order_id =post('order_id');
			$pickup_otp =post('pickup_otp');

			is_blank(trim($rider_id),"Rider Id");
			is_rider_not($rider_id);
			is_blank(trim($order_id),"Order Id");
			is_blank(trim($pickup_otp),"Pickup Otp");

			$query = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`pickup_boy_id`=$rider_id AND `booking_list`.`id`=$order_id");

			if ($query->num_rows()>0)
			{

				$query1 = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`pickup_boy_id`=$rider_id AND `booking_list`.`id`=$order_id AND `booking_list`.`pickup_otp`='$pickup_otp'");

				if ($query1->num_rows()>0)
				{
					$fields['picked_up_time'] = date("Y-m-d h:i:s");
					$fields['booking_status'] = 3;
					$this->db->where(['id'=>$order_id])->update('booking_list', $fields);
					$res['msg'] = "Order has been Pickup successfully.";

					$user_id=$query->row()->user_id;
					$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
					if($userData->num_rows()>0)
					{
						$device_token=$userData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							send_notification_ul($device_token,"Order","Order Pickedup.","Your order id #".$order_id." Has been picked-up successfully.",$order_id,"");
						}

					}

					$vender_id=$query->row()->vendor_id;
					$venderData = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$vender_id'");
					if($venderData->num_rows()>0)
					{
						$device_token=$venderData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							send_notification_ul($device_token,"Order","Order Picked-up.","Your order id #".$order_id." Has been picked-up by pickup boy.",$order_id,"");
						}

					}


					success_response($res);

					}else{
					$msg = "Order Pickup OTP is wrong. Please try again.";
					fail_response($msg);
				}

				}else{
				$msg = "Order data not found.";
				fail_response($msg);
			}
		}

		public function drop_order_by_drop_boy()
		{
			$rider_id =post('rider_id');
			$order_id =post('order_id');
			$drop_otp =post('drop_otp');

			is_blank(trim($rider_id),"Rider Id");
			is_rider_not($rider_id);
			is_blank(trim($order_id),"Order Id");
			is_blank(trim($drop_otp),"Drop Otp");

			$query = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`drop_boy_id`=$rider_id AND `booking_list`.`id`=$order_id");

			if ($query->num_rows()>0)
			{

				$query1 = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`drop_boy_id`=$rider_id AND `booking_list`.`id`=$order_id AND `booking_list`.`drop_otp`='$drop_otp'");

				if ($query1->num_rows()>0)
				{
//echo "booking status ". $query1->row()->booking_status;
if($query1->row()->booking_status==8)
{
	$msg = "Order already completed.";
	fail_response($msg);
}
else {
	// code...
	$fields['drop_time'] = date("Y-m-d h:i:s");
	$fields['booking_status'] = 8;
	$this->db->where(['id'=>$order_id])->update('booking_list', $fields);

$skip_for_pay=$query1->row()->skip_for_pay;
$drop_boy_id=$query1->row()->drop_boy_id;
$laundry_id=$query1->row()->vendor_id;

	$laundry = $this->db->query("SELECT `loundry_list`.*,
	`country_list`.`country_name` AS `country` ,`country_list`.`id` AS `country_id` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
	LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
$rowlaundry = $laundry->row();
		//$res['currency_name'] 	= $rowlaundry->currency_name;
		$currency_symbol 	= $rowlaundry->currency_symbol;

	$rowinforiderq =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$drop_boy_id' ");
	$rowinforider=   $rowinforiderq->row_array();

	if($skip_for_pay>0)
{
$fields5['wallet_balance'] = round(($rowinforider['wallet_balance']+$skip_for_pay),2);
$this->db->where(['id'=>$drop_boy_id])->update('rider_listing', $fields5);

$data['rider_id'] = $drop_boy_id;
$data['amt'] = $skip_for_pay;
$data['transaction_operation'] = "minus";
$data['remark'] = "You received cash ".$currency_symbol.$skip_for_pay.", from order id : #".$order_id;
$data['added_date'] = date("Y-m-d");
$data['added_date_time'] = date("Y-m-d H:i:s");
$data['status'] = "1";

$this->db->insert('wallet_transaction_rider', $data);

}



$company_commission=get_round($query1->row()->total_item_price*$rowlaundry->commission_percent/100,2);
$vendor_commission=$query1->row()->total_amt-$company_commission;


				if($skip_for_pay>0)
		{
			if($vendor_commission>$skip_for_pay)
			{
				$due_vendor_commission=$vendor_commission-$skip_for_pay;

				$fieldsp['wallet_balance'] = round(($rowlaundry->wallet_balance+$due_vendor_commission),2);
				$this->db->where(['id'=>$query1->row()->vendor_id])->update('loundry_list', $fieldsp);

			  	$datap['vendor_id'] = $query1->row()->vendor_id;
					$datap['amt'] = $due_vendor_commission;
					$datap['type'] = "1";
					$datap['remark'] = "You received cash ".$currency_symbol.$skip_for_pay.", from order id : #".$order_id." and Your commission in this booking is : ".$currency_symbol.$vendor_commission." and Due amount ".$currency_symbol.$due_vendor_commission." credited to your wallet.";
					$datap['added_date'] = date("Y-m-d");
					$datap['added_date_time'] = date("Y-m-d H:i:s");
					$datap['status'] = "1";
					$datap['booking_id'] =$query1->row()->id;

					$this->db->insert('wallet_transaction_partner', $datap);
			}
			else 	if($vendor_commission<$skip_for_pay)
				{
					$extra_paid_cash=$skip_for_pay-$vendor_commission;

					$fields5pp['wallet_balance'] = round(($rowlaundry->wallet_balance-$extra_paid_cash),2);
					$this->db->where(['id'=>$query1->row()->vendor_id])->update('loundry_list', $fields5pp);

					$datapp['vendor_id'] = $query1->row()->vendor_id;
						$datapp['amt'] = $extra_paid_cash;
						$datapp['type'] = "0";
						$datapp['remark'] = "You received cash ".$currency_symbol.$skip_for_pay.", from order id : #".$order_id." and Your commission in this booking is : ".$currency_symbol.$vendor_commission." and Extra amount ".$currency_symbol.$extra_paid_cash." deducted from your wallet.";
						$datapp['added_date'] = date("Y-m-d");
						$datapp['added_date_time'] = date("Y-m-d H:i:s");
						$datapp['status'] = "1";
						$datapp['booking_id'] =$query1->row()->id;

						$this->db->insert('wallet_transaction_partner', $datapp);

				}
			else {
				$due_vendor_commission=$vendor_commission-$skip_for_pay;
				// code...
			}
			$fieldsbp['vendor_commission'] = $vendor_commission;
			$fieldsbp['company_commission'] = $company_commission;
			$fieldsbp['cash_received_by'] ="Vendor";
			$this->db->where(['id'=>$order_id])->update('booking_list', $fieldsbp);


		}
		else {

			$fields5ok1['wallet_balance'] = round(($rowlaundry->wallet_balance+$vendor_commission),2);
			$this->db->where(['id'=>$query1->row()->vendor_id])->update('loundry_list', $fields5ok1);

				$dataok1['vendor_id'] = $query1->row()->vendor_id;
				$dataok1['amt'] = $vendor_commission;
				$dataok1['type'] = "1";
				$dataok1['remark'] = "You commission ".$currency_symbol.$vendor_commission.", from order id : #".$order_id." has been credited to your wallet.";
				$dataok1['added_date'] = date("Y-m-d");
				$dataok1['added_date_time'] = date("Y-m-d H:i:s");
				$dataok1['status'] = "1";
				$dataok1['booking_id'] =$query1->row()->id;

				$this->db->insert('wallet_transaction_partner', $dataok1);
		}



	$res['msg'] = "Order has been drop successfully.";

	$user_id=$query->row()->user_id;
	$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
	if($userData->num_rows()>0)
	{
		$device_token=$userData->row()->device_token;
		if($device_token!=null && $device_token!="")
		{
			send_notification_ul($device_token,"Order","Order Delivered.","Your order id #".$order_id." Has been Delivered successfully.",$order_id,"");
		}

	}


	$vender_id=$query->row()->vendor_id;
	$venderData = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$vender_id'");
	if($venderData->num_rows()>0)
	{
		$device_token=$venderData->row()->device_token;
		if($device_token!=null && $device_token!="")
		{
			send_notification_ul($device_token,"Order","Order delivered.","Your order id #".$order_id." Has been delivered by drop boy.",$order_id,"");
		}

	}

	success_response($res);
}



					}else{
					$msg = "Order Drop OTP is wrong. Please try again.";
					fail_response($msg);
				}

				}else{
				$msg = "Order data not found.";
				fail_response($msg);
			}
		}


		public function cancel_order()
		{
			$rider_id =post('rider_id');
			$order_id =post('order_id');
			$cancel_reason =post('cancel_reason');
			is_blank(trim($rider_id),"Rider Id");
			is_rider_not($rider_id);
			is_blank(trim($order_id),"Order Id");

			$query = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`pickup_boy_id`=$rider_id AND `booking_list`.`id`=$order_id");

			if ($query->num_rows()>0)
			{
				$fields['cancelled_by_id'] = $rider_id;
				$fields['cancellation_reason'] = $cancel_reason." By rider";
				$fields['cancelled_time'] = date("Y-m-d h:i:s");
				$fields['booking_status'] = 9;
				$this->db->where(['id'=>$order_id])->update('booking_list', $fields);

				$user_id=$query->row()->user_id;
				$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
				if($userData->num_rows()>0)
				{
					$device_token=$userData->row()->device_token;
					if($device_token!=null && $device_token!="")
					{
						send_notification_ul($device_token,"Order","Order Cancelled.","Your order id #".$order_id." Cancelled by Rider Due to ".$cancel_reason,$order_id,"");
					}

				}


				$res['msg'] = "Order has been cancelled successfully.";
				success_response($res);

				}else{
				$msg = "Order data not found.";
				fail_response($msg);
			}
		}
	}
