<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	ob_start();
	class ApiVendor extends CI_Controller {

		function __construct(){
			parent::__construct();
			date_default_timezone_set('Asia/Kolkata');
		}


		public function country_list()
		{
			$laundry_id =post('laundry_id');
			$queryct = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id'");
			// echo "SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id'";

			$country_id="";
			if ($queryct->num_rows() > 0)
			{
				$country_id=  $queryct->row()->country_id;
			}

			$category =  $this->db->query("SELECT * FROM `country_list` ")->result_Array();
			foreach ($category as $key => $rowinfo)
			{


				$response2['country_id'] 	= $rowinfo['id'];
				if($country_id==$rowinfo['id'])
				{
				    $response2['is_selected'] 	= "1";
				}
				else
				{
				    $response2['is_selected'] 	= "0";
				}
				$response2['country_name'] 	= $rowinfo['country_name'];
				$response2['currency_name'] 	= $rowinfo['currency_name'];
				$response2['currency_symbol'] 	= $rowinfo['currency_symbol'];
				$response2['country_short_name'] 	= $rowinfo['country_short_name'];
				$response2['country_phone_code'] 	= $rowinfo['country_phone_code'];

				$array2[] = $response2;
			}
			$result["country_list"] = $array2;
			$result['msg'] = "Data found Successfully .";
			success_response($result);
		}

		public function laundry_reg($value='')
		{
			$laundry_name =post('laundry_name');
			$contact_person_name =post('name');
			$mobile_number =post('mobile_number');
			$email_id =post('email_id');
			$password =post('password');
			$gps_location =post('gps_location');
			$gps_lat =post('gps_lat');
			$gps_long =post('gps_long');
			$country_id =post('country_id');


			is_blank($contact_person_name,"Contact Person Name");

			is_blank($laundry_name,"Loundry Name");
			is_blank($mobile_number,"Mobile Number");
			is_blank($email_id,"Email id");
			is_blank($password,"Password");
			is_laundry_email($email_id);
			is_laundry_mobile($mobile_number);

			is_blank($gps_location,"GPS Location");
			is_blank($gps_lat,"Latitude");
			is_blank($gps_long,"Longitude");
			is_blank($country_id,"Country Id");
			is_country_not($country_id);

			$fields['vendor_name'] = $laundry_name;
			$fields['vendor_lat'] = $gps_lat;
			$fields['vendor_long'] = $gps_long;
			$fields['vendor_display_address'] = $gps_location;
			$fields['vendor_gps_address'] = $gps_location;
			$fields['vendor_image'] = saveImageFile('laundry_image','uploads/');
			$fields['contact_number'] = $mobile_number;
			$fields['contact_password'] = $password;
			$fields['contact_email_id'] = $email_id;
			$fields['contact_person_name'] = $contact_person_name;

			$fields['vendor_registration_certificate'] = saveImageFile('certificate_image','uploads/');
			$fields['identity_card'] = saveImageFile('id_image','uploads/');
			$fields['identity_card_number'] = post('id_number');
			$fields['wallet_balance'] = "0";
			$fields['device_token'] = post('device_token');
			$fields['loundry_info'] = post('loundry_info');
			$fields['vendor_status'] = "0";
			$otpcode=otpcode(4);
			$fields['otp_code'] = $otpcode;
			$fields['vendor_otp_status'] = "0";
			$fields['average_rating'] = "0";
			$fields['country_id'] = post('country_id');
			$fields['commission_percent'] = "0";
			$fields['type'] = 'Loundry';
			$fields['is_recomended'] = 0;
			$fields['is_verified'] = 0;



			$this->db->insert('loundry_list', $fields);

			$insert_id = $this->db->insert_id();
			if($insert_id!=null && $insert_id!=0)
			{

				//send_smsamitsir($mobile_number,"Your otp code is : ".$otpcode,"");
				$res['laundry_id'] = $insert_id;
				$res['otp_code'] = $otpcode;
				$res['laundry_name'] = $laundry_name;
				$res['laundry_email'] = $email_id;
				$res['laundry_mobile'] = $mobile_number;
				$res['msg'] = "Successfully registered user.";
				success_response($res);
			}
			else
			{
				$res = "Failled to insert.";
				fail_response($res);
			}
		}


		public function resend_laundry_reg_otp()
		{
			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
			is_laundry_not($laundry_id);
			$otpcode=otpcode(4);
			$fields['otp_code'] = $otpcode;
			$this->db->where(['id'=>$laundry_id])->update('loundry_list', $fields);
			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id'");
			if ($query->num_rows() > 0)
			{

				$user_id = $query->row()->id;
				$res['laundry_id'] = $query->row()->id;
				$res['otp_code'] = $otpcode;
				$res['laundry_name'] = $query->row()->vendor_name;
				$res['laundry_email'] = $query->row()->contact_email_id;
				$res['laundry_mobile'] = $query->row()->contact_number;
				$res['msg'] = "Otp send successfully.";
				success_response($res);
			}
			else
			{
				$res = "Not found try again";
				fail_response($res);
			}
		}


		public function activate_laundry()
		{
			$laundry_id =post('laundry_id');
			$status =post('status');

			is_blank($laundry_id,"Laundry Id");
			is_blank($status,"Status");
			is_laundry_not($laundry_id);
			$fields['vendor_status'] = '1';
			$fields['vendor_otp_status'] = '1';

			$this->db->where(['id'=>$laundry_id])->update('loundry_list', $fields);
			$res['msg'] = "Laundry Activate successfully.";
			success_response($res);

		}


		public function getDeliverySystem()
		{

			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
				is_laundry_not($laundry_id);
			$array1=[];
			//--Bucket item end


			    $laundry_row=gettablerow($laundry_id,"loundry_list","id");
			    $res['laundry_name'] = $laundry_row->vendor_name;
			    $res['is_normal_delivery'] = $laundry_row->is_normal_delivery;
			    $res['normal_delivery_hours'] = $laundry_row->normal_delivery_hours;
			    $res['normal_delivery_label'] = "Normal Delivery\n(".$laundry_row->normal_delivery_hours." Hours)";
			    $res['normal_delivery_value'] = "Normal";

			    $res['normal_delivery_charge'] = $laundry_row->normal_delivery_charge;
			    $res['is_express_delivery'] = $laundry_row->is_express_delivery;
			    $res['express_delivery_hours'] = $laundry_row->express_delivery_hours;
			    $res['express_delivery_label'] = "Express Delivery\n(".$laundry_row->express_delivery_hours." Hours)";
			    $res['express_delivery_value'] = "Express";
			    $res['express_delivery_charge'] = $laundry_row->express_delivery_charge;


			    $res['msg'] = "Data found Successfully .";
				success_response($res);


		}


			public function update_delivery_system()
		{
			$laundry_id =post('laundry_id');
			$is_normal_delivery =post('is_normal_delivery');
			$normal_delivery_hours =post('normal_delivery_hours');
			$normal_delivery_charge =post('normal_delivery_charge');
			$is_express_delivery =post('is_express_delivery');
			$express_delivery_hours =post('express_delivery_hours');
			$express_delivery_charge =post('express_delivery_charge');

			is_blank($laundry_id,"Laundry Id");
			is_blank($is_normal_delivery,"Is Normal Delivery");
			is_blank($normal_delivery_hours,"Normal Delivery Hours");
			is_blank($normal_delivery_charge,"Normal Delivery Charge");
			is_blank($is_express_delivery,"Is Express Delivery");
			is_blank($express_delivery_hours,"Express Delivery Hours");
			is_blank($express_delivery_charge,"Express Delivery Charge");
			is_laundry_not($laundry_id);
			$fields['is_normal_delivery'] =$is_normal_delivery;
			$fields['normal_delivery_hours'] = $normal_delivery_hours;
			$fields['normal_delivery_charge'] = $normal_delivery_charge;
			$fields['is_express_delivery'] = $is_express_delivery;
			$fields['express_delivery_hours'] = $express_delivery_hours;
			$fields['express_delivery_charge'] = $express_delivery_charge;
			$this->db->where(['id'=>$laundry_id])->update('loundry_list', $fields);
			$res['msg'] = "Details updated successfully.";
			success_response($res);

		}




		public function laundry_login()
		{
			$email_id =post('email_id');
			$user_pwd =post('password');
			$device_token =post('device_token');
			$device_type =post('device_type');

			is_blank($email_id,"User Name");
			is_blank($user_pwd,"Password");
			is_blank($device_token,"Device Token");

			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`contact_email_id`='$email_id' AND `loundry_list`.`contact_password`='$user_pwd' or `loundry_list`.`contact_number`='$email_id' AND `loundry_list`.`contact_password`='$user_pwd'");


			if ($query->num_rows() > 0)
			{

				$row = $query->row();
				if($device_token!=null && $device_token!="")
				{
					$fields['device_token'] = $device_token;
					$this->db->where(['id'=>$row->id])->update('loundry_list', $fields);

				}

				$otpcode=otpcode(4);
				$res['otp_code'] = $otpcode;

				$res['laundry_id'] = $row->id;
				$res['laundry_name'] = $row->vendor_name;
				$res['gps_lat'] = $row->vendor_lat;
				$res['gps_long'] = $row->vendor_long;
				$res['display_address'] = $row->vendor_display_address;
				$res['gps_address'] = $row->vendor_gps_address;
				$res['profile_img'] = base_url()."uploads/".$row->vendor_image;
				$res['mobile'] = $row->contact_number;
				$res['email'] = $row->contact_email_id;
				$res['certificate_img'] = base_url()."uploads/".$row->vendor_registration_certificate;
				$res['id_card_img'] = base_url()."uploads/".$row->identity_card;
				$res['wallet_balance'] = $row->wallet_balance;
				$res['info'] = $row->loundry_info;
				$res['status'] = $row->vendor_status;
				$res['otp'] = $row->otp_code;
				$res['otp_status'] = $row->vendor_otp_status;
				$res['reg_date'] = $row->vendor_registration_date;
				$res['avg_rating'] = $row->average_rating;
				$res['total_review'] = $row->total_review;
				$res['country_id'] = $row->country_id;
				$res['recomended'] = $row->is_recomended;
				$res['verifyed'] = $row->is_verified;
				$res['msg'] = "Successfully Login .";
				success_response($res);
			}
			else
			{
				$res = "Email Id or Password not found.";
				fail_response($res);
			}
		}



		public function forgot_password()
		{
			$mobile_no =post('mobile_no');
			is_blank($mobile_no,"Mobile Number");

			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND  `loundry_list`.`contact_number`='$mobile_no'");
			if ($query->num_rows() > 0)
			{

				$row = $query->row();
				$otpcode=otpcode(4);
				$res['otp_code'] = $otpcode;

				$res['mobile'] = $row->contact_number;
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

			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`contact_number`='$mobile_no'");
			if ($query->num_rows() > 0)
			{

				$user_id = $query->row()->id;
				$fields['contact_password'] = $new_password;
				$this->db->where(['id'=>$user_id])->update('loundry_list', $fields);
				$res['msg'] = "Password has been changed successfully.";
				success_response($res);
			}
			else
			{
				$res = "Mobile number not found.";
				fail_response($res);
			}
		}


		public function get_laundry_details()
		{
			$laundry_id =post('laundry_id');
			$device_token =post('device_token');
			$device_type =post('device_type');


			is_blank($laundry_id,"Laundry Id");
			is_laundry_not($laundry_id);

			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`='$laundry_id'");


			if ($query->num_rows() > 0)
			{

				$row = $query->row();
				$laundry_id=$row->id;

				if($device_token!=null && $device_token!="")
				{
					$fields['device_token'] = $device_token;
					$this->db->where(['id'=>$row->id])->update('loundry_list', $fields);

				}

				$res['laundry_id'] = $row->id;
				$res['laundry_name'] = $row->vendor_name;
				$res['contact_person_name'] = $row->contact_person_name;
				$res['identity_card_number'] = $row->identity_card_number;
				$res['gps_lat'] = $row->vendor_lat;
				$res['gps_long'] = $row->vendor_long;
				$res['display_address'] = $row->vendor_display_address;
				$res['gps_address'] = $row->vendor_gps_address;
				$res['profile_img'] = base_url()."uploads/".$row->vendor_image;
				$res['mobile'] = $row->contact_number;
				$res['email'] = $row->contact_email_id;
				$res['certificate_img'] = base_url()."uploads/".$row->vendor_registration_certificate;
				$res['id_card_img'] = base_url()."uploads/".$row->identity_card;
				$res['wallet_balance'] = $row->wallet_balance;
				$res['info'] = $row->loundry_info;
				$res['status'] = $row->vendor_status;
				$res['otp'] = $row->otp_code;
				$res['otp_status'] = $row->vendor_otp_status;
				$res['reg_date'] = $row->vendor_registration_date;
				$res['avg_rating'] = $row->average_rating;
				$res['total_review'] = $row->total_review;
				$res['country_id'] = $row->country_id;
				$res['recomended'] = $row->is_recomended;
				$res['verifyed'] = $row->is_verified;

				$laundry = $this->db->query("SELECT `loundry_list`.*,
				`country_list`.`country_name` AS `country` ,`country_list`.`id` AS `country_id` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$row->id."");
			$rowlaundry = $laundry->row();
					//$res['currency_name'] 	= $rowlaundry->currency_name;
					$currency_symbol 	= $rowlaundry->currency_symbol;
	$res['currrency_symbol'] = $currency_symbol;

				//$res['at_loundry_count'] = "4";
				//				$res['upcoming_drops_count'] ="1";
				//				$res['completed_count'] = "10";
				$bk_status="0";
				$querybk = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`='$laundry_id' and booking_status IN($bk_status)");
				$count="0";
				if($querybk->num_rows()>0)
				{
					$count   =$querybk->num_rows();
				}
				$res['new_order_count'] = $count;

				$bk_status="1,2,3";
				$querybk = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`='$laundry_id' and booking_status IN($bk_status)");
				$count="0";
				if($querybk->num_rows()>0)
				{
					$count   =$querybk->num_rows();
				}
				$res['upcoming_pickup_count'] = $count;


				$bk_status="4,5";
				$querybk = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`='$laundry_id' and booking_status IN($bk_status)");
				$count="0";
				if($querybk->num_rows()>0)
				{
					$count   =$querybk->num_rows();
				}
				$res['at_loundry_count'] = $count;


				$bk_status="6,7";
				$querybk = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`='$laundry_id' and booking_status IN($bk_status)");
				$count="0";
				if($querybk->num_rows()>0)
				{
					$count   =$querybk->num_rows();
				}
				$res['upcoming_drops_count'] = $count;


				$bk_status="8";
				$querybk = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`='$laundry_id' and booking_status IN($bk_status)");
				$count="0";
				if($querybk->num_rows()>0)
				{
					$count   =$querybk->num_rows();
				}
				$res['completed_count'] = $count;


				$res['msg'] = "Laundry data found successfully .";
				success_response($res);
			}
			else
			{
				$res = "Laundry data not found.";
				fail_response($res);
			}
		}

		public function laundry_update()
		{
			$laundry_id =post('laundry_id');
			$laundry_name =post('laundry_name');
			$contact_person_name =post('contact_person_name');
			$password =post('password');
			$gps_location =post('gps_location');
			$gps_lat =post('gps_lat');
			$gps_long =post('gps_long');
			$country_id =post('country_id');
			is_blank($laundry_id,"Laundry Id");
			is_blank($laundry_name,"Name");

			is_blank($gps_location,"GPS Location");
			is_blank($gps_lat,"Latitude");
			is_blank($gps_long,"Longitude");
			is_blank($country_id,"Country Id");

			is_laundry_not($laundry_id);
			is_country_not($country_id);

			$fields['vendor_name'] = $laundry_name;
			$fields['contact_person_name'] = $contact_person_name;
			$fields['vendor_lat'] = $gps_lat;
			$fields['vendor_long'] = $gps_long;
			$fields['vendor_display_address'] = $gps_location;
			$fields['vendor_gps_address'] = $gps_location;
			if(isset($_FILES['laundry_image']) && is_uploaded_file($_FILES['laundry_image']['tmp_name']))
			{
				$fields['vendor_image'] = saveImageFile('laundry_image','uploads/');
			}
			if(isset($_FILES['certificate_image']) && is_uploaded_file($_FILES['certificate_image']['tmp_name']))
			{
				$fields['vendor_registration_certificate'] = saveImageFile('certificate_image','uploads/');
			}
			if(isset($_FILES['id_image']) && is_uploaded_file($_FILES['id_image']['tmp_name']))
			{
				$fields['identity_card'] = saveImageFile('id_image','uploads/');
			}

			$fields['identity_card_number'] = post('id_number');
			$fields['device_token'] = post('device_token');
			$fields['loundry_info'] = post('loundry_info');
			$fields['country_id'] = post('country_id');

			$this->db->where(['id'=>$laundry_id])->update('loundry_list', $fields);
			$res['msg'] = "Laundry Update Successfully Done.";
			success_response($res);
		}


		public function change_laundry_password()
		{
			$laundry_id =post('laundry_id');
			$old_password =post('old_password');
			$new_password =post('new_password');

			is_blank($laundry_id,"Laundry id");
			is_blank($old_password,"Old Password");
			is_blank($new_password,"New Password");
			is_laundry_not($laundry_id);

			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`contact_password`='$old_password'");


			if ($query->num_rows() > 0)
			{
				$fields['contact_password'] = $new_password;
				$this->db->where(['id'=>$laundry_id])->update('loundry_list', $fields);
				$res['msg'] = "Laundry Password Update Successfully Done.";
				success_response($res);
			}
			else
			{
				$res = "Old Password Not match.";
				fail_response($res);
			}
		}

		public function laundry_rider_list()
		{
			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry id");
			is_laundry_not($laundry_id);
			$rider_status="0,1";
			$result_query =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`vendor_id`='$laundry_id' and `rider_listing`.rider_status IN($rider_status)");
			if($result_query->num_rows()>0){
				$category = $result_query->result_array();
				foreach ($category as $key => $rowinfo)
				{
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

						$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."");
				// 	echo "SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				// 	LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."";

			$rowlaundry = $laundry->row();
						$response2['currency_name'] 	= $rowlaundry->currency_name;
						$response2['currency_symbol'] 	= $rowlaundry->currency_symbol;

					$array2[] = $response2;
				}
				$result["rider_list"] = $array2;
				$result['msg'] = "Data found Successfully .";
				success_response($result);
			}
			else{
				$msg = "Data not found Successfully .";
				fail_response($msg);
			}

		}



		public function delete_banner($value='')
		{

			$banner_id =post('banner_id');
			is_blank($banner_id,"Banner Id");
			$data=$this->db->query("SELECT * FROM `loundry_banner` WHERE `loundry_banner`.`id`= '$banner_id'");

			if($data->num_rows()>0)
			{
				$this->db->delete('loundry_banner', array('id' => $banner_id));
				$msg['result'] = "Data Deleted Successfully .";
				success_response($msg);
				}else{
				$msg = "Data not found. .";
				fail_response($msg);
			}
		}

			public function delete_increase_decrease($value='')
		{

			$inc_id =post('inc_id');
			is_blank($inc_id,"Increase Descrease Id");
			$data=$this->db->query("SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`id`= '$inc_id'");

			if($data->num_rows()>0)
			{
				$this->db->delete('increase_decrease', array('id' => $inc_id));
				$msg['result'] = "Data Deleted Successfully .";
				success_response($msg);
				}else{
				$msg = "Data not found. .";
				fail_response($msg);
			}
		}


			public function delete_item($value='')
		{

			$item_id =post('item_id');
			is_blank($item_id,"Item Id");
			$data=$this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`= '$item_id'");


			if($data->num_rows()>0)
			{
				$this->db->query("SET foreign_key_checks = 0");
				$this->db->delete('loundry_item_list', array('id' => $item_id));
				$response2['msg'] = "Data Deleted Successfully .";
				success_response($response2);
				//$msg['result'] = "Data Deleted Successfully .";
				//success_response($msg);
				}else{
					$res = "Data not found.";
					fail_response($res);

			}
		}

		// 		banner

		public function add_banner()
		{
			$laundry_id =post('laundry_id');
			$sno =post('sno');

			is_blank($laundry_id,"Laundry id");
			is_blank($sno,"S.No.");
			is_laundry_not($laundry_id);

			$data=$this->db->query("SELECT * FROM `loundry_banner` WHERE `loundry_banner`.`vendor_id`= '$laundry_id'
			and `loundry_banner`.`sno`= '$sno'");
			if($data->num_rows()<=0)
			{
				$fields['vendor_id'] = $laundry_id;
				$fields['sno'] = $sno;
				$fields['banner_image'] = saveImageFile('banner_image','assets/images/');
				$this->db->insert('loundry_banner', $fields);

				$insert_id = $this->db->insert_id();
				if($insert_id!=null && $insert_id!=0)
				{
					$response2['msg'] = "Banner Added successfully.";
					success_response($response2);
				}
				else
				{
					$res = "Failled to add banner.";
					fail_response($res);
				}
			}
			else {
				$res = "This serial number already existed.";
				fail_response($res);
				// code...
			}



		}

		//banner end


		public function drop_order_by_vendor()
		{
			$vendor_id =post('vendor_id');
			$order_id =post('order_id');
			$drop_otp =post('drop_otp');

			is_blank(trim($vendor_id),"Vendor Id");
			is_laundry_not($vendor_id);
			is_blank(trim($order_id),"Order Id");
			is_blank(trim($drop_otp),"Drop Otp");

			$query = $this->db->query("SELECT * FROM `booking_list` WHERE  `booking_list`.`id`=$order_id");

			if ($query->num_rows()>0)
			{

				$query1 = $this->db->query("SELECT * FROM `booking_list` WHERE  `booking_list`.`id`=$order_id AND `booking_list`.`drop_otp`='$drop_otp'");

				if ($query1->num_rows()>0)
				{

					if($query1->row()->booking_status==8)
					{
						$msg = "Order already completed.";
						fail_response($msg);
					}
					else {



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


$company_commission=get_round($query1->row()->total_item_price*$rowlaundry->commission_percent/100,2);
$vendor_commission=$query1->row()->total_amt-$company_commission;


					if($skip_for_pay>0)
			{
				if($vendor_commission>$skip_for_pay)
				{
					$due_vendor_commission=$vendor_commission-$skip_for_pay;

					$fields5['wallet_balance'] = round(($rowlaundry->wallet_balance+$due_vendor_commission),2);
					$this->db->where(['id'=>$query1->row()->vendor_id])->update('loundry_list', $fields5);

					$data['vendor_id'] = $query1->row()->vendor_id;
						$data['amt'] = $due_vendor_commission;
						$data['type'] = "1";
						$data['remark'] = "You received cash ".$currency_symbol.$skip_for_pay.", from order id : #".$order_id." and Your commission in this booking is : ".$currency_symbol.$vendor_commission." and Due amount ".$currency_symbol.$due_vendor_commission." credited to your wallet.";
						$data['added_date'] = date("Y-m-d");
						$data['added_date_time'] = date("Y-m-d H:i:s");
						$data['status'] = "1";
						$data['booking_id'] =$query1->row()->id;

						$this->db->insert('wallet_transaction_partner', $data);
				}
				else 	if($vendor_commission<$skip_for_pay)
					{
						$extra_paid_cash=$skip_for_pay-$vendor_commission;

						$fields5['wallet_balance'] = round(($rowlaundry->wallet_balance-$extra_paid_cash),2);
						$this->db->where(['id'=>$query1->row()->vendor_id])->update('loundry_list', $fields5);

						$data['vendor_id'] = $query1->row()->vendor_id;
							$data['amt'] = $extra_paid_cash;
							$data['type'] = "0";
							$data['remark'] = "You received cash ".$currency_symbol.$skip_for_pay.", from order id : #".$order_id." and Your commission in this booking is : ".$currency_symbol.$vendor_commission." and Extra amount ".$currency_symbol.$extra_paid_cash." deducted from your wallet.";
							$data['added_date'] = date("Y-m-d");
							$data['added_date_time'] = date("Y-m-d H:i:s");
							$data['status'] = "1";
							$data['booking_id'] =$query1->row()->id;

							$this->db->insert('wallet_transaction_partner', $data);

					}
				else {
					$due_vendor_commission=$vendor_commission-$skip_for_pay;
					// code...
				}
				$fields['vendor_commission'] = $vendor_commission;
				$fields['company_commission'] = $company_commission;
				$fields['cash_received_by'] ="Vendor";
				$this->db->where(['id'=>$order_id])->update('booking_list', $fields);


			}
			else {

				$fields5['wallet_balance'] = round(($rowlaundry->wallet_balance+$vendor_commission),2);
				$this->db->where(['id'=>$query1->row()->vendor_id])->update('loundry_list', $fields5);

			  	$data['vendor_id'] = $query1->row()->vendor_id;
					$data['amt'] = $vendor_commission;
					$data['type'] = "1";
					$data['remark'] = "You commission ".$currency_symbol.$vendor_commission.", from order id : #".$order_id." has been credited to your wallet.";
					$data['added_date'] = date("Y-m-d");
					$data['added_date_time'] = date("Y-m-d H:i:s");
					$data['status'] = "1";
					$data['booking_id'] =$query1->row()->id;

					$this->db->insert('wallet_transaction_partner', $data);
			}



					$res['msg'] = "Order has been drop successfully.";

					$user_id=$query->row()->user_id;
					$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
					if($userData->num_rows()>0)
					{
						$device_token=$userData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							if($query1->row()->pickup_type=="Self")
							{
								send_notification_ul($device_token,"Order","Order Completed.","Your order id #".$order_id." Has been Completed successfully.",$order_id,"");
							}
							else {
								send_notification_ul($device_token,"Order","Order Delivered.","Your order id #".$order_id." Has been Delivered successfully.",$order_id,"");
							}
						}

					}


					$vender_id=$query->row()->vendor_id;
					$venderData = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$vender_id'");
					if($venderData->num_rows()>0)
					{
						$device_token=$venderData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							if($query1->row()->pickup_type=="Self")
							{
								send_notification_ul($device_token,"Order","Order completed.","Your order id #".$order_id." Has been self picked-up by customer.",$order_id,"");
							}
							else {
								send_notification_ul($device_token,"Order","Order delivered.","Your order id #".$order_id." Has been delivered by drop boy.",$order_id,"");
							}

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


public function send_to_bank($value='')
{

	$laundry_id =post('laundry_id');
	$amount =post('amount');
	is_blank($laundry_id,"Laundry id");
	is_laundry_not($laundry_id);

	$venderData = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='".$laundry_id."'");
	if($venderData->num_rows()>0)
	{
		$laundry = $this->db->query("SELECT `loundry_list`.*,
		`country_list`.`country_name` AS `country` ,`country_list`.`id` AS `country_id` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
		LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
	$rowlaundry = $laundry->row();
			//$res['currency_name'] 	= $rowlaundry->currency_name;
			$currency_symbol 	= $rowlaundry->currency_symbol;


// echo "wallet balance ".$venderData->row()->wallet_balance;
// echo " amount ".$amount;

		if($amount<=$venderData->row()->wallet_balance)
		{
			$fields5['wallet_balance'] = round(($venderData->row()->wallet_balance-$amount));
			$this->db->where(['id'=>$laundry_id])->update('loundry_list', $fields5);

			$data['vendor_id'] = $laundry_id;
				$data['amt'] = $amount;
				$data['type'] = "0";
				$data['remark'] = "Send to bank ".$currency_symbol.$amount.".";
				$data['added_date'] = date("Y-m-d");
				$data['added_date_time'] = date("Y-m-d H:i:s");
				$data['status'] = "1";
				$data['booking_id'] ="0";
				$data['is_send_to_bank'] ="1";
				$this->db->insert('wallet_transaction_partner', $data);
				$result['msg'] = "Send to bank amount request submitted successfully.";
				success_response($result);
		}
		else {
			$msg = "You don't have sufficient amount to send your bank.";
			fail_response($msg);
			// code...
		}

	}
	else {

		$msg = "Invalid laundry details.";
		fail_response($msg);

	}


}


		//get banner

		public function get_banner()
		{
			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry id");
			is_laundry_not($laundry_id);

			$result_query =  $this->db->query("SELECT * FROM `loundry_banner` where `loundry_banner`.`vendor_id`='$laundry_id' order by sno asc ");
			if($result_query->num_rows()>0){
				$category = $result_query->result_array();
				foreach ($category as $key => $rowinfo)
				{
					$response2['banner_id'] 	= $rowinfo['id'];
					$response2['banner_image'] 	= base_url()."assets/images/".$rowinfo['banner_image'];
					$response2['sno'] 	= $rowinfo['sno'];
					$array2[] = $response2;
				}
				$result["banner_list"] = $array2;
				$result['msg'] = "Data found Successfully .";
				success_response($result);
			}
			else{
				$msg = "Data not found Successfully .";
				fail_response($msg);
			}

		}

		//get banner


		public function rider_reg()
		{
			$laundry_id =post('laundry_id');
			$rider_name =post('rider_name');
			$mobile_no =post('mobile_no');
			$password =post('password');
			$email_id =post('email_id');
			$permanant_address =post('permanant_address');
			$id_card_no =post('id_card_no');

			is_blank($laundry_id,"Laundry id");
			is_blank($rider_name,"Rider Name");
			is_blank($mobile_no,"Mobile Number");
			is_blank($password,"Password");
			is_blank($email_id,"Email Id");
			is_blank($permanant_address,"Address");
			is_blank($id_card_no,"Card No");

			is_laundry_not($laundry_id);
			is_rider_mobile($mobile_no);
			is_rider_email($email_id);

			$fields['rider_name'] = $rider_name;
			$fields['rider_mobile_no'] = $mobile_no;
			$fields['rider_email_id'] = $email_id;
			$fields['rider_password'] = $password;
			$fields['rider_confirm_password'] = $password;
			$fields['rider_permanant_address'] = $permanant_address;
			$fields['rider_identy_card_no'] = $id_card_no;
			$fields['rider_identy_card_photo'] = saveImageFile('id_card_image','uploads/');
			$fields['rider_photo'] = saveImageFile('rider_image','uploads/');
			$fields['vendor_id'] = $laundry_id;
			$fields['rider_status'] = 0;
			$fields['rider_added_date_time'] = date("Y-m-d H:i:s");
			$fields['wallet_balance'] = 0;


			$this->db->insert('rider_listing', $fields);

			$insert_id = $this->db->insert_id();
			if($insert_id!=null && $insert_id!=0)
			{

				$rowinfo =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$insert_id' ")->row_array();
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
				$response2['msg'] = "Rider Successfully registered.";
				success_response($response2);
			}
			else
			{
				$res = "Failled to Rider registeration.";
				fail_response($res);
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
	public  function add_item_to_bucket($value='')
{
	$bucket_id =post('bucket_id');
	$item_id =post('item_id');
	$item_qty =post('item_qty');

	$increased_product=0;
	$increased_product_type="Fixed";
	$increased_product_operation="plus";
	$apon="Products";
	is_blank($bucket_id,"Bucket Id");

	$querybucket= $this->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`id`=".$bucket_id." AND `booking_list_item`.`is_type_bucket`=1");
	if($querybucket->num_rows() > 0)
	{
	$row_bucket=$querybucket->row();

	$querybooking= $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`id`=".$row_bucket->booking_id);
	if($querybooking->num_rows() > 0)
	{
			$row_booking=$querybooking->row();
$apon="Products";
				$inc_prod = $this->db->query("SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$row_booking->vendor_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".date("Y-m-d H:i:s")."' AND `increase_decrease`.`to_date_time`>='".date("Y-m-d H:i:s")."'");
				if($inc_prod->num_rows() > 0)
				{
				$increased_product=$inc_prod->row()->amount;
				$increased_product_type=$inc_prod->row()->amount_type;
				$increased_product_operation=$inc_prod->row()->increase_decrease;
				}

//--Add item
$prod_data = $this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`=".$item_id." AND `loundry_item_list`.`status`=1");
if($prod_data->num_rows() > 0)
{
	$item_price=$prod_data->row()->item_offer_price;
	$mrp=$prod_data->row()->item_price;
	if($increased_product>0)
	{
	$item_price=get_amount_inc($item_price,$increased_product_operation,$increased_product,$increased_product_type);
	$mrp=get_amount_inc($mrp,$increased_product_operation,$increased_product,$increased_product_type);
	}

	$text_amount = $item_qty * (($item_price * $prod_data->row()->tax)/100);
	$total_amt = $text_amount + ($item_qty*$item_price);
	$prod_fields['booking_id'] = $row_booking->id;
	$prod_fields['item_id'] = $prod_data->row()->id;
	$prod_fields['item_name'] = $prod_data->row()->item_name;
	$prod_fields['unit_id'] = $prod_data->row()->unit_id;
	$prod_fields['unit_name'] = $prod_data->row()->unit_name;
	$prod_fields['country_id'] = $prod_data->row()->country_id;
	$prod_fields['item_description'] = $prod_data->row()->item_description;
	$prod_fields['price'] = $mrp;
	$prod_fields['offer_price'] = $item_price;
	$prod_fields['qty'] = $item_qty;
	$prod_fields['total_amount'] = ($item_price*$item_qty);
	$prod_fields['is_type_bucket'] = "0";
	$prod_fields['bucket_id'] =$bucket_id;
	$prod_fields['inc_amount'] = $increased_product;
	$prod_fields['inc_type'] = $increased_product_type;
	$prod_fields['inc_operation'] = $increased_product_operation;
	$prod_fields['category_name'] = "";
	//$prod_fields['category_id'] = intval(trim($prod_data->row()->category_id));
	$prod_fields['category_id'] = $prod_data->row()->category_id;
	$prod_fields['added_date_time'] = date("Y-m-d H:i:s");;
	$prod_fields['tax_percent'] = $prod_data->row()->tax;
	$prod_fields['tax_amt'] = $text_amount;
	$this->db->insert('booking_list_item', $prod_fields);
	$status=getUpdatebooking($row_booking->id);
	if($status)
	{
		$response2['msg'] = "Added item successfully";
		success_response($response2);

	}
	else {
		// code...
		$res = "Booking not updated.";
		fail_response($res);
	}
}
else {
	// code...
	$res = "Selected item not found.";
	fail_response($res);

}
//--Add Item

}
else {
	// code..
	$res = "Booking not found.";
	fail_response($res);

}

				}
				else {
					// code...
					$res = "This is not valid bucket.";
					fail_response($res);

				}

}



	public  function delete_bucket_item($value='')
	{
	$bucket_id =post('bucket_id');
	$id =post('id');
	is_blank($bucket_id,"Bucket Id");

	$querybucket= $this->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`id`=".$bucket_id." AND `booking_list_item`.`is_type_bucket`=1");
	if($querybucket->num_rows() > 0)
	{
	$row_bucket=$querybucket->row();

	$querybooking= $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`id`=".$row_bucket->booking_id);
	if($querybooking->num_rows() > 0)
	{
			$row_booking=$querybooking->row();
	//--Add item
	$prod_data = $this->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`id`=".$id."");
	if($prod_data->num_rows() > 0)
	{
	$this->db->delete('booking_list_item', array('id' => $id));
	$status=getUpdatebooking($row_booking->id);
	if($status)
	{
		$response2['msg'] = "Item deleted successfully.";
		success_response($response2);

	}
	else {
		// code...
		$res = "Booking not updated.";
		fail_response($res);
	}
	}
	else {
	// code...
	$res = "Item not found in bucket.";
	fail_response($res);

	}
	//--Add Item

	}
	else {
	// code..
	$res = "Booking not found.";
	fail_response($res);

	}

				}
				else {
					// code...
					$res = "This is not valid bucket.";
					fail_response($res);

				}

	}

public  function update_item_to_bucket($value='')
{
$bucket_id =post('bucket_id');
$id =post('id');
$item_qty =post('item_qty');

$increased_product=0;
$increased_product_type="Fixed";
$increased_product_operation="plus";
$apon="Products";
is_blank($bucket_id,"Bucket Id");

$querybucket= $this->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`id`=".$bucket_id." AND `booking_list_item`.`is_type_bucket`=1");
if($querybucket->num_rows() > 0)
{
$row_bucket=$querybucket->row();

$querybooking= $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`id`=".$row_bucket->booking_id);
if($querybooking->num_rows() > 0)
{
		$row_booking=$querybooking->row();
//--Add item
$prod_data = $this->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`id`=".$id."");
if($prod_data->num_rows() > 0)
{
$item_price=$prod_data->row()->offer_price;
$mrp=$prod_data->row()->price;

$text_amount = $item_qty * (($item_price * $prod_data->row()->tax_percent)/100);
$total_amt = $text_amount + ($item_qty*$item_price);
$prod_fields['booking_id'] = $row_booking->id;
$prod_fields['price'] = $mrp;
$prod_fields['offer_price'] = $item_price;
$prod_fields['qty'] = $item_qty;
$prod_fields['total_amount'] = ($item_price*$item_qty);
$prod_fields['is_type_bucket'] = "0";
$prod_fields['added_date_time'] = date("Y-m-d H:i:s");;
$prod_fields['tax_percent'] = $prod_data->row()->tax_percent;
$prod_fields['tax_amt'] = $text_amount;
$this->db->where(['id'=>$id])->update('booking_list_item', $prod_fields);
$status=getUpdatebooking($row_booking->id);
if($status)
{
	$response2['msg'] = "Updaed item successfully";
	success_response($response2);

}
else {
	// code...
	$res = "Booking not updated.";
	fail_response($res);
}
}
else {
// code...
$res = "Selected item not found.";
fail_response($res);

}
//--Add Item

}
else {
// code..
$res = "Booking not found.";
fail_response($res);

}

			}
			else {
				// code...
				$res = "This is not valid bucket.";
				fail_response($res);

			}

}



		public function get_rider_data()
		{
			$rider_id =post('rider_id');
			is_blank($rider_id,"Rider id");
			is_rider_not($rider_id);

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

				$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."");
				// 	echo "SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				// 	LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."";

			$rowlaundry = $laundry->row();
						$response2['currency_name'] 	= $rowlaundry->currency_name;
						$response2['currency_symbol'] 	= $rowlaundry->currency_symbol;
			$response2['msg'] = "Rider Data Successfully.";
			success_response($response2);
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
				// 	echo "SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				// 	LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."";

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


		public function laundry_wallet_transaction()
		{
			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
			$productarray=[];
			$categorys = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id'");
			if ($categorys->num_rows() > 0)
			{
			$rowrider = $categorys->row();
				$res['wallet_balance'] =$rowrider->wallet_balance;

					$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowrider->id."");
				// 	echo "SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				// 	LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."";

			$rowlaundry = $laundry->row();
						$res['currency_name'] 	= $rowlaundry->currency_name;
						$res['currency_symbol'] 	= $rowlaundry->currency_symbol;



				$products = $this->db->query("SELECT * from wallet_transaction_partner WHERE `wallet_transaction_partner`.`vendor_id`=".$laundry_id." order by id desc");



				if($products->num_rows()>0)
				{
					foreach ($products->result_array() as $key => $product)
					{
						$productres['transaction_id'] 	= $product['id'];
						$productres['amt'] 	= $product['amt'];
						$productres['currency_symbol'] 	= $rowlaundry->currency_symbol;
						if($product['type']=="1")
						{
							$productres['operation_wallet'] 	= "Credit";
						}
						else {
							$productres['operation_wallet'] 	= "Debit";
							// code...
						}
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
						$res['msg'] = "Transaction data not foud.";
			$res["transaction_list"] = [];
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



		public function contact_by_laundry()
		{
			$laundry_id =post('laundry_id');
			$full_name =post('full_name');
			$mobile_number =post('mobile_number');
			$email_id =post('email_id');
			$remark =post('remark');
			is_blank($laundry_id,"Laundry Id");
			is_laundry_not($laundry_id);
			is_blank($full_name,"Full Name");
			is_blank($mobile_number,"Mobile Number");
			is_blank($email_id,"Email id");
			is_blank($remark,"Remark");

			$fields['name'] = $full_name;
			$fields['mobile_number'] = $mobile_number;
			$fields['email_id'] = $email_id;
			$fields['support_remark'] = $remark;
			$fields['sender_id'] = $laundry_id;
			$fields['sender_type'] = "2";
			$fields['status'] = "1";

			$this->db->insert('support', $fields);


			$insert_id = $this->db->insert_id();
			if($insert_id!=null && $insert_id!=0)
			{

				$res['remark'] = $remark;
				$res['msg'] = "Message send successfully.";
				success_response($res);
			}
			else
			{
				$res = "Failled to insert.";
				fail_response($res);
			}
		}


		public function order_status_list()
		{

			$category =  $this->db->query("SELECT * FROM `booking_status` ")->result_Array();
			foreach ($category as $key => $rowinfo)
			{
				$response2['status'] 	= $rowinfo['type_id'];
				$response2['status_name'] 	= $rowinfo['type'];

				$array2[] = $response2;
			}
			$result["status_list"] = $array2;
			$result['msg'] = "Data found Successfully .";
			success_response($result);
		}



		public function laundry_order_list()
		{


			$laundry_id =post('laundry_id');
			$order_status =post('order_status');
			is_blank(trim($laundry_id),"Laundry Id");
			is_laundry_not($laundry_id);
			$add_query ='';
			if (post('order_status')!="")
			{
				$add_query = $add_query." AND `all_booking`.`booking_status` In(". $order_status.")";
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
			//	echo "SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` =". $laundry_id ."".$add_query."";
			//	return;
			$query=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` =". $laundry_id ."".$add_query."");
			$total_cash=0;
			$total_order1=$query->num_rows();
			$array=[];
			foreach ($query->result_array() as $key => $rowinfo)
			{
			   // $total_order++;


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
				$response['pickup_time_slot_label'] = date('D d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				$querybk=$this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`id` =".$rowinfo['id']."");
			$arrbk=	$querybk->row();
					$response['pickup_time_slot_label'] = date('D d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				if($arrbk->pickup_time_to!="00:00:00")
				{
				$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($arrbk->pickup_time))." To ".date('h:i A', strtotime($arrbk->pickup_time_to));
				}
				else
				{
    				$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($arrbk->pickup_time));
				}
				$response['pickup_time_org'] 	= $rowinfo['pickup_time_org'];
				$response['placed_time'] = $rowinfo['placed_time'];
				$response['confirm_time'] = $rowinfo['confirm_time'];
				$response['allot_for_pickup_time'] = $rowinfo['allot_for_pickup_time'];
				$response['picked_up_time'] = $rowinfo['picked_up_time'];
				$response['received_at_loundry_time'] = $rowinfo['received_at_loundry_time'];
				$response['in_process_time'] = $rowinfo['in_process_time'];
				$response['order_ready_time'] = $rowinfo['order_ready_time'];
				$response['allot_for_drop_time'] = $rowinfo['allot_for_drop_time'];
				$response['drop_time'] = date('D d-m-Y h:i a', strtotime($rowinfo['drop_time']));
				$response['drop_date'] =date('d-m-Y', strtotime( $rowinfo['drop_time']));
				$response['process'] = "Dropped";


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
				$total_cash=$total_cash+ $rowinfo['skip_for_pay'];
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
							$response['pickup_type'] = $arrbk->pickup_type;
							$response['service_type'] = $arrbk->service_type;
							$response['drop_slot_time_org'] = date('D d-m-Y h:i a', strtotime($arrbk->drop_slot_time_org));
							$response['drop_slot_date'] =date('d-m-Y', strtotime( $arrbk->drop_slot_date));
							$response['drop_time_slot_label'] =date('d-m-Y', strtotime($arrbk->drop_slot_date))." ".$arrbk->drop_time_slot_label;




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
						$productres['is_type_bucket'] 	= $product['is_type_bucket'];
						$productres['total_item'] 	= "3";

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

			$result["total_cash"] = get_round($total_cash,2);
			$result["total_order"] = $total_order1;
			$result["order_list"] = $array;
			$result['msg'] = "Order List Done.";

			success_response($result);
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
				$response['pickup_time_slot_label'] = date('D d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				$querybk=$this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`id` =".$rowinfo['id']."");
			$arrbk=	$querybk->row();
					$response['pickup_time_slot_label'] = date('D d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				if($arrbk->pickup_time_to!="00:00:00")
				{
				$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($arrbk->pickup_time))." To ".date('h:i A', strtotime($arrbk->pickup_time_to));
				}
				else
				{
    				$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($arrbk->pickup_time));
				}
				$response['pickup_time_org'] 	= $rowinfo['pickup_time_org'];
				$response['placed_time'] = $rowinfo['placed_time'];
				$response['delivery_label'] = "Applicable Delivery Charge";

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
				$querybk = $this->db->query("SELECT * from booking_list where id='".$rowinfo['id']."'");

					$response['delivery_charge'] = $querybk->row()->delivery_charge;
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
				$response['pickup_type'] = $arrbk->pickup_type;
				$response['service_type'] = $arrbk->service_type;
				$response['drop_slot_time_org'] = date('D d-m-Y h:i a', strtotime($arrbk->drop_slot_time_org));
				$response['drop_slot_date'] =date('d-m-Y', strtotime( $arrbk->drop_slot_date));
				$response['drop_time_slot_label'] =date('d-m-Y', strtotime($arrbk->drop_slot_date))." ".$arrbk->drop_time_slot_label;



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
$bucket_id="0";
				$products = $this->db->query("SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` AS `item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id`= `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id`=".$rowinfo['id']." AND `booking_list_item`.`bucket_id`=".$bucket_id."");

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
						$productres['category_name'] 	= $product['category_name'];
						$productres['category_id'] 	= $product['category_id'];
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


						$productres['tax_percent'] 	= $product['tax_percent'];
						$productres['tax_amt'] 	= $product['tax_amt'];
						$productarray[] = $productres;
					}
				}

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



		public function cancel_order()
		{
			$laundry_id =post('laundry_id');
			$order_id =post('order_id');
			$cancel_reason =post('cancel_reason');
			is_blank(trim($laundry_id),"Laundry Id");
			is_laundry_not($laundry_id);
			is_blank(trim($order_id),"Order Id");
			//is_blank(trim($cancel_reason),"Cancel reason");

			$query = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`=$laundry_id AND `booking_list`.`id`=$order_id");

			if ($query->num_rows()>0)
			{
				$fields['cancelled_by_id'] = $laundry_id;
				$fields['cancellation_reason'] = $cancel_reason;
				$fields['cancelled_time'] = date("Y-m-d h:i:s");
				$fields['booking_status'] = 9;
				$this->db->where(['id'=>$order_id])->update('booking_list', $fields);

				$res['msg'] = "Order has been cancelled successfully.";
				$user_id=$query->row()->user_id;
				$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
				if($userData->num_rows()>0)
				{
					$device_token=$userData->row()->device_token;
					if($device_token!=null && $device_token!="")
					{
						send_notification_ul($device_token,"Order","Order Cancelled.","Your Order id #".$order_id." has been cancelled due to ".$cancel_reason.".",$order_id,"");
					}

				}

				success_response($res);

				}else{
				$msg = "Order data not found.";
				fail_response($msg);
			}
		}


		public function accept_order()
		{
			$laundry_id =post('laundry_id');
			$order_id =post('order_id');
			$cancel_reason =post('cancel_reason');
			is_blank(trim($laundry_id),"Laundry Id");
			is_laundry_not($laundry_id);
			is_blank(trim($order_id),"Order Id");

			$query = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`=$laundry_id AND `booking_list`.`id`=$order_id");

			if ($query->num_rows()>0)
			{
				$fields['confirm_time'] = date("Y-m-d h:i:s");
				$fields['booking_status'] = 1;
				$this->db->where(['id'=>$order_id])->update('booking_list', $fields);
				$res['msg'] = "Order has been confirm successfully and moved to upcoming pickups.";


				$user_id=$query->row()->user_id;
			//	echo "test0".$user_id;
				$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
				if($userData->num_rows()>0)
				{
				   // echo "test";
					$device_token=$userData->row()->device_token;
					if($device_token!=null && $device_token!="")
					{
					  //  echo "test2";
						send_notification_ul($device_token,"Order","Order Confirmed.","Your Order id #".$order_id." has been Confirmed",$order_id,"");
					}

				}
			//	echo "test3";
					success_response($res);

				}else{
				$msg = "Order data not found.";
				fail_response($msg);
			}
		}

		public function assign_order_to_rider()
		{
			$laundry_id =post('laundry_id');
			$order_id =post('order_id');
			$rider_id =post('rider_id');
			$assign_type =post('assign_type');

			is_blank(trim($laundry_id),"Laundry Id");
			is_blank(trim($rider_id),"Rider Id");
			is_blank(trim($order_id),"Order Id");
			is_blank(trim($assign_type),"Assign Type");
			is_laundry_not($laundry_id);
			is_rider_not($rider_id);
			is_laundry_rider($laundry_id,$rider_id);

			$query = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`=$laundry_id AND `booking_list`.`id`=$order_id");

			if ($query->num_rows()>0)
			{
				$rowinfo =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`=$rider_id ")->row_array();


				if ($assign_type==1) {
					$fields['confirm_time'] = date("Y-m-d h:i:s");
					$fields['booking_status'] = 2;

					$fields['pickup_boy_id'] 	= $rowinfo['id'];
					$fields['pickup_boy_name'] 	= $rowinfo['rider_name'];
					$fields['pickup_boy_number'] 	= $rowinfo['rider_mobile_no'];
					$this->db->where(['id'=>$order_id])->update('booking_list', $fields);
					$res['msg'] = $rowinfo['rider_name']." assign as pickup boy";

					$user_id=$query->row()->user_id;
					$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
					if($userData->num_rows()>0)
					{
						$device_token=$userData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							send_notification_ul($device_token,"Order","Pickup boy Assigned.","Pickup boy alloted to your order id #".$order_id." Pickup Boy Name : ".$rowinfo['rider_name'].", Mobile Number : ".$rowinfo['rider_mobile_no'],$order_id,"");
						}

					}

					$pickupboyid = $rowinfo['id'];

					$pickupboyData = $this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`id`='$pickupboyid'");
					if($pickupboyData->num_rows()>0)
					{
						$device_token=$pickupboyData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							send_notification_ul($device_token,"Order","New order assigned for pickup","New order id #".$order_id." has been assigned for pickup.",$order_id,"");
						}

					}


					success_response($res);
					}elseif ($assign_type==2) {
					$fields['allot_for_drop_time'] = date("Y-m-d h:i:s");
					$fields['booking_status'] = 7;
					$fields['drop_boy_id'] 	= $rowinfo['id'];
					$fields['drop_boy_name'] 	= $rowinfo['rider_name'];
					$fields['drop_boy_number'] 	= $rowinfo['rider_mobile_no'];

					$this->db->where(['id'=>$order_id])->update('booking_list', $fields);
					$res['msg'] = $rowinfo['rider_name']." assign as drop boy";

					$user_id=$query->row()->user_id;
					$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
					if($userData->num_rows()>0)
					{
						$device_token=$userData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							send_notification_ul($device_token,"Order","Drop boy Assigned.","Drop boy alloted to your order id #".$order_id." Drop Boy Name : ".$rowinfo['rider_name'].", Mobile Number : ".$rowinfo['rider_mobile_no'],$order_id,"");
						}

					}

						$pickupboyid = $rowinfo['id'];

					$pickupboyData = $this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`id`='$pickupboyid'");
					if($pickupboyData->num_rows()>0)
					{
						$device_token=$pickupboyData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							send_notification_ul($device_token,"Order","New order assigned for drop","New order id #".$order_id." has been assigned for drop.",$order_id,"");
						}

					}

					success_response($res);
					}else{
					$msg = "Assign type not found.";
					fail_response($msg);
				}


				}else{
				$msg = "Order data not found.";
				fail_response($msg);
			}
		}

		public function recived_order()
		{
			$laundry_id =post('laundry_id');
			$order_id =post('order_id');
			is_blank(trim($laundry_id),"Laundry Id");
			is_laundry_not($laundry_id);
			is_blank(trim($order_id),"Order Id");

			$query = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`=$laundry_id AND `booking_list`.`id`=$order_id");

			if ($query->num_rows()>0)
			{

				$fields['received_at_loundry_time'] = date("Y-m-d H:i:s");
				$fields['booking_status'] = 4;
				$this->db->where(['id'=>$order_id])->update('booking_list', $fields);
				$res['msg'] = "Order has been recived successfully and mooved to At Laundry Booking Tab.";

				$user_id=$query->row()->user_id;
				$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
				if($userData->num_rows()>0)
				{
					$device_token=$userData->row()->device_token;
					if($device_token!=null && $device_token!="")
					{
						send_notification_ul($device_token,"Order","Order received at Laundry.","Your order id #".$order_id." has been received at laundry",$order_id,"");
					}

				}
		$pickup_boy_id=$query->row()->pickup_boy_id;
					$venderData = $this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`id`='$pickup_boy_id'");
					if($venderData->num_rows()>0)
					{
						$device_token=$venderData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							send_notification_ul($device_token,"Order","Order Received at Loundry.","Your order id #".$order_id." Has been received by laundry successfully.",$order_id,"");
						}

					}

				success_response($res);


				}else{
				$msg = "Order data not found.";
				fail_response($msg);
			}
		}



			public function rider_wallet_add()
		{
			$laundry_id =post('laundry_id');

			$amt =post('amt');
			$rider_id =post('rider_id');
			$transaction_operation =post('transaction_operation');
			$remark =post('remark');
			is_blank($laundry_id,"Laundry Id");
			is_blank($rider_id,"Rider Id");
			is_blank($amt,"Amount");
			is_blank($transaction_operation,"Operation");
			is_blank($remark,"Remark");
			is_laundry_not($laundry_id);
				$rowinforiderq =  $this->db->query("SELECT * FROM `rider_listing` where `rider_listing`.`id`='$rider_id' ");
			if($rowinforiderq->num_rows()>0)
				{
				 $rowinforider=   $rowinforiderq->row_array();
				    	$response2['rider_id'] 	= $rowinforider['wallet_balance'];

			if($transaction_operation=="plus")
			{
			$fields['wallet_balance'] = round(($rowinforider['wallet_balance']+$amt),2);
			}
			else
			{
			    	$fields['wallet_balance'] = round(($rowinforider['wallet_balance']-$amt),2);
			}

			$this->db->where(['id'=>$rider_id])->update('rider_listing', $fields);

			     $data['rider_id'] = $rider_id;
				$data['amt'] = $amt;
				$data['transaction_operation'] = $transaction_operation;
				$data['remark'] = $remark;
				$data['added_date'] = date("Y-m-d");
				$data['added_date_time'] = date("Y-m-d H:i:s");
				$data['status'] = "1";

				$this->db->insert('wallet_transaction_rider', $data);


			$res['msg'] = "Amount updated successfully.";
			success_response($res);
				}







		}



		public function update_order_status()
		{
			$laundry_id =post('laundry_id');
			$order_id =post('order_id');
			$order_status =post('order_status');
			is_blank(trim($laundry_id),"Laundry Id");
			is_laundry_not($laundry_id);
			is_blank(trim($order_id),"Order Id");

			$query = $this->db->query("SELECT * FROM `booking_list` WHERE `booking_list`.`vendor_id`=$laundry_id AND `booking_list`.`id`=$order_id");

			if ($query->num_rows()>0)
			{
			$row_booking=$query->row();
				if($order_status=="5")
				{
					$fields['in_process_time'] = date("Y-m-d H:i:s");
					$fields['booking_status'] = 5;
					$this->db->where(['id'=>$order_id])->update('booking_list', $fields);
					$res['msg'] = "Order updated as inprocess successfully.";

					$user_id=$query->row()->user_id;
					$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
					if($userData->num_rows()>0)
					{
						$device_token=$userData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							send_notification_ul($device_token,"Order","Order Inprocess.","Your order id #".$order_id." Inprocess.",$order_id,"");
						}

					}


					success_response($res);

				}
				else if($order_status=="6")
				{
					$fields['order_ready_time'] = date("Y-m-d H:i:s");
					$fields['booking_status'] = 6;
					$this->db->where(['id'=>$order_id])->update('booking_list', $fields);
					$res['msg'] = "Order updated as Order Ready successfully and mooved to Upcoming drops Booking Tab.";

					$user_id=$query->row()->user_id;
					$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
					if($userData->num_rows()>0)
					{
						$device_token=$userData->row()->device_token;
						if($device_token!=null && $device_token!="")
						{
							if($row_booking->pickup_type=="Self")
							{
								send_notification_ul($device_token,"Order","Order Ready.","Your order id #".$order_id." Has been ready to self pickup.",$order_id,"");
							}
							else {
								send_notification_ul($device_token,"Order","Order Ready.","Your order id #".$order_id." Has been ready to deliver.",$order_id,"");
							}
						}

					}
					success_response($res);

				}
				else
				{
					$msg = "Invalid status";
					fail_response($msg);
				}

				}else{
				$msg = "Order data not found.";
				fail_response($msg);
			}
		}


		public function laundry_days()
		{


			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
			is_laundry_not($laundry_id);
			$laundry_dates=$this->db->query("SELECT `loundry_day_list`.*,`day_list`.`day_name` as day,`day_list`.`day_no` FROM `loundry_day_list` LEFT JOIN `day_list` ON `loundry_day_list`.`day_id`=day_list.`id` WHERE `loundry_day_list`.`vendor_id`= '$laundry_id' ORDER BY `loundry_day_list`.`sno` ASC");

			$array1 = [];
			if ($laundry_dates->num_rows()>0) {


				foreach ($laundry_dates->result_array() as $key => $laundry_date)
				{
					$response1['laundry_day_id'] 	= $laundry_date['id'];
					$response1['day_name'] 	= $laundry_date['day_name'];
					$response1['open_time'] 	= $laundry_date['open_time'];
					$response1['closing_time'] 	= $laundry_date['close_time'];


					$response1['open_time_display'] 	= date('h:i A', strtotime($laundry_date['open_time']));
					$response1['closing_time_display'] 	= date('h:i A', strtotime($laundry_date['close_time']));

					$response1['status'] 	= $laundry_date['status'];
					$response1['status_type'] 	= ($laundry_date['status']==1)?"OPEN":"CLOSE";
					$response1['day_number'] 	= $laundry_date['day_no'];
					$array1[] = $response1;
				}
			}


			$result["laundry_days"] = $array1;
			$result['msg'] = "Data found Successfully .";
			success_response($result);

		}


		public function day_list($value='')
		{

			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
			is_laundry_not($laundry_id);

			$dates=$this->db->query("SELECT * FROM `day_list` WHERE `day_list`.`id` NOT IN (SELECT `loundry_day_list`.`day_id` FROM `loundry_day_list` WHERE `loundry_day_list`.`vendor_id`= '$laundry_id')");
			$array1 = [];
			if ($dates->num_rows()>0) {

				foreach ($dates->result_array() as $key => $laundry_date)
				{
					$response1['day_id'] 	= $laundry_date['id'];
					$response1['day_name'] 	= $laundry_date['day_name'];
					$response1['day_number'] 	= $laundry_date['day_no'];
					$array1[] = $response1;
				}
			}


			$result["remaning_day_list"] = $array1;
			$result['msg'] = "Data found Successfully .";
			success_response($result);
		}

		public function add_laundry_day($value='')
		{

			$laundry_id =post('laundry_id');
			$day_id =post('day_id');
			$open_time =post('open_time');
			$close_time =post('close_time');
			$status =post('status');
			is_blank($laundry_id,"Laundry Id");
			is_blank($day_id,"Day Id");
			is_blank($open_time,"Open Time");
			is_blank($close_time,"Close Time");

			is_laundry_not($laundry_id);
			is_day_not($day_id);


			$querys =$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`day_id`='$day_id' AND `loundry_day_list`.`vendor_id`= '$laundry_id'");

			if ($querys->num_rows()>0) {
				$res = "Day alredy to inserted in laundry.";
				fail_response($res);

			}
			else
			{
				$laundry=$this->db->query("SELECT * FROM `day_list` WHERE `day_list`.`id` = '$day_id'");
				$data['vendor_id'] = $laundry_id;
				$data['day_id'] = $day_id;
				$data['open_time'] = $open_time;
				$data['close_time'] = $close_time;
				$data['status'] = $status;
				$data['sno'] = $laundry->row()->day_no;
				$data['day_name'] = $laundry->row()->day_name;
				$this->db->insert('loundry_day_list', $data);
				$insert_id = $this->db->insert_id();
				if($insert_id!=null && $insert_id!=0)
				{

					$msg['result'] = "Date inserted Successfully .";
					success_response($msg);
					}else{
					$msg = "Date not inserted. .";
					fail_response($msg);
				}
			}

		}

		public function update_laundry_day($value='')
		{


			$laundry_day_id =post('laundry_day_id');
			$open_time =post('open_time');
			$close_time =post('close_time');
			$status =post('status');

			is_blank($laundry_day_id,"Laundry Day Id");
			is_blank($open_time,"Open Time");
			is_blank($close_time,"Close Time");
			is_laundry_day_not($laundry_day_id);


			$data1['open_time'] =$open_time;
			$data1['close_time'] =$close_time;
			$data1['status'] =$status;

			$this->db->where(['id'=>$laundry_day_id])->update('loundry_day_list', $data1);
			$msg['result'] = "Date update Successfully .";
			success_response($msg);
		}

		public function change_laundry_day_status($value='')
		{


			$laundry_day_id =post('laundry_day_id');
			$status =post('status');
			$close_time =post('close_time');

			is_blank($laundry_day_id,"Laundry Day Id");
			is_blank($status,"Status");
			is_laundry_day_not($laundry_day_id);
			if ($status==0) {
				$data1['status'] =$status;
				$this->db->where(['id'=>$laundry_day_id])->update('loundry_day_list', $data1);
				$msg['result'] = "Laundry Close Successfully .";
				success_response($msg);
				}elseif($status==1){
				$data1['status'] =$status;
				$this->db->where(['id'=>$laundry_day_id])->update('loundry_day_list', $data1);
				$msg['result'] = "Laundry Open Successfully .";
				success_response($msg);
				}else{
				$res = "Status can't be change.";
				fail_response($res);
			}

		}


		public function get_laundry_time_slot($value='')
		{
			$laundry_day_id =post('laundry_day_id');
			is_blank($laundry_day_id,"Laundry Day Id");
			is_laundry_day_not($laundry_day_id);

			$data=$this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`day_id`= $laundry_day_id");
			if ($data->num_rows()>0) {
				$array1 = [];
				foreach ($data->result_array() as $key => $laundry_date)
				{
					$response1['time_slot_id'] 	= $laundry_date['id'];
					$response1['day_name'] 	= $laundry_date['day_name'];
					$response1['day_sno'] 	= $laundry_date['day_sno'];
					$response1['org_slot_time'] 	= $laundry_date['org_slot_time'];
					$response1['display_slot_time'] 	= $laundry_date['display_slot_time'];

					$response1['org_time_slot_to'] 	= $laundry_date['org_time_slot_to'];
					$response1['display_time_slot_to'] 	= $laundry_date['display_time_slot_to'];
					$response1['timeslot_label'] 	= $laundry_date['display_slot_time']." To ".$laundry_date['display_time_slot_to'];

					$array1[] = $response1;
				}

				$result["day_time_slots"] = $array1;
				$result['msg'] = "Data found Successfully .";
				success_response($result);
				}else{
				$res = "Time Slot not found.";
				fail_response($res);
			}
		}

		public function add_time_slot_in_day($value='')
		{
			$laundry_day_id =post('laundry_day_id');
			$time_slot =post('time_slot');
			$time_slot_to =post('time_slot_to');
			is_blank($laundry_day_id,"Laundry Day Id");
			is_blank($time_slot,"Time Slot");
			is_laundry_day_not($laundry_day_id);

			$data=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`id`= '$laundry_day_id'");
			$data1['vendor_id'] =$data->row()->vendor_id;
			$data1['day_id'] =$data->row()->id;
			$data1['day_sno'] =$data->row()->sno;
			$data1['day_name'] =$data->row()->day_name;
			$data1['org_slot_time'] =$time_slot;
			$data1['display_slot_time'] =date("g:i A", strtotime($time_slot));
			$data1['org_time_slot_to'] =$time_slot_to;
			$data1['display_time_slot_to'] =date("g:i A", strtotime($time_slot_to));

			$this->db->insert('loundry_time_list', $data1);
			$insert_id = $this->db->insert_id();
			if($insert_id!=null && $insert_id!=0)
			{
				$msg['result'] = "Date inserted Successfully .";
				success_response($msg);
				}else{
				$msg = "Date not inserted. .";
				fail_response($msg);
			}
		}

		public function delete_time_slot($value='')
		{

			$time_slot_id =post('time_slot_id');
			is_blank($time_slot_id,"Time Slot Id");
			$data=$this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`id`= '$time_slot_id'");

			if($data->num_rows()>0)
			{
				$this->db->delete('loundry_time_list', array('id' => $time_slot_id));
				$msg['result'] = "Date Deleted Successfully .";
				success_response($msg);
				}else{
				$msg = "Date not found. .";
				fail_response($msg);
			}
		}


		public function delete_rider($value='')
		{

			$rider_id =post('rider_id');
			is_blank($rider_id,"Rider Id");
			$data=$this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`id`= '$rider_id'");

			if($data->num_rows()>0)
			{

				$fields['rider_status'] = "2";
				$this->db->where(['id'=>$rider_id])->update('rider_listing', $fields);

				$msg['result'] = "Data Deleted Successfully .";
				success_response($msg);
				}else{
				$msg = "Data not found. .";
				fail_response($msg);
			}
		}



			public function get_category_and_unit($value='')
		{
			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
			is_laundry_not($laundry_id);

			$data=$this->db->query("SELECT * FROM `category` WHERE `category`.`status`='1'");
		//	echo "SELECT * FROM `category` WHERE `category`.`status`='1'";
		//	return;
			if ($data->num_rows()>0) {
				$array1 = [];
				foreach ($data->result_array() as $key => $laundry_date)
				{
					$response1['id'] 	= $laundry_date['id'];
					$response1['cat_name'] 	= $laundry_date['name'];
					$array1[] = $response1;
				}

				$result["category_list"] = $array1;

				}
				else
				{
				 $result["category_list"] = [];
				}


						$data=$this->db->query("SELECT * FROM `category` WHERE `category`.`status`='1' and `category`.`is_display_to_bucket`='1'");
		//	echo "SELECT * FROM `category` WHERE `category`.`status`='1'";
		//	return;
			if ($data->num_rows()>0) {
				$array1 = [];
				foreach ($data->result_array() as $key => $laundry_date)
				{
					$response1['id'] 	= $laundry_date['id'];
					$response1['cat_name'] 	= $laundry_date['name'];
					$array1[] = $response1;
				}

				$result["category_list_bucket"] = $array1;

				}
				else
				{
				 $result["category_list_bucket"] = [];
				}


					$data=$this->db->query("SELECT * FROM `unit_table` where type=1");
			if ($data->num_rows()>0) {
				$array1 = [];
				foreach ($data->result_array() as $key => $laundry_date)
				{
					$response1['id'] 	= $laundry_date['id'];
					$response1['unit_name'] 	= $laundry_date['unit_name'];
					$array1[] = $response1;
				}

				$result["unit_list"] = $array1;

				}
				else
				{
				 $result["unit_list"] = [];
				}

				$result['msg'] = "Data found Successfully .";
				success_response($result);

		}


				public function add_product($value='')
		{
			$laundry_id =post('laundry_id');
			$category_id =post('category_id');
			$unit_id =post('unit_id');
			$is_type_bucket=post('is_type_bucket');

			is_blank($laundry_id,"Laundry Id");
			is_blank($category_id,"Category Id");
			is_blank($unit_id,"Unit Id");

			is_laundry_not($laundry_id);
			if($is_type_bucket=="1")
			{
			    $unit_id="3";
			}

				$laundry = $this->db->query("SELECT `loundry_list`.*,
					`country_list`.`country_name` AS `country` ,`country_list`.`id` AS `country_id` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
			$rowlaundry = $laundry->row();
						$res['currency_name'] 	= $rowlaundry->currency_name;
						$res['currency_symbol'] 	= $rowlaundry->currency_symbol;

				$query_cat = $this->db->query("SELECT * FROM `category`  WHERE `category`.`id`=".$category_id."");
			$rowquery = $query_cat->row();

				$query_unit = $this->db->query("SELECT * FROM `unit_table`  WHERE `unit_table`.`id`=".$unit_id."");
			$rowunit = $query_unit->row();


			$data1['item_name'] =post('item_name');
			$data1['item_price'] =post('item_price');
			$data1['item_offer_price'] =post('item_offer_price');
			$data1['is_type_bucket'] =$is_type_bucket;

			$data1['tax'] =post('tax');
			$data1['item_description'] =post('item_description');
			$data1['item_image'] =saveImageFile('item_image','uploads/');
			$data1['vendor_id'] =$laundry_id;
			$data1['category_id'] =$rowquery->id;
			$data1['status'] =post('status');
			$data1['unit_id'] =$rowunit->id;
			$data1['unit_name'] =$rowunit->unit_name;
			$data1['country_id'] =$rowlaundry->country_id;
			$data1['added_date_time'] =date("Y-m-d H:i:s");

			$this->db->insert('loundry_item_list', $data1);
			$insert_id = $this->db->insert_id();
			if($insert_id!=null && $insert_id!=0)
			{
				$msg['result'] = "Date inserted Successfully .";
				success_response($msg);
				}else{
				$msg = "Date not inserted. .";
				fail_response($msg);
			}
		}


				public function add_increase_decrease($value='')
		{
			$laundry_id =post('laundry_id');
			$title=post('title');
			$increase_decrease=post('increase_decrease');
			$amount_type=post('amount_type');
			$amount=post('amount');
			$applicable_on=post('applicable_on');
			$from_date=post('from_date');
			$from_time=post('from_time');
			$to_date=post('to_date');
			$to_time=post('to_time');
			is_blank($laundry_id,"Laundry Id");
			is_blank($title,"Title");
			is_blank($increase_decrease,"Increase Descrease");
			is_blank($amount_type,"Amount Type");
			is_blank($amount,"Amount");
			is_blank($applicable_on,"Applicable on");
			is_blank($from_date,"From Date");
			is_blank($to_date,"To Date");
			is_blank($to_time,"To Time");
			is_laundry_not($laundry_id);

				$laundry = $this->db->query("SELECT `loundry_list`.*,
					`country_list`.`country_name` AS `country` ,`country_list`.`id` AS `country_id` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
			$rowlaundry = $laundry->row();
						$res['currency_name'] 	= $rowlaundry->currency_name;
						$res['currency_symbol'] 	= $rowlaundry->currency_symbol;


			$data1['title'] =$title;
			$data1['increase_decrease'] =$increase_decrease;
			$data1['amount_type'] =$amount_type;
			$data1['amount'] =$amount;
			$data1['applicable_on'] =$applicable_on;
			$data1['from_date'] =$from_date;
			$data1['from_time'] =$from_time;
			$data1['from_date_time'] =$from_date." ".$from_time;
			$data1['to_date'] =$to_date;
			$data1['to_time'] =$to_time;
			$data1['to_date_time'] =$to_date." ".$to_time;
			$data1['status'] ="1";
			$data1['vendor_id'] =$laundry_id;
			$data1['created_date_time'] =date("Y-m-d H:i:s");

			$this->db->insert('increase_decrease', $data1);
			$insert_id = $this->db->insert_id();
			if($insert_id!=null && $insert_id!=0)
			{
				$msg['result'] = "Date inserted Successfully .";
				success_response($msg);
				}else{
				$msg = "Date not inserted. .";
				fail_response($msg);
			}
		}


				public function update_increase_decrease($value='')
		{
			$laundry_id =post('laundry_id');
			$inc_id =post('inc_id');
			$title=post('title');
			$increase_decrease=post('increase_decrease');
			$amount_type=post('amount_type');
			$amount=post('amount');
			$applicable_on=post('applicable_on');
			$from_date=post('from_date');
			$from_time=post('from_time');
			$to_date=post('to_date');
			$to_time=post('to_time');
			$status=post('status');
			is_blank($laundry_id,"Laundry Id");
			is_blank($inc_id,"Increase Decrease Id");
			is_blank($status,"status");

			is_blank($title,"Title");
			is_blank($increase_decrease,"Increase Descrease");
			is_blank($amount_type,"Amount Type");
			is_blank($amount,"Amount");
			is_blank($applicable_on,"Applicable on");
			is_blank($from_date,"From Date");
			is_blank($to_date,"To Date");
			is_blank($to_time,"To Time");
			is_laundry_not($laundry_id);

				$laundry = $this->db->query("SELECT `loundry_list`.*,
					`country_list`.`country_name` AS `country` ,`country_list`.`id` AS `country_id` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
			$rowlaundry = $laundry->row();
						$res['currency_name'] 	= $rowlaundry->currency_name;
						$res['currency_symbol'] 	= $rowlaundry->currency_symbol;


			$data1['title'] =$title;
			$data1['increase_decrease'] =$increase_decrease;
			$data1['amount_type'] =$amount_type;
			$data1['amount'] =$amount;
			$data1['applicable_on'] =$applicable_on;
			$data1['from_date'] =$from_date;
			$data1['from_time'] =$from_time;
			$data1['from_date_time'] =$from_date." ".$from_time;
			$data1['to_date'] =$to_date;
			$data1['to_time'] =$to_time;
			$data1['status'] =post('status');
			$data1['to_date_time'] =$to_date." ".$to_time;
			$data1['vendor_id'] =$laundry_id;
			$data1['created_date_time'] =date("Y-m-d H:i:s");

			//$this->db->insert('increase_decrease', $data1);
			//
			$this->db->where(['id'=>$inc_id])->update('increase_decrease', $data1);
			$insert_id = $inc_id;
			if($insert_id!=null && $insert_id!=0)
			{
				$msg['result'] = "Date updated Successfully .";
				success_response($msg);
				}else{
				$msg = "Date not inserted. .";
				fail_response($msg);
			}
		}



			public function update_product($value='')
		{
			$laundry_id =post('laundry_id');
			$category_id =post('category_id');
			$unit_id =post('unit_id');
			$is_type_bucket=post('is_type_bucket');
			$item_id=post('item_id');
			$tax=post('tax');

			is_blank($laundry_id,"Laundry Id");
			is_blank($category_id,"Category Id");
			is_blank($item_id,"Item Id");
			is_blank($unit_id,"Unit Id");

			is_laundry_not($laundry_id);
			if($is_type_bucket=="1")
			{
			    $unit_id="3";
			}

				$laundry = $this->db->query("SELECT `loundry_list`.*,
					`country_list`.`country_name` AS `country` ,`country_list`.`id` AS `country_id` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
			$rowlaundry = $laundry->row();
						$res['currency_name'] 	= $rowlaundry->currency_name;
						$res['currency_symbol'] 	= $rowlaundry->currency_symbol;

				$query_cat = $this->db->query("SELECT * FROM `category`  WHERE `category`.`id`=".$category_id."");
			$rowquery = $query_cat->row();

				$query_unit = $this->db->query("SELECT * FROM `unit_table`  WHERE `unit_table`.`id`=".$unit_id."");
			$rowunit = $query_unit->row();


			$data1['item_name'] =post('item_name');
			$data1['item_price'] =post('item_price');
			$data1['item_offer_price'] =post('item_offer_price');
			$data1['is_type_bucket'] =$is_type_bucket;

			$data1['tax'] =$tax;
			$data1['item_description'] =post('item_description');
			$image=saveImageFile('item_image','uploads/');
			if( $image!=null && $image!="")
			{
			$data1['item_image'] =$image;
			}
			$data1['vendor_id'] =$laundry_id;
			$data1['category_id'] =$rowquery->id;
			$data1['status'] =post('status');
			$data1['unit_id'] =$rowunit->id;
			$data1['unit_name'] =$rowunit->unit_name;
			$data1['country_id'] =$rowlaundry->country_id;
			$data1['added_date_time'] =date("Y-m-d H:i:s");

			//$this->db->insert('loundry_item_list', $data1);
			$this->db->where(['id'=>$item_id])->update('loundry_item_list', $data1);
			$insert_id = $item_id;
			if($insert_id!=null && $insert_id!=0)
			{
				$msg['result'] = "Date updated Successfully .";
				success_response($msg);
				}else{
				$msg = "Date not updated. .";
				fail_response($msg);
			}
		}



		public function laundry_get_increase_descrease()
		{

			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");

			$array1=[];
			$category =  $this->db->query("SELECT * FROM `loundry_list` where `id`='".$laundry_id."'");

			if($category->num_rows()>0)
			{
				$laundry = $this->db->query("SELECT `loundry_list`.*,
					`country_list`.`country_name` AS `country` ,`country_list`.`id` AS `country_id` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
					LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
			$rowlaundry = $laundry->row();
						//$res['currency_name'] 	= $rowlaundry->currency_name;
						//$res['currency_symbol'] 	= $rowlaundry->currency_symbol;


				$products = $this->db->query("SELECT * from increase_decrease where vendor_id='".$laundry_id."'");
					$productarray=[];
					if($products->num_rows()>0)
					{
						foreach ($products->result_array() as $key => $product)
						{
							$productres['id'] 	= $product['id'];
							$productres['title'] 	= $product['title'];
							$productres['increase_decrease'] 	= $product['increase_decrease'];
							$productres['amount_type'] 	= $product['amount_type'];
							$productres['amount'] 	= $product['amount'];
							$productres['applicable_on'] 	= $product['applicable_on'];
							$productres['from_date'] 	= $product['from_date'];
							$productres['from_time'] 	= $product['from_time'];
							$productres['from_date_time'] 	= $product['from_date_time'];
							$productres['to_date'] 	= $product['to_date'];
							$productres['to_time'] 	= $product['to_time'];
							$productres['to_date_time'] 	= $product['to_date_time'];



							$productres['from_date_display'] 	= date('d-M-Y', strtotime($product['from_date']));
							$productres['from_time_display'] 	= date('h:i A', strtotime($product['from_time']));
							$productres['from_date_time_display'] 	= date('d-M-Y h:i A', strtotime($product['from_date_time']));
							$productres['to_date_display'] 	= date('d-M-Y', strtotime($product['to_date']));
							$productres['to_time_display'] 	=  date('h:i A', strtotime($product['to_time']));
							$productres['to_date_time_display'] 	= date('d-M-Y h:i A', strtotime($product['to_date_time']));

							$productres['status'] 	= $product['status'];

							$productres['currency_name'] 	= $rowlaundry->currency_name;
							$productres['currency_symbol'] 	= $rowlaundry->currency_symbol;
							$productarray[] = $productres;
						}
					}
					$res["increase_decrese_list"] = $productarray;
				//	$array1[] = $response2;


				//$res["category_list"] = $array1;
				$res['msg'] = "Data found Successfully .";
				success_response($res);
			}
			else
			{
				$res = "Product data not found.";
				fail_response($res);
			}

		}

		public function laundry_get_product_for_bucket()
		{

			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");

			$array1=[];
			$category =  $this->db->query("SELECT * FROM `category` where `status`=1 and `is_display_to_bucket`=1");

			if($category->num_rows()>0)
			{

				foreach ($category->result_array() as $key => $rowinfo)
				{
					$response2['name'] 	= $rowinfo['name'];
					$response2['icon'] 	= base_url()."uploads/".$rowinfo['icon'];
					$response2['category_id'] 	= $rowinfo['id'];

					$products = $this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
					LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
						LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
					LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
					LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`!=2 AND `loundry_item_list`.`is_type_bucket`=0");

				// 	echo "SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
				// 	LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
				// 		LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
				// 	LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
				// 	LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1";
				// 	return;
				// 	echo ("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
				// 	LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
				// 		LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
				// 	LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
				// 	LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1");
				// 	return;
					$productarray=[];
					if($products->num_rows()>0)
					{
						foreach ($products->result_array() as $key => $product)
						{
							$productres['product_id'] 	= $product['id'];
							$productres['product_name'] 	= $product['item_name'];
							$productres['product_price'] 	= $product['item_price'];
							$productres['offer_price'] 	= $product['item_offer_price'];
							$productres['is_type_bucket'] 	= $product['is_type_bucket'];
							$productres['product_description'] 	= $product['item_description'];
							$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
							$productres['product_laundry_id'] 	= $product['vendor_id'];
							$productres['product_laundry_name'] 	= $product['vendor_name'];
							$productres['product_laundry_display_address'] 	= $product['display_address'];
							$productres['status'] 	= $product['status'];



							$productres['category_id'] 	= $product['category_id'];
							$productres['category_name'] 	= $product['category_name'];
							$productres['product_unit_id'] 	= $product['unit_id'];
							$productres['unit_name'] 	= $product['unitname'];
							$productres['country_id'] 	= $product['country_id'];
							$productres['product_country'] 	= $product['country'];
							$productres['currency_name'] 	= $product['currency_name'];
							$productres['currency_symbol'] 	= $product['currency_symbol'];
							$productarray[] = $productres;
						}
					}
					$response2["loundry_products"] = $productarray;
					$array1[] = $response2;
				}
				$res["category_list"] = $array1;
				$res['msg'] = "Data found Successfully .";
				success_response($res);
			}
			else
			{
				$res = "Product data not found.";
				fail_response($res);
			}

		}


		public function laundry_get_product()
		{

			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");

			$array1=[];
			$category =  $this->db->query("SELECT * FROM `category` where `status`=1");

			if($category->num_rows()>0)
			{

				foreach ($category->result_array() as $key => $rowinfo)
				{
					$response2['name'] 	= $rowinfo['name'];
					$response2['icon'] 	= base_url()."uploads/".$rowinfo['icon'];
					$response2['category_id'] 	= $rowinfo['id'];

					$products = $this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
					LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
						LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
					LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
					LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`!=2");

				// 	echo "SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
				// 	LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
				// 		LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
				// 	LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
				// 	LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1";
				// 	return;
				// 	echo ("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
				// 	LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
				// 		LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
				// 	LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
				// 	LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1");
				// 	return;
					$productarray=[];
					if($products->num_rows()>0)
					{
						foreach ($products->result_array() as $key => $product)
						{
							$productres['product_id'] 	= $product['id'];
							$productres['product_name'] 	= $product['item_name'];
							$productres['product_price'] 	= $product['item_price'];
							$productres['offer_price'] 	= $product['item_offer_price'];
							$productres['is_type_bucket'] 	= $product['is_type_bucket'];
							$productres['product_description'] 	= $product['item_description'];
							$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
							$productres['product_laundry_id'] 	= $product['vendor_id'];
							$productres['product_laundry_name'] 	= $product['vendor_name'];
							$productres['product_laundry_display_address'] 	= $product['display_address'];
							$productres['status'] 	= $product['status'];



							$productres['category_id'] 	= $product['category_id'];
							$productres['category_name'] 	= $product['category_name'];
							$productres['product_unit_id'] 	= $product['unit_id'];
							$productres['unit_name'] 	= $product['unitname'];
							$productres['country_id'] 	= $product['country_id'];
							$productres['product_country'] 	= $product['country'];
							$productres['currency_name'] 	= $product['currency_name'];
							$productres['currency_symbol'] 	= $product['currency_symbol'];
							$productarray[] = $productres;
						}
					}
					$response2["loundry_products"] = $productarray;
					$array1[] = $response2;
				}
				$res["category_list"] = $array1;
				$res['msg'] = "Data found Successfully .";
				success_response($res);
			}
			else
			{
				$res = "Product data not found.";
				fail_response($res);
			}

		}


		//Get Product Id
		public function laundry_get_product_by_id()
		{

			$laundry_id =post('laundry_id');
			$item_id =post('item_id');

			is_blank($laundry_id,"Laundry Id");
			is_blank($item_id,"Item Id");

			is_laundry_not($laundry_id);
			is_item_not($item_id);

			$array1=[];

					$products = $this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
					LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
						LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
					LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
					LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`id`=".$item_id." AND `loundry_item_list`.`status`!=2");

				// 	echo "SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
				// 	LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
				// 		LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
				// 	LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
				// 	LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1";
				// 	return;
				// 	echo ("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
				// 	LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
				// 		LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
				// 	LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
				// 	LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1");
				// 	return;
				$unit_id="";
				$category_id="";
					$productarray=[];
					if($products->num_rows()>0)
					{
						foreach ($products->result_array() as $key => $product)
						{
							$productres['product_id'] 	= $product['id'];
							$productres['product_name'] 	= $product['item_name'];
							$productres['product_price'] 	= $product['item_price'];
							$productres['offer_price'] 	= $product['item_offer_price'];
							$productres['is_type_bucket'] 	= $product['is_type_bucket'];

							$productres['product_description'] 	= $product['item_description'];
							$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
							$productres['product_laundry_id'] 	= $product['vendor_id'];
							$productres['product_laundry_name'] 	= $product['vendor_name'];
							$productres['product_laundry_display_address'] 	= $product['display_address'];
							$productres['status'] 	= $product['status'];
							$productres['is_type_bucket'] 	= $product['is_type_bucket'];
							$productres['tax'] 	= $product['tax'];



							$productres['category_id'] 	= $product['category_id'];
							$productres['category_name'] 	= $product['category_name'];
							$productres['product_unit_id'] 	= $product['unit_id'];
							$unit_id=$product['unit_id'];
							$category_id= $product['category_id'];
							$productres['unit_name'] 	= $product['unitname'];
							$productres['country_id'] 	= $product['country_id'];
							$productres['product_country'] 	= $product['country'];
							$productres['currency_name'] 	= $product['currency_name'];
							$productres['currency_symbol'] 	= $product['currency_symbol'];
							$productarray[] = $productres;
						}

						//--other
						$data=$this->db->query("SELECT * FROM `category` WHERE `category`.`status`='1'");
		//	echo "SELECT * FROM `category` WHERE `category`.`status`='1'";
		//	return;
			if ($data->num_rows()>0) {
				$array1 = [];
				foreach ($data->result_array() as $key => $laundry_date)
				{
					$response1['id'] 	= $laundry_date['id'];
					if($category_id==$laundry_date['id'])
					{
					    $response1['is_selected'] 	= "1";
					}
					else
					{
					    $response1['is_selected'] 	= "0";
					}
					$response1['cat_name'] 	= $laundry_date['name'];
					$array1[] = $response1;
				}

				$response2["category_list"] = $array1;

				}
				else
				{
				 $response2["category_list"] = [];
				}




				//--buckket cat list

						//--other
						$data=$this->db->query("SELECT * FROM `category` WHERE `category`.`status`='1' and  `category`.`is_display_to_bucket`='1'");
		//	echo "SELECT * FROM `category` WHERE `category`.`status`='1'";
		//	return;
			if ($data->num_rows()>0) {
				$array1 = [];
				foreach ($data->result_array() as $key => $laundry_date)
				{
					$response1['id'] 	= $laundry_date['id'];
					if($category_id==$laundry_date['id'])
					{
					    $response1['is_selected'] 	= "1";
					}
					else
					{
					    $response1['is_selected'] 	= "0";
					}
					$response1['cat_name'] 	= $laundry_date['name'];
					$array1[] = $response1;
				}

				$response2["category_list_bucket"] = $array1;

				}
				else
				{
				 $response2["category_list_bucket"] = [];
				}
				//bucket cat list end


					$data=$this->db->query("SELECT * FROM `unit_table`");
			if ($data->num_rows()>0) {
				$array1 = [];
				foreach ($data->result_array() as $key => $laundry_date)
				{
					$response1['id'] 	= $laundry_date['id'];
					if($unit_id==$laundry_date['id'])
					{
					    $response1['is_selected'] 	= "1";
					}
					else
					{
					    $response1['is_selected'] 	= "0";
					}
					$response1['unit_name'] 	= $laundry_date['unit_name'];
					$array1[] = $response1;
				}

				$response2["unit_list"] = $array1;

				}
				else
				{
				 $response2["unit_list"] = [];
				}
						//--other




						$response2["loundry_products"] = $productarray;
				        $response2['msg'] = "Data found Successfully .";
				success_response($response2);
					}
					else
					{
					    $msg = "Item not inserted. .";
				fail_response($msg);
					}



		}

		//--Get Product by id desc
	}
