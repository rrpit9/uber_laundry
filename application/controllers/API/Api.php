<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	ob_start();
	class Api extends CI_Controller {
		
		function __construct(){
			parent::__construct();
			
			date_default_timezone_set('Asia/Kolkata');
		}
		
		
		public function laundry_login()
		{
			$login_id =post('email_id');
			$user_pwd =post('password');
			$device_token =post('device_token');
			$device_type =post('device_type');
			is_blank($login_id,"User Name");
			is_blank($user_pwd,"Password");
			is_blank($device_token,"Device Token");
			
			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`contact_number`='$login_id' AND `loundry_list`.`contact_password`='$user_pwd'");
			
			if ($query->num_rows() > 0)
			{
				$row = $query->row();
				
				$res['user_id'] = $row->id;
				$res['profile_id'] = $row->vendor_name;
				$res['user_name'] = $row->vendor_name;
				$res['user_email'] = $row->contact_email_id;
				$res['user_mobile'] = $row->contact_number;
				$res['user_image'] = base_url()."uploads/".$row->identity_card;
				$res['designation'] = 3;
				$res['msg'] = "Successfully Login.";
				success_response($res);
			}
			else
			{
				$res = "User Id or Password not found.";
				fail_response($res);
			}
		}
		
		
		public function cust_get_setting()
		{
			$user_id =post('user_id');
			is_blank($user_id,"User Id");
			
			$query = $this->db->query("SELECT * FROM `user_details` WHERE `id`='".$user_id."'");
			
			if ($query->num_rows() > 0)
			{
				$row = $query->row();
				$res['user_id'] = $row->id;
				$res['email_status'] = $row->email_status;
				$res['notification_status'] = $row->notification_status;
				$res['msg'] = "Detail fetched.";
				success_response($res);
			}
			else
			{
				$res = "Invalid user id.";
				fail_response($res);
			}
		}
		
		
		public function test_notificationtest()
		{
		    $device_token="dINc0v46SDSez6EGDQAKG2:APA91bEZiDghNjiOf4hMGrIjxoPm_XTrSsyw7KN_i0UWGd5nfCO9S8BdiozDGcwgkKuY8_5ahpZZx_WmgHBlCKdedrpQiP8jv6wz7MjXXNwBHQqHmrHhC5fl2RfZdB_enodUhfqyhbP3";
		    $title="This is Testing notification function";
		    $message="This is Testing notification Message";
		    send_notification_ultesting($device_token,"GEN",$title,$message,"1","");
		}
		
		
		public function test_notification()
		{
		    $device_token="dINc0v46SDSez6EGDQAKG2:APA91bEZiDghNjiOf4hMGrIjxoPm_XTrSsyw7KN_i0UWGd5nfCO9S8BdiozDGcwgkKuY8_5ahpZZx_WmgHBlCKdedrpQiP8jv6wz7MjXXNwBHQqHmrHhC5fl2RfZdB_enodUhfqyhbP3";
		    $title="This is Testing notification function";
		    $message="This is Testing notification Message";
		    send_notification_ul($device_token,"GEN",$title,$message,"1","");
		}
		
		public function cust_reg()
		{
			$full_name =post('full_name');
			
			$mobile_number =post('mobile_number');
			$email_id =post('email_id');
			$password =post('password');
			$pincode =post('pincode');
			
			
			is_blank($full_name,"Full Name");
			is_blank($mobile_number,"Mobile Number");
			is_blank($email_id,"Email id");
			is_blank($password,"Password");
			is_user_email($email_id);
			is_user_mobile($mobile_number);
			$otpcode=otpcode(4);
			$fields['otp_code'] = $otpcode;
			$fields['full_name'] = $full_name;
			$fields['email_id'] = $email_id;
			$fields['password'] = $password;
			$fields['mobile_number'] = $mobile_number;
			$fields['pincode'] = $pincode;
			
			
			$fields['device_token'] = post('device_token');
			$fields['user_status'] = "0";
			$fields['wallet_balance'] = "0";
			$fields['otp_code_status'] = "0";
			
			
			$this->db->insert('user_details', $fields);
			
			$insert_id = $this->db->insert_id();
			if($insert_id!=null && $insert_id!=0)
			{
				
				//send_smsamitsir($mobile_number,"Your otp code is : ".$otpcode,"");
				$res['user_id'] = $insert_id."";
				$res['otp_code'] = $otpcode;
				$res['user_name'] = $full_name;
				$res['user_email'] = $email_id;
				$res['user_mobile'] = $mobile_number;
				$res['msg'] = "Successfully registered user.";
				success_response($res);
			}
			else
			{
				$res = "Failled to insert.";
				fail_response($res);
			}
			
		}
		
		
		public function activate_cust()
		{
			$user_id =post('user_id');
			$status =post('status');
			
			is_blank($user_id,"User Id");
			is_blank($status,"Status");
			is_user_not($user_id);
			$fields['user_status'] = '1';
			$fields['otp_code_status'] = '1';
			$this->db->where(['id'=>$user_id])->update('user_details', $fields);
			$res['msg'] = "User Activate successfully.";
			success_response($res);
			
		}
		
		
		public function update_not_setting()
		{
			$user_id =post('user_id');
			$notification_status =post('notification_status');
			
			is_blank($user_id,"User id");
			is_blank($notification_status,"Notification Status");
			is_user_not($user_id);
			$fields['notification_status'] = $notification_status;
			$this->db->where(['id'=>$user_id])->update('user_details', $fields);
			$res['msg'] = "Notification updated successfully.";
			$res['not_status'] = $notification_status;
			success_response($res);
			
		}
		
		public function update_email_setting()
		{
			$user_id =post('user_id');
			$email_status =post('email_status');
			
			is_blank($user_id,"User id");
			is_blank($email_status,"Email Status");
			is_user_not($user_id);
			$fields['email_status'] = $email_status;
			$this->db->where(['id'=>$user_id])->update('user_details', $fields);
			$res['msg'] = "Email updated successfully.";
			$res['email_status'] = $email_status;
			success_response($res);
			
		}
		
		
		
		
		
		public function update_cust_location()
		{
			$user_id =post('user_id');
			$gps_address =post('gps_address');
			$gps_lat =post('gps_lat');
			$gps_long =post('gps_long');
			
			is_blank($user_id,"User Id");
			is_blank($gps_address,"GPS Address");
			is_blank($gps_lat,"GPS Lat");
			is_blank($gps_long,"GPS Long");
			is_user_not($user_id);
			
			$fields['gps_address'] = $gps_address;
			$fields['gps_lat'] = $gps_lat;
			$fields['gps_long'] = $gps_long;
			
			$this->db->where(['id'=>$user_id])->update('user_details', $fields);
			
			$res['msg'] = "User Address update successfully.";
			success_response($res);
			
		}
		
		
		public function cust_login()
		{
			$email_id =post('email_id');
			$user_pwd =post('password');
			$device_token =post('device_token');
			
			is_blank($email_id,"Email Id");
			is_blank($user_pwd,"Password");
			is_blank($device_token,"Device Token");
			
			$query = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`email_id`='$email_id' AND `user_details`.`password`='$user_pwd' or `user_details`.`mobile_number`='$email_id' AND `user_details`.`password`='$user_pwd'");
			
			
			if ($query->num_rows() > 0)
			{
				
				$row = $query->row();
				$fields['device_token'] = $device_token;
				$this->db->where(['id'=>$row->id])->update('user_details', $fields);
				
				$otpcode=otpcode(4);
				$res['otp_code'] = $otpcode;
				
				$res['user_id'] = $row->id;
				$res['user_name'] = $row->full_name;
				$res['email'] = $row->email_id;
				$res['mobile'] = $row->mobile_number;
				//$res['otp'] = $row->otp_code;
				$res['user_status'] = $row->user_status;
				$res['wallet_balance'] = $row->wallet_balance;
				$res['address'] = $row->gps_address;
				$res['add_lat'] = $row->gps_lat;
				$res['add_long'] = $row->gps_long;
				$res['msg'] = "Successfully Login .";
				success_response($res);
			}
			else
			{
				$res = "Incorrect Password.";
				fail_response($res);
			}
		}
		
		
		public function delete_address($value='')
		{
			
			$address_id =post('address_id');
			is_blank($address_id,"Address Id");
			//("SELECT * FROM `address_list` WHERE `address_list`.`id`='$address_id'");
			$data=$this->db->query("SELECT * FROM `address_list` WHERE `address_list`.`id`= '$address_id'");
			
			if($data->num_rows()>0)
			{
				$this->db->delete('address_list', array('id' => $address_id));
				$msg['result'] = "Data Deleted Successfully .";
				success_response($msg);
				}else{
				$msg = "Data not found. .";
				fail_response($msg);
			}
		}
		
		public function get_home_page_data($value='')
		{
			
			$user_id =post('user_id');
			$device_token =post('device_token');
			$device_type =post('device_type');
			$category_id =post('category_id');
			
			$user_lat =post('user_lat');
			$user_long =post('user_long');
			is_blank($user_id,"User Id");
			is_blank($user_lat,"Lat");
			is_blank($user_long,"Long");
			
			$array1=[];
			$array2=[];
			$array3=[];
			
			$queryuser = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
			
			
			if ($queryuser->num_rows() > 0)
			{
				$rowuser = $queryuser->row();
				if($device_token!=null && $device_token!="")
				{
				    $fields['device_token'] = $device_token;
				    $fields['device_type'] = $device_type;
					$this->db->where(['id'=>$rowuser->id])->update('user_details', $fields);
				}
			}
			
			$category =  $this->db->query("SELECT * FROM `category`")->result_Array();
			foreach ($category as $key => $rowinfo)
			{
				$response2['name'] 	= $rowinfo['name'];
				if($rowinfo['id']==$category_id)
				{
					$response2['is_selected'] 	= "1";
				}
				else {
					
					$response2['is_selected'] 	= "0";
				}
				
				$response2['icon'] 	= base_url()."uploads/".$rowinfo['icon'];
				$response2['id'] 	= $rowinfo['id'];
				$array2[] = $response2;
			}
			$result["category_list"] = $array2;
			
			$SubPackage =  $this->db->query("SELECT `loundry_list`.*, (3959 * acos (cos ( radians($user_lat) )	* cos( radians( vendor_lat ) )* cos( radians( vendor_long ) - radians($user_long) ) + sin ( radians($user_lat) )	* sin( radians( vendor_lat ) ))	) AS distance
			FROM loundry_list WHERE loundry_list.type = 'Loundry' AND loundry_list.is_recomended = 1 ORDER BY distance asc LIMIT 0 , 20")->result_Array();
			
			//echo $this->db->last_query(); die;
			foreach ($SubPackage as $key => $valuedriver)
			{
				
				if(get_category_found($category_id,$valuedriver['id'])>0)
				{
					$response1['vendor_id'] 	= $valuedriver['id'];
					//	$response1['vendor_name'] 	= $valuedriver['vendor_name']." ".$user_lat.",".$user_long;
					$response1['vendor_name'] 	= $valuedriver['vendor_name'];
					
					$response1['vendor_gps_address'] 	= $valuedriver['vendor_gps_address'];
					$response1['vendor_open_time_today'] 	= $valuedriver['vendor_name'];
					$response1['vendor_closing_time_today'] 	= $valuedriver['vendor_name'];
					$response1['vendor_rating'] 	= $valuedriver['average_rating'];
					$response1['vendor_distance'] 	= $valuedriver['vendor_name'];
					$response1['vendor_image'] 	= base_url()."uploads/".$valuedriver['vendor_image'];
					$response1['vendor_lat'] 	= $valuedriver['vendor_lat'];
					$response1['vendor_long'] 	= $valuedriver['vendor_long'];
					$response1['distance'] 	= $valuedriver['distance'];
					if($valuedriver['average_rating']!=null && $valuedriver['average_rating']!="0")
					{
						$response1['vendor_rating'] 	= $valuedriver['average_rating'];
					}
					else
					{
						$response1['vendor_rating'] 	= "0";
					}
					
					$todayDay = date("l",strtotime(date('d-m-Y')));
					$to_day = $this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`day_name`='$todayDay' AND `loundry_day_list`.`vendor_id`=".$valuedriver['id']."");
					$response1['day_name'] 	=$todayDay;
					if($to_day->num_rows()>0)
					{
						$response1['open_time_today'] 	= date("g:i A", strtotime($to_day->row()->open_time));
						$response1['closing_time_today'] 	= date("g:i A", strtotime($to_day->row()->close_time));
						$response1['is_open'] 	= $to_day->row()->status;
						}else{
						$response1['open_time_today'] 	= "0.00";
						$response1['closing_time_today'] 	= "0.00";
						$response1['is_open'] 	= "0";
					}
					
					$array1[] = $response1;
				}
				
				
				
			}
			$result["recomend_list"] = $array1;
			
			//--express_delivery_hours
			
			$near_by =  $this->db->query("SELECT `loundry_list`.*, (3959 * acos (cos ( radians($user_lat) )	* cos( radians( vendor_lat ) )* cos( radians( vendor_long ) - radians($user_long) ) + sin ( radians($user_lat) )	* sin( radians( vendor_lat ) ))	) AS distance
			FROM loundry_list WHERE loundry_list.type = 'Loundry' and loundry_list.is_express_delivery = '1' HAVING distance < 300 ORDER BY distance asc LIMIT 0 , 20")->result_Array();
			$array4=[];
			foreach ($near_by as $key => $valuedriver)
			{
				if(get_category_found($category_id,$valuedriver['id'])>0)
				{
					$response1['vendor_id'] 	= $valuedriver['id'];
					$response1['vendor_name'] 	= $valuedriver['vendor_name'];
					$response1['vendor_gps_address'] 	= $valuedriver['vendor_gps_address'];
					$response1['vendor_open_time_today'] 	= $valuedriver['vendor_name'];
					$response1['vendor_closing_time_today'] 	= $valuedriver['vendor_name'];
					if($valuedriver['average_rating']!=null && $valuedriver['average_rating']!="0")
					{
						$response1['vendor_rating'] 	= $valuedriver['average_rating'];
					}
					else
					{
						$response1['vendor_rating'] 	= "0";
					}
					
					$response1['vendor_distance'] 	= $valuedriver['vendor_name'];
					$response1['vendor_image'] 	= base_url()."uploads/".$valuedriver['vendor_image'];
					$response1['vendor_lat'] 	= $valuedriver['vendor_lat'];
					$response1['vendor_long'] 	= $valuedriver['vendor_long'];
					$response1['distance'] 	= $valuedriver['distance'];
					
					$todayDay = date("l",strtotime(date('d-m-Y')));
					$to_day = $this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`day_name`='$todayDay' AND `loundry_day_list`.`vendor_id`=".$valuedriver['id']."");
					$response1['day_name'] 	=$todayDay;
					if($to_day->num_rows()>0)
					{
						$response1['open_time_today'] 	= date("g:i A", strtotime($to_day->row()->open_time));
						$response1['closing_time_today'] 	= date("g:i A", strtotime($to_day->row()->close_time));
						
						$response1['is_open'] 	= $to_day->row()->status;
					}
					else
					{
						$response1['open_time_today'] 	= "0.00";
						$response1['closing_time_today'] 	= "0.00";
						$response1['is_open'] 	= "0";
					}
					
					$array4[] = $response1;
				}
				
			}
			$result["express_laundry_list"] = $array4;
			
			//==Express
			
			
			
			$near_by =  $this->db->query("SELECT `loundry_list`.*, (3959 * acos (cos ( radians($user_lat) )	* cos( radians( vendor_lat ) )* cos( radians( vendor_long ) - radians($user_long) ) + sin ( radians($user_lat) )	* sin( radians( vendor_lat ) ))	) AS distance
			FROM loundry_list WHERE loundry_list.type = 'Loundry' HAVING distance < 300 ORDER BY distance asc LIMIT 0 , 20")->result_Array();
			
			foreach ($near_by as $key => $valuedriver)
			{
				if(get_category_found($category_id,$valuedriver['id'])>0)
				{
					$response1['vendor_id'] 	= $valuedriver['id'];
					$response1['vendor_name'] 	= $valuedriver['vendor_name'];
					$response1['vendor_gps_address'] 	= $valuedriver['vendor_gps_address'];
					$response1['vendor_open_time_today'] 	= $valuedriver['vendor_name'];
					$response1['vendor_closing_time_today'] 	= $valuedriver['vendor_name'];
					if($valuedriver['average_rating']!=null && $valuedriver['average_rating']!="0")
					{
						$response1['vendor_rating'] 	= $valuedriver['average_rating'];
					}
					else
					{
						$response1['vendor_rating'] 	= "0";
					}
					
					$response1['vendor_distance'] 	= $valuedriver['vendor_name'];
					$response1['vendor_image'] 	= base_url()."uploads/".$valuedriver['vendor_image'];
					$response1['vendor_lat'] 	= $valuedriver['vendor_lat'];
					$response1['vendor_long'] 	= $valuedriver['vendor_long'];
					$response1['distance'] 	= $valuedriver['distance'];
					
					$todayDay = date("l",strtotime(date('d-m-Y')));
					$to_day = $this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`day_name`='$todayDay' AND `loundry_day_list`.`vendor_id`=".$valuedriver['id']."");
					$response1['day_name'] 	=$todayDay;
					if($to_day->num_rows()>0)
					{
						$response1['open_time_today'] 	= date("g:i A", strtotime($to_day->row()->open_time));
						$response1['closing_time_today'] 	= date("g:i A", strtotime($to_day->row()->close_time));
						
						$response1['is_open'] 	= $to_day->row()->status;
					}
					else
					{
						$response1['open_time_today'] 	= "0.00";
						$response1['closing_time_today'] 	= "0.00";
						$response1['is_open'] 	= "0";
					}
					
					$array3[] = $response1;
				}
				
			}
			$result["near_by_list"] = $array3;
			
			$result['share_message'] = "Hi I recomended to use Uber Laundry app for find nearest laudnries. Download app from https://play.google.com/store/apps/details?id=com.ezeonsoft.uber_laundry";
			$result['msg'] = "Data found Successfully .";
			
			success_response($result);
		}
		
		
		public function get_all_nearby($value='')
		{
			
			$user_id =post('user_id');
			$device_token =post('device_token');
			$device_type =post('device_type');
			
			$user_lat =post('user_lat');
			$user_long =post('user_long');
			is_blank($user_id,"User Id");
			is_blank($user_lat,"Lat");
			is_blank($user_long,"Long");
			
			$array1=[];
			$array2=[];
			$array3=[];
			
			
			
			$result["category_list"] = $array2;
			
			
			
			$near_by =  $this->db->query("SELECT `loundry_list`.*, (3959 * acos (cos ( radians($user_lat) )	* cos( radians( vendor_lat ) )* cos( radians( vendor_long ) - radians($user_long) ) + sin ( radians($user_lat) )	* sin( radians( vendor_lat ) ))	) AS distance
			FROM loundry_list WHERE loundry_list.type = 'Loundry' HAVING distance < 300 ORDER BY distance LIMIT 0 , 20")->result_Array();
			
			foreach ($near_by as $key => $valuedriver)
			{
				$response1['vendor_id'] 	= $valuedriver['id'];
				$response1['vendor_name'] 	= $valuedriver['vendor_name'];
				$response1['vendor_gps_address'] 	= $valuedriver['vendor_gps_address'];
				$response1['vendor_open_time_today'] 	= $valuedriver['vendor_name'];
				$response1['vendor_closing_time_today'] 	= $valuedriver['vendor_name'];
				if($valuedriver['average_rating']!=null && $valuedriver['average_rating']!="0")
				{
					$response1['vendor_rating'] 	= $valuedriver['average_rating'];
				}
				else
				{
					$response1['vendor_rating'] 	= "0";
				}
				
				$response1['vendor_distance'] 	= $valuedriver['vendor_name'];
				$response1['vendor_image'] 	= base_url()."uploads/".$valuedriver['vendor_image'];
				$response1['vendor_lat'] 	= $valuedriver['vendor_lat'];
				$response1['vendor_long'] 	= $valuedriver['vendor_long'];
				$response1['distance'] 	= $valuedriver['distance'];
				
				$todayDay = date("l",strtotime(date('d-m-Y')));
				$to_day = $this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`day_name`='$todayDay' AND `loundry_day_list`.`vendor_id`=".$valuedriver['id']."");
				$response1['day_name'] 	=$todayDay;
				if($to_day->num_rows()>0)
				{
					$response1['open_time_today'] 	= date("g:i A", strtotime($to_day->row()->open_time));
					$response1['closing_time_today'] 	= date("g:i A", strtotime($to_day->row()->close_time));
					
					$response1['is_open'] 	= $to_day->row()->status;
				}
				else
				{
					$response1['open_time_today'] 	= "0.00";
					$response1['closing_time_today'] 	= "0.00";
					$response1['is_open'] 	= "0";
				}
				
				$array3[] = $response1;
			}
			$result["near_by_list"] = $array3;
			$result['msg'] = "Data found Successfully .";
			
			success_response($result);
		}
		
		
		
		public function get_laundry_details()
		{
			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
			
			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`vendor_status`='1'");
			
			if ($query->num_rows() > 0)
			{
				
				$row = $query->row();
				$res['msg'] = "Data found Successfully .";
				
				$res['laundry_id'] = $row->id;
				$res['laundry_name'] = $row->vendor_name;
				$res['lat'] = $row->vendor_lat;
				$res['long'] = $row->vendor_long;
				$res['display_address'] = $row->vendor_display_address;
				$res['gps_address'] = $row->vendor_gps_address;
				$res['image'] = base_url()."uploads/".$row->vendor_image;
				$res['contact_number'] = $row->contact_number;
				$res['email_id'] = $row->contact_email_id;
				$res['vendor_registration_certificate'] = $row->vendor_registration_certificate;
				$res['identity_card'] = base_url()."uploads/".$row->identity_card;
				$res['identity_card_number'] = $row->identity_card_number;
				$res['wallet_balance'] = $row->wallet_balance;
				$res['loundry_info'] = $row->loundry_info;
				$res['registration_date'] = $row->vendor_registration_date;
				$res['average_rating'] = $row->average_rating;
				$res['total_review'] = $row->total_review;
				$res['country_id'] = $row->country_id;
				$res['recomended'] = $row->is_recomended;
				
				
				$todayDay = date("l",strtotime(date('d-m-Y')));
				$to_day = $this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`day_name`='$todayDay' AND `loundry_day_list`.`vendor_id`='$laundry_id'");
				$res['day_name'] 	=$todayDay;
				if($to_day->num_rows()>0){
					$res['open_time_today'] 	= date("g:i A", strtotime($to_day->row()->open_time));
					$res['closing_time_today'] 	= date("g:i A", strtotime($to_day->row()->close_time));
					$res['is_open'] 	= $to_day->row()->status;
					}else{
					$res['open_time_today'] 	= "0.00";
					$res['closing_time_today'] 	= "0.00";
					$res['is_open'] 	= "0";
				}
				
				$array3=[];
				for($i=0;$i<7;$i++){
					
					$todayDay1 = date("l",strtotime(date('d-m-Y', strtotime("+".$i." day"))));
					$day_data = $this->db->query("SELECT * FROM `loundry_day_list` WHERE
					`loundry_day_list`.`day_name`='$todayDay1' AND `loundry_day_list`.`vendor_id`='$laundry_id' AND `loundry_day_list`.`status`='1'");
					if($day_data->num_rows()>0){
						
						$response3['day_id'] 	= $day_data->row()->id;
						$response3['day_name'] 	= $day_data->row()->day_name;
						$response3['date'] 	= date('d-m-Y', strtotime("+".$i." day"));
						$response3['day_open_time'] 	= date("g:i A", strtotime($day_data->row()->open_time));
						$response3['day_close_time'] 	= date("g:i A", strtotime($day_data->row()->close_time));
						
						$day_time_slot = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`day_id`=".$day_data->row()->id);
						$dayarray=[];
						
						if($day_time_slot->num_rows()>0){
							foreach ($day_time_slot->result_array() as $key => $rowinfo)
							{
								$dayres['time_slot_id'] 	= $rowinfo['id'];
								$dayres['time_slot'] 	= $rowinfo['org_slot_time'];
								$dayres['display_time_slot'] 	= $rowinfo['display_slot_time'];
								$dayarray[] = $dayres;
							}
						}
						$response3['time_slot'] = $dayarray;
						$array3[] = $response3;
					}
					
				}
				
				$res["dayList"] = $array3;
				
				$array=[];
				$loundry_banner =  $this->db->query("SELECT * FROM `loundry_banner` WHERE `loundry_banner`.`vendor_id`='$laundry_id' order by sno asc")->result_Array();
				foreach ($loundry_banner as $key => $rowinfo)
				{
					$response2['banner_id'] 	= $rowinfo['id'];
					$response2['banner_img'] 	= base_url()."assets/images/".$rowinfo['banner_image'];
					$response2['banner_srno'] 	= $rowinfo['sno'];
					$array[] = $response2;
				}
				$res["loundry_banner"] = $array;
				
				success_response($res);
			}
			else
			{
				$res = "Laundry data not found.";
				fail_response($res);
			}
		}
		
		
		public function categary_list()
		{
			
			$category =  $this->db->query("SELECT * FROM `category` where status=1")->result_Array();
			foreach ($category as $key => $rowinfo)
			{
				$response2['name'] 	= $rowinfo['name'];
				$response2['icon'] 	= base_url()."uploads/".$rowinfo['icon'];
				$response2['id'] 	= $rowinfo['id'];
				$array2[] = $response2;
			}
			$result["category_list"] = $array2;
			$result['msg'] = "Data found Successfully .";
			success_response($result);
		}
		
		
		
		
		public function product_by_category()
		{
			$laundry_id =post('laundry_id');
			$categary_id =post('categary_id');
			is_blank($laundry_id,"Laundry Id");
			is_blank($categary_id,"Category Id");
			$productarray=[];
			$categorys = $this->db->query("SELECT * FROM `category` WHERE `category`.`status`='1'");
			if ($categorys->num_rows() > 0)
			{
				
				$products = $this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`  FROM `loundry_item_list`
				LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
				LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
				LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id`
				WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$categary_id." AND `loundry_item_list`.`status`=1");
				
				
				
				if($products->num_rows()>0)
				{
					foreach ($products->result_array() as $key => $product)
					{
						$productres['product_id'] 	= $product['id'];
						$productres['product_name'] 	= $product['item_name'];
						$productres['product_price'] 	= $product['item_price'];
						$productres['offer_price'] 	= $product['item_offer_price'];
						$productres['product_description'] 	= $product['item_description'];
						$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
						$productres['product_laundry_id'] 	= $product['vendor_id'];
						
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
				
			}
			$res['msg'] = "Data found Successfully .";
			$res["loundry_products"] = $productarray;
			success_response($res);
			
		}
		
		
		
		public function product_by_laundry()
		{
			
			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
			
			$array1=[];
			
			$increased_product=0;
			$increased_product_type="Fixed";
			$increased_product_operation="plus";
			$apon="Products";
			$inc_prod = $this->db->query("SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".date("Y-m-d H:i:s")."' AND `increase_decrease`.`to_date_time`>='".date("Y-m-d H:i:s")."'");
			if($inc_prod->num_rows() > 0)
			{
				$increased_product=$inc_prod->row()->amount;
				$increased_product_type=$inc_prod->row()->amount_type;
				$increased_product_operation=$inc_prod->row()->increase_decrease;
			}
			$loundry_row=gettablerow($laundry_id,"loundry_list","id");
			
			$res['pickup_and_drop_heading'] = "Pickup and Drop";
			$res['pickup_point1_heading'] = "Self Pickup and Drop";
			$res['pickup_point2_heading'] = "Pickup and Delivery Service";
			$res['pickup_point1_info'] = "You have to drop your clothes and pickup your clothes from and to the laundry";
			$res['pickup_point2_info'] = "We will provide a service person to pickup and drop your clothes. Extra service charges may be applied.";
			
			if($loundry_row->is_normal_delivery=="0" && $loundry_row->is_express_delivery=="0")
			{
				$res['laundry_type_is_display'] = "0";
				$res['laundry_type_default_select'] = "0";
			}
			else if($loundry_row->is_normal_delivery=="0" && $loundry_row->is_express_delivery=="1")
			{
				$res['laundry_type_is_display'] = "0";
				$res['laundry_type_default_select'] = "2";
			}
			else  if($loundry_row->is_normal_delivery=="1" && $loundry_row->is_express_delivery=="0")
			{
				$res['laundry_type_is_display'] = "0";
				$res['laundry_type_default_select'] = "1";
			}
			else {
				$res['laundry_type_is_display'] = "1";
				$res['laundry_type_default_select'] = "1";
			}
			
			$res['laundry_type_heading'] = "Laundry Type";
			$res['laundry_type_point1_heading'] = "Normal Laundry";
			$res['laundry_type_point2_heading'] = "Express Laundry";
			$res['laundry_type_point1_info'] = "Laundry will take approximately ".$loundry_row->normal_delivery_hours." Hours time to get the work done from pickup and drop of the laundry";
			$res['laundry_type_point2_info'] = "Express Laundry service ensures that we will complete your laundry within ".$loundry_row->express_delivery_hours." hours from the time when we received your clothes";
			
			
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
					LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1");
					
					
					$productarray=[];
					if($products->num_rows()>0)
					{
						foreach ($products->result_array() as $key => $product)
						{
							$productres['product_id'] 	= $product['id'];
							$productres['product_name'] 	= $product['item_name'];
							
							$item_price=$product['item_offer_price'];
							$mrp=$product['item_price'];
							if($increased_product>0)
							{
								$item_price=get_amount_inc($item_price,$increased_product_operation,$increased_product,$increased_product_type);
								$mrp=get_amount_inc($mrp,$increased_product_operation,$increased_product,$increased_product_type);
							}
							
							
							$productres['product_price'] 	= $mrp;
							$productres['offer_price'] 	= $item_price;
							$productres['product_description'] 	= $product['item_description'];
							$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
							$productres['product_laundry_id'] 	= $product['vendor_id'];
							$productres['product_laundry_name'] 	= $product['vendor_name'];
							$productres['product_laundry_display_address'] 	= "";
							
							
							
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
		
		
		public function product_by_laundrynewtype()
		{
			
			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
			$is_found=0;
			$array1=[];
			
			$increased_product=0;
			$increased_product_type="Fixed";
			$increased_product_operation="plus";
			$apon="Products";
			$inc_prod = $this->db->query("SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".date("Y-m-d H:i:s")."' AND `increase_decrease`.`to_date_time`>='".date("Y-m-d H:i:s")."'");
			if($inc_prod->num_rows() > 0)
			{
				$increased_product=$inc_prod->row()->amount;
				$increased_product_type=$inc_prod->row()->amount_type;
				$increased_product_operation=$inc_prod->row()->increase_decrease;
			}
			$category =  $this->db->query("SELECT * FROM `category` where `status`=1");
			
			if($category->num_rows()>0)
			{
				
				foreach ($category->result_array() as $key => $rowinfo)
				{
					
					$products = $this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
					LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
					LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
					LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
					LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`is_type_bucket`="."0"." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1");
					
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
					$products = $this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
					LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
					LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
					LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
					LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`is_type_bucket`="."0"." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1");
					
					$productarray=[];
					if($products->num_rows()>0)
					{
						$response2['name'] 	= $rowinfo['name'];
						$response2['icon'] 	= base_url()."uploads/".$rowinfo['icon'];
						$response2['category_id'] 	= $rowinfo['id'];
						
						foreach ($products->result_array() as $key => $product)
						{
						    $is_found++;
							$productres['product_id'] 	= $product['id'];
							$productres['product_name'] 	= $product['item_name'];
							$productres['product_description'] 	= $product['item_description'];
							$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
							$productres['product_laundry_id'] 	= $product['vendor_id'];
							$productres['product_laundry_name'] 	= $product['vendor_name'];
							$productres['product_laundry_display_address'] 	="";
							$productres['product_laundry_is_type_bucket'] 	= $product['is_type_bucket'];
							$item_price=$product['item_offer_price'];
							$mrp=$product['item_price'];
							if($increased_product>0)
							{
								$item_price=get_amount_inc($item_price,$increased_product_operation,$increased_product,$increased_product_type);
								$mrp=get_amount_inc($mrp,$increased_product_operation,$increased_product,$increased_product_type);
							}
							
							
							
							
							if($product['is_type_bucket']=="0")
							{
								$productres['product_price'] 	= round($mrp);
								$productres['offer_price'] 	= round($item_price);
								
							}
							else
							{
								$productres['product_price'] 	= 0;
								$productres['offer_price'] 	= 0;
							}
							
							
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
						$response2["loundry_products"] = $productarray;
						$array1[] = $response2;
					}
					
				}
				$res["category_list"] = $array1;
				
			}
			
			
			//=--bucket item
			$array1=[];
			$category =  $this->db->query("SELECT * FROM `category` where `status`=1 and `is_display_to_bucket`=1");
			
			if($category->num_rows()>0)
			{
				
				foreach ($category->result_array() as $key => $rowinfo)
				{
					
					$products = $this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
					`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
					LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
					LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
					LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
					LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`vendor_id`=".$laundry_id." AND `loundry_item_list`.`is_type_bucket`="."1"." AND `loundry_item_list`.`category_id`=".$rowinfo['id']." AND `loundry_item_list`.`status`=1");
					
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
						$response2['name'] 	= $rowinfo['name'];
						$response2['icon'] 	= base_url()."uploads/".$rowinfo['icon'];
						$response2['category_id'] 	= $rowinfo['id'];
						
						foreach ($products->result_array() as $key => $product)
						{
						    $is_found++;
							$productres['product_id'] 	= $product['id'];
							$productres['product_name'] 	= $product['item_name'];
							$productres['product_description'] 	= $product['item_description'];
							$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
							$productres['product_laundry_id'] 	= $product['vendor_id'];
							$productres['product_laundry_name'] 	= $product['vendor_name'];
							$productres['product_laundry_display_address'] 	= "";
							$productres['product_laundry_is_type_bucket'] 	= $product['is_type_bucket'];
							if($product['is_type_bucket']=="0")
							{
								$productres['product_price'] 	= $product['item_price'];
								$productres['offer_price'] 	= $product['item_offer_price'];
							}
							else
							{
								$productres['product_price'] 	= 0;
								$productres['offer_price'] 	= 0;
							}
							
							
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
						$response2["loundry_products"] = $productarray;
						$array1[] = $response2;
					}
					
				}
				$res["category_list_bucket"] = $array1;
			}
			
			
			
			
			
			//--Bucket item end
			
			if($is_found>0)
			{
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
				
				
				
				
				$loundry_row=$laundry_row;
				
				$res['pickup_and_drop_heading'] = "Pickup and Drop";
				$res['pickup_point1_heading'] = "Self Pickup and Drop";
				$res['pickup_point2_heading'] = "Pickup and Delivery Service";
				$res['pickup_point1_info'] = "You have to drop your clothes and pickup your clothes from and to the laundry";
				$res['pickup_point2_info'] = "We will provide a service person to pickup and drop your clothes. Extra service charges may be applied.";
				
				if($loundry_row->is_normal_delivery=="0" && $loundry_row->is_express_delivery=="0")
				{
					$res['laundry_type_is_display'] = "0";
					$res['laundry_type_default_select'] = "0";
				}
				else if($loundry_row->is_normal_delivery=="0" && $loundry_row->is_express_delivery=="1")
				{
					$res['laundry_type_is_display'] = "0";
					$res['laundry_type_default_select'] = "2";
				}
				else  if($loundry_row->is_normal_delivery=="1" && $loundry_row->is_express_delivery=="0")
				{
					$res['laundry_type_is_display'] = "0";
					$res['laundry_type_default_select'] = "1";
				}
				else {
					$res['laundry_type_is_display'] = "1";
					$res['laundry_type_default_select'] = "1";
				}
				
				$res['laundry_type_heading'] = "Delivery type";
				$res['laundry_type_point1_heading'] = "Normal Laundry";
				$res['laundry_type_point2_heading'] = "Express Laundry";
				$res['laundry_type_point1_info'] = "Laundry will take approximately ".$loundry_row->normal_delivery_hours." Hours time to get the work done from pickup and drop of the laundry";
				$res['laundry_type_point2_info'] = "Express Laundry service ensures that we will complete your laundry within ".$loundry_row->express_delivery_hours." hours from the time when we received your clothes";
				
				
				
				
				
				
			    $res['msg'] = "Data found Successfully .";
				success_response($res);
			}
			else
			{
				$res = "Product data not found.";
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
		
		public function forgot_password()
		{
			$mobile_no =post('mobile_no');
			is_blank($mobile_no,"Mobile Number");
			
			$query = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`mobile_number`='$mobile_no'");
			if ($query->num_rows() > 0)
			{
				
				$row = $query->row();
				$otpcode=otpcode(4);
				$res['otp_code'] = $otpcode;
				
				$res['mobile'] = $row->mobile_number;
				$res['msg'] = "Otp send to your number.";
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
			
			$query = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`mobile_number`='$mobile_no'");
			if ($query->num_rows() > 0)
			{
				
				$user_id = $query->row()->id;
				$fields['password'] = $new_password;
				$this->db->where(['id'=>$user_id])->update('user_details', $fields);
				$res['msg'] = "Password has been changed successfully.";
				success_response($res);
			}
			else
			{
				$res = "Mobile number not found.";
				fail_response($res);
			}
		}
		
		
		
		public function product_total()
		{
			$products =post('products');
			$laundry_id =post('laundry_id');
			$user_id =post('user_id');
			$delivery_lat =post('delivery_lat');
			$delivery_long =post('delivery_long');
			$delivery_address =post('delivery_address');
			$pickup_date =post('pickup_date');
			$pickup_time =post('pickup_time');
			
			$paid_wallet_amt =post('paid_wallet_amt');
			$paid_online_amt =post('paid_online_amt');
			$paid_cash_amt =post('paid_cash_amt');
			
			is_blank(trim($products),"Products");
			is_blank($laundry_id,"Laundry Id");
			is_user_not($user_id);
			is_blank($delivery_lat,"Delivery Let");
			is_blank($delivery_long,"Delivery Long");
			is_blank($delivery_address,"Delivery Address");
			is_blank($pickup_date,"Pickup Date");
			is_blank($pickup_time,"Pickup Time");
			is_blank($paid_wallet_amt,"Pay by Wallet Amount");
			is_blank($paid_online_amt,"Pay by Online Amount");
			is_blank($paid_cash_amt,"Pay by Case Amount");
			
			
			$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
			if ($userData->num_rows() <= 0)
			{
				$res = "User Id not found.";
				fail_response($res);
			}
			
			$laundryData = $this->db->query("SELECT `loundry_list`.*,`country_list`.`country_name` AS `country_name` ,
			`country_list`.`currency_name` AS `currency_name`,
			`country_list`.`country_phone_code` AS `country_phone_code`,
			`country_list`.`currency_symbol` AS `c_symbol`
			FROM `loundry_list`
			LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`='$laundry_id'");
			if ($laundryData->num_rows() <= 0)
			{
				$res = "Laundry Id not found.";
				fail_response($res);
			}
			
			
			$total =0;
			$offer_total = 0;
			$total_qty = 0;
			$products_array = explode(",",$products);
			foreach ($products_array as $key => $product)
			{
				$productData = explode("_",$product);
				$productId = $productData[0];
				$productQty = $productData[1];
				
				$prod_data = $this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`=".$productId." AND `loundry_item_list`.`status`=1");
				
				if($prod_data->num_rows() > 0)
				{
					$total = $total+ ($productQty*$prod_data->row()->item_price);
					$offer_total = $offer_total+ ($productQty*$prod_data->row()->item_offer_price);
					$total_qty = $total_qty+ $productQty;
				}
				else
				{
					$res = "Product data not found.";
					fail_response($res);
				}
			}
			
			
			
			
			
			
			$fields['user_id'] = $userData->row()->id;
			$fields['user_name'] = $userData->row()->full_name;
			$fields['user_mobile_no'] = $userData->row()->mobile_number;
			$fields['user_email_id'] = $userData->row()->email_id;
			$fields['delivery_lat'] = $delivery_lat;
			$fields['delivery_long'] = $delivery_long;
			$fields['delivery_address'] = $delivery_address;
			$fields['pickup_date'] = $pickup_date;
			$fields['pickup_time'] = $pickup_time;
			$fields['placed_time'] = date("Y-m-d h:i:s");
			$fields['pickup_otp'] = otpcode(4);
			$fields['total_item_price'] = $total;
			$fields['tax_percent'] = $total;
			$fields['tax_amt'] = $total;
			$fields['total_amt'] = $total;
			$fields['paid_by_promo'] = 0;
			
			
			$fields['paid_by_wallet'] = $paid_wallet_amt;
			$fields['paid_by_online'] = $paid_online_amt;
			$fields['paid_by_cash'] = $paid_cash_amt;
			$fields['invoice_date'] = date("Y-m-d h:i:s");
			$fields['invoice_number'] = otpcode(15);
			$fields['vendor_id'] = $laundryData->row()->id;
			$fields['vendor_name'] = $laundryData->row()->vendor_name;
			$fields['vendor_mobile_no'] = $laundryData->row()->contact_number;
			$fields['vendor_lat'] = $laundryData->row()->vendor_lat;
			$fields['vendor_long'] = $laundryData->row()->vendor_long;
			$fields['vendor_address'] = $laundryData->row()->vendor_gps_address;
			$fields['country_id'] = $laundryData->row()->country_id;
			$fields['country_name'] = $laundryData->row()->country_name;
			$fields['country_code'] = $laundryData->row()->country_phone_code;
			$fields['currency_name'] = $laundryData->row()->currency_name;
			$fields['currency_symbol'] = $laundryData->row()->c_symbol;
			$fields['vendor_image'] = $laundryData->row()->vendor_image;
			$fields['booking_status'] = 0;
			$fields['pickup_boy_id'] = "";
			$fields['drop_boy_id'] = "";
			$fields['online_transaction_id'] = post('online_transaction_id');
			$this->db->insert('booking_list', $fields);
			$booking_id = $this->db->insert_id();
			
			
			
			foreach ($products_array as $key => $product)
			{
				$productData = explode("_",$product);
				$productId = $productData[0];
				$productQty = $productData[1];
				
				$prod_data = $this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`=".$productId." AND `loundry_item_list`.`status`=1");
				
				if($prod_data->num_rows() > 0)
				{
					$total = $total+ ($productQty*$prod_data->row()->item_price);
					$offer_total = $offer_total+ ($productQty*$prod_data->row()->item_offer_price);
					$total_qty = $total_qty+ $productQty;
					
					
					
					$prod_fields['booking_id'] = $booking_id;
					$prod_fields['item_id'] = $prod_data->row()->id;
					$prod_fields['item_name'] = $prod_data->row()->item_name;
					$prod_fields['unit_id'] = $prod_data->row()->unit_id;
					$prod_fields['unit_name'] = $prod_data->row()->unit_name;
					$prod_fields['country_id'] = $prod_data->row()->country_id;
					$prod_fields['item_description'] = $prod_data->row()->item_description;
					$prod_fields['price'] = $prod_data->row()->item_price;
					$prod_fields['offer_price'] = $prod_data->row()->item_offer_price;
					$prod_fields['qty'] = $productQty;
					$prod_fields['total_amount'] = ($productQty*$prod_data->row()->item_price);
					$prod_fields['category_name'] = $prod_data->row()->category_id;
					//$prod_fields['category_id'] = intval(trim($prod_data->row()->category_id));
					$prod_fields['category_id'] = 1;
					$prod_fields['added_date_time'] = date("Y-m-d h:i:s");;
					$prod_fields['tax_percent'] = $prod_data->row()->tax;
					$prod_fields['tax_amt'] = $prod_data->row()->tax;
					
					$this->db->insert('booking_list_item', $prod_fields);
				}
				else
				{
					$res = "Product data not found.";
					fail_response($res);
				}
			}
			
			
			$res["total"] = $total;
			$res["offer_total"] = $offer_total;
			$res["total_qty"] = $total_qty;
			$res["invoice_number"] = $fields['invoice_number'];
			$res["booking_id"] = $booking_id;
			success_response($res);
			
		}
		public function getCartDetails()
		{
			$products =post('products');
			$time_slot_id =post('time_slot_id');
			$drop_time_slot_id =post('drop_time_slot_id');
			$pickup_date =post('pickup_date');
			$pickup_time =post('pickup_time');
			
			$drop_date =post('drop_date');
			$drop_time =post('drop_time');
			
			$user_id =post('user_id');
			$laundry_id =post('laundry_id');
			$delivery_typeok =post('delivery_type');
			$delivery_by =post('delivery_by');
			
			$is_found=0;
			is_blank(trim($products),"Products");
			is_blank($laundry_id,"Laundry Id");
			is_user_not($user_id);
			
			
			$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
			`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
			LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
			
			
			$rowlaundry = $laundry->row();
			$currency_name	= $rowlaundry->currency_name;
			$currency_symbol	= $rowlaundry->currency_symbol;
			//echo $currency_symbol;
			
			
			$pickup_time_to="";
			$pickup_date_time="";
			$arrtimedata = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`id`=".$time_slot_id."");
			if($arrtimedata->num_rows() > 0)
			{
				$pickup_time =$arrtimedata->row()->org_slot_time;
				$pickup_time_to=$arrtimedata->row()->org_time_slot_to;
			}
			else
			{
				$pickup_time_to=$pickup_time;
			}
			
			$pickup_date_time=$pickup_date." ".$pickup_time;
			$drop_time_to="";
			$arrtimedata = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`id`=".$drop_time_slot_id."");
			if($arrtimedata->num_rows() > 0)
			{
				$drop_time =$arrtimedata->row()->org_slot_time;
				$drop_time_to=$arrtimedata->row()->org_time_slot_to;
			}
			else
			{
				$drop_time_to=$drop_time;
			}
			$total =0;
			$offer_total = 0;
			$total_item_price = 0;
			$total_text_amt = 0;
			
			
			$increased_product=0;
			$increased_product_type="Fixed";
			$increased_product_operation="plus";
			$apon="Products";
			$inc_prod = $this->db->query("SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".date("Y-m-d H:i:s")."' AND `increase_decrease`.`to_date_time`>='".date("Y-m-d H:i:s")."'");
			if($inc_prod->num_rows() > 0)
			{
				$increased_product=$inc_prod->row()->amount;
				$increased_product_type=$inc_prod->row()->amount_type;
				$increased_product_operation=$inc_prod->row()->increase_decrease;
			}
			
			$products_array = explode(",",$products);
			$productarray=[];
			$productarray2=[];
			$is_type_bucket="0";
			
			foreach ($products_array as $key => $product)
			{
				$productData = explode("_",$product);
				$productId = $productData[0];
				$productQty = $productData[1];
				
				$productsok = $this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name`,`loundry_list`.`vendor_name` AS `vendor_name`,`loundry_list`.`vendor_display_address` AS `display_address` FROM `loundry_item_list`
				LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
				LEFT JOIN `loundry_list` ON `loundry_item_list`.`vendor_id`=`loundry_list`.`id`
				LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
				LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` WHERE `loundry_item_list`.`id`=".$productId." AND `loundry_item_list`.`status`=1");
				
				
				if($productsok->num_rows()>0)
				{
					foreach ($productsok->result_array() as $key => $product)
					{
						$is_found++;
						
						//--start
						$item_price=$product['item_offer_price'];
						$mrp=$product['item_price'];
						if($increased_product>0)
						{
							$item_price=get_amount_inc($item_price,$increased_product_operation,$increased_product,$increased_product_type);
							$mrp=get_amount_inc($mrp,$increased_product_operation,$increased_product,$increased_product_type);
						}
						$total_item_price = $total_item_price +($productQty*$item_price);
						$text_amount = $productQty * (($item_price * $product['tax'])/100);
						$total_text_amt =$total_text_amt+ $text_amount;
						$total = $total+ $text_amount + ($productQty*$item_price);
						
						//--end
						
						
						$productres['product_id'] 	= $product['id'];
						$productres['product_name'] 	= $product['item_name'];
						$productres['product_description'] 	= $product['item_description'];
						$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
						$productres['product_laundry_id'] 	= $product['vendor_id'];
						$productres['product_laundry_name'] 	= $product['vendor_name'];
						$productres['product_laundry_display_address'] 	= "";
						$productres['product_laundry_is_type_bucket'] 	= $product['is_type_bucket'];
						if($product['is_type_bucket']=="0")
						{
							$productres['product_price'] 	= "".round($mrp);
							$productres['offer_price'] 	= "".round($item_price);
						}
						else
						{
							$is_type_bucket="1";
							$productres['product_price'] 	= 0;
							$productres['offer_price'] 	= 0;
						}
						
						$productres['qty'] 	=$productQty;
						$productres['total_amount'] 	=round(($productQty*$item_price))."";
						
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
				
				
			}
			$res["product_list"] = $productarray;
			$apon="Overall";
			$total_addon="0";
			$total_item_price2=$total_item_price;
			
			
			$laundry_row=gettablerow($laundry_id,"loundry_list","id");
			
			$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
			`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
			LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
			$rowlaundry = $laundry->row();
			if($delivery_by!="Self")
			{
				if($delivery_typeok=="Normal")
				{
					$delivery_type="Normal Delivery";
					$min_hours=$laundry_row->normal_delivery_hours;
					$delivery_charge_org=$laundry_row->normal_delivery_charge;
					$delivery_charge="Applicable Delivery Charge";
					
					$delivery_type_message="Normal Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				else
				{
					
					$min_hours=$laundry_row->express_delivery_hours;
					$delivery_type="Express Delivery";
					$delivery_charge_org=$laundry_row->express_delivery_charge;
					$delivery_charge="Applicable Delivery Charge";
					$delivery_type_message="Express Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
			}
			else {
				if($delivery_typeok=="Normal")
				{
					$delivery_type="Normal Service";
					$min_hours=$laundry_row->normal_delivery_hours;
					$delivery_charge_org="0";
					$delivery_charge="Applicable Delivery Charge";
					
					$delivery_type_message="Normal Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				else
				{
					
					$min_hours=$laundry_row->express_delivery_hours;
					$delivery_type="Express Service";
					$delivery_charge_org="0";
					$delivery_charge="Applicable Delivery Charge";
					$delivery_type_message="Express Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				
				
				// code...
			}
			
			
			
			
			
			
			//echo "SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".$pickup_date_time."' AND `increase_decrease`.`to_date_time`>='".$pickup_date_time."'";
			//return;
			//echo "SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".$pickup_date_time."' AND `increase_decrease`.`to_date_time`>='".$pickup_date_time."'";
			//echo "SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".$pickup_date_time."' AND `increase_decrease`.`to_date_time`>='".$pickup_date_time."'";
			//echo "SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".$pickup_date_time."' AND `increase_decrease`.`to_date_time`>='".$pickup_date_time."'";
			$productsok = $this->db->query("SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".$pickup_date_time."' AND `increase_decrease`.`to_date_time`>='".$pickup_date_time."'");
			if($productsok->num_rows()>0)
			{
				foreach ($productsok->result_array() as $key => $product2)
				{
					
					$productres2['addon_id'] 	= $product2['id'];
					$productres2['title'] 	= $product2['title'];
					$productres2['increase_decrease'] 	= $product2['increase_decrease'];
					$productres2['amount_type'] 	= $product2['amount_type'];
					$productres2['amount'] 	= $product2['amount'];
					$productres2['applicable_on'] 	= $product2['applicable_on'];
					$productres2['currency_name'] 	= $currency_name;
					$productres2['currency_symbol'] 	= $currency_symbol;
					
					$inc_amt=get_amount_inc2($total_item_price2,$product2['increase_decrease'],$product2['amount'],$product2['amount_type']);
					
					if($product2['increase_decrease']=="plus")
					{
						$productres2['addon_amount'] 	= get_round($inc_amt,2)."";
						$productres2['total_item_price'] 	=get_round($total_item_price2,2)."";
						
						//echo $inc_amt;
						$total=$total+get_round($inc_amt,2);
						$total_addon=$total_addon+get_round($inc_amt,2);
					}
					else {
						$productres2['addon_amount'] 	= get_round($inc_amt,2)."";
						$productres2['total_item_price'] 	=get_round($total_item_price2,2)."";
						$total=$total-get_round($inc_amt,2);
						
						$total_addon=$total_addon-get_round($inc_amt,2);
						// code...
					}
					$productarray2[] = $productres2;
				}
				
			}
			
			$res["addon_list"] = $productarray2;
			$res["is_type_bucked"] = $is_type_bucket;
			
			$res['min_hours'] = $min_hours;
			$res['delivery_type'] = $delivery_type;
			$res['currency_name'] =$currency_name;
			$res['currency_symbol'] =$currency_symbol;
			
			$res['delivery_charge_org'] = $delivery_charge_org;
			$res['delivery_charge_label'] = $delivery_charge;
			$res['delivery_type_message'] = $delivery_type_message;
			$res['delivery_charge_org'] = get_round($delivery_charge_org,2)."";
			$total=$total+$delivery_charge_org;
			$res['total_item_price'] = get_round($total_item_price,2)."";
			$res['total_tax_amt'] = get_round($total_text_amt,2)."";
			$res['total_addon'] = get_round($total_addon,2)."";
			$res['total'] = get_round($total,2)."";
			
			$res['msg'] = "Data found Successfully .";
			success_response($res);
			
			
			
			
			
			
			
		}
		
		
		public function book_order()
		{
			$laundry_id =post('laundry_id');//ok
			$products =post('products');//ok
			$pickup_type =post('pickup_type');//ok
			$service_type =post('service_type');//ok
			$delivery_typeok=$service_type;
			$delivery_by=$pickup_type;
			$time_slot_id =post('time_slot_id');//ok
			$drop_time_slot_id =post('drop_time_slot_id');//ok
			$pickup_date =post('pickup_date');//ok
			$pickup_time =post('pickup_time');//ok
			
			
			$drop_date =post('drop_date');//ok
			$drop_time =post('drop_time');//ok
			
			$user_id =post('user_id');//ok
			$address_id =post('address_id');//ok
			/*$delivery_lat =post('delivery_lat');
				$delivery_long =post('delivery_long');
			$delivery_address =post('delivery_address');*/
			
			$pickup_time_to ="";
			
			
			
			$paid_wallet_amt =post('paid_wallet_amt');//ok
			$paid_online_amt =post('paid_online_amt');//ok
			$paid_cash_amt =post('paid_cash_amt');//ok
			
			is_blank(trim($products),"Products");
			is_blank($laundry_id,"Laundry Id");
			is_user_not($user_id);
			
			is_blank($address_id,"Delivery Address id");
			//	is_blank($time_slot_id,"Time Slot");
			is_blank($pickup_date,"Pickup Date");
			is_blank($pickup_time,"Pickup Time");
			
			
			
			is_blank($paid_wallet_amt,"Pay by Wallet Amount");
			is_blank($paid_online_amt,"Pay by Online Amount");
			is_blank($paid_cash_amt,"Pay by Case Amount");
			
			$pickup_time_to="";
			$pickup_time_label="";
			$pickup_date_time="";
			$drop_date_time="";
			$drop_time_label="";
			
			$arrtimedata = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`id`=".$time_slot_id."");
			if($arrtimedata->num_rows() > 0)
			{
				$pickup_time =$arrtimedata->row()->org_slot_time;
				$pickup_time_label =$arrtimedata->row()->display_slot_time." To ".$arrtimedata->row()->display_time_slot_to;
				$pickup_time_to=$arrtimedata->row()->org_time_slot_to;
			}
			else
			{
				$pickup_time_to=$pickup_time;
				$pickup_time_label =$pickup_time;
			}
			
			$pickup_date_time=$pickup_date." ".$pickup_time;
			$drop_time_to="";
			$arrtimedata = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`id`=".$drop_time_slot_id."");
			if($arrtimedata->num_rows() > 0)
			{
				$drop_time =$arrtimedata->row()->org_slot_time;
				$drop_time_label =$arrtimedata->row()->display_slot_time." To ".$arrtimedata->row()->display_time_slot_to;
				$drop_time_to=$arrtimedata->row()->org_time_slot_to;
			}
			else
			{
				$drop_time_to=$drop_time;
			}
			
			$drop_date_time=$drop_date." ".$drop_time_to;
			
			$userData = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
			if ($userData->num_rows() <= 0)
			{
				$res = "User Id not found.";
				fail_response($res);
			}
			
			$addressData = $this->db->query("SELECT * FROM `address_list` WHERE `address_list`.`id`='$address_id'");
			if ($addressData->num_rows() <= 0)
			{
				$res = "Address Id not found.";
				fail_response($res);
				}else{
				$delivery_lat =$addressData->row()->lat;
				$delivery_long =$addressData->row()->long;
				$delivery_address =$addressData->row()->google_addres;
				
			}
			
			$laundryData = $this->db->query("SELECT `loundry_list`.*,`country_list`.`country_name` AS `country_name` ,
			`country_list`.`currency_name` AS `currency_name`,
			`country_list`.`country_phone_code` AS `country_phone_code`,
			`country_list`.`currency_symbol` AS `c_symbol`
			FROM `loundry_list`
			LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`='$laundry_id'");
			if ($laundryData->num_rows() <= 0)
			{
				$res = "Laundry Id not found.";
				fail_response($res);
			}
			$rowlaundry = $laundryData->row();
			$laundry_row = $laundryData->row();
			
			
			if($delivery_by!="Self")
			{
				if($delivery_typeok=="Normal")
				{
					$delivery_type="Normal Delivery";
					$min_hours=$laundry_row->normal_delivery_hours;
					$delivery_charge_org=$laundry_row->normal_delivery_charge;
					$delivery_charge="Applicable Delivery Charge";
					
					$delivery_type_message="Normal Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				else
				{
					
					$min_hours=$laundry_row->express_delivery_hours;
					$delivery_type="Express Delivery";
					$delivery_charge_org=$laundry_row->express_delivery_charge;
					$delivery_charge="Applicable Delivery Charge";
					$delivery_type_message="Express Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
			}
			else {
				if($delivery_typeok=="Normal")
				{
					$delivery_type="Normal Service";
					$min_hours=$laundry_row->normal_delivery_hours;
					$delivery_charge_org="0";
					$delivery_charge="Applicable Delivery Charge";
					
					$delivery_type_message="Normal Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				else
				{
					
					$min_hours=$laundry_row->express_delivery_hours;
					$delivery_type="Express Service";
					$delivery_charge_org="0";
					$delivery_charge="Applicable Delivery Charge";
					$delivery_type_message="Express Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				
				
				// code...
			}
			
			
			
			
			$increased_product=0;
			$increased_product_type="Fixed";
			$increased_product_operation="plus";
			$apon="Products";
			$inc_prod = $this->db->query("SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".date("Y-m-d H:i:s")."' AND `increase_decrease`.`to_date_time`>='".date("Y-m-d H:i:s")."'");
			if($inc_prod->num_rows() > 0)
			{
				$increased_product=$inc_prod->row()->amount;
				$increased_product_type=$inc_prod->row()->amount_type;
				$increased_product_operation=$inc_prod->row()->increase_decrease;
			}
			
			$total =0;
			$offer_total = 0;
			$total_item_price = 0;
			
			
			$total_qty = 0;
			$total_text_amt = 0;
			$products_array = explode(",",$products);
			foreach ($products_array as $key => $product)
			{
				$productData = explode("_",$product);
				$productId = $productData[0];
				$productQty = $productData[1];
				
				$prod_data = $this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`=".$productId." AND `loundry_item_list`.`status`=1");
				if($prod_data->num_rows() > 0)
				{
					$item_price=$prod_data->row()->item_offer_price;
					if($increased_product>0)
					{
						$item_price=get_amount_inc($item_price,$increased_product_operation,$increased_product,$increased_product_type);
					}
					$total_item_price = $total_item_price +($productQty*$item_price);
					$text_amount = $productQty * (($item_price * $prod_data->row()->tax)/100);
					$total_text_amt =$total_text_amt+ $text_amount;
					$total = $total+ $text_amount + ($productQty*$item_price);
					
				}
				else
				{
					$res = "Product data not found.";
					fail_response($res);
				}
			}
			$total=$total+$delivery_charge_org;
			
			
			$apon="Overall";
			$total_addon="0";
			$total_item_price2=$total_item_price;
			
			//---get addon charges if any
			$productsok = $this->db->query("SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".$pickup_date_time."' AND `increase_decrease`.`to_date_time`>='".$pickup_date_time."'");
			if($productsok->num_rows()>0)
			{
				foreach ($productsok->result_array() as $key => $product2)
				{
					
					$inc_amt=get_amount_inc2($total_item_price2,$product2['increase_decrease'],$product2['amount'],$product2['amount_type']);
					if($product2['increase_decrease']=="plus")
					{
						//echo $inc_amt;
						$total=$total+round($inc_amt);
						$total_addon=$total_addon+round($inc_amt);
					}
					else {
						$total=$total-round($inc_amt);
						$total_addon=$total_addon-round($inc_amt);
						// code...
					}
				}
				
			}
			//end addon charges
			
			
			$fields['user_id'] = $userData->row()->id;
			$fields['user_name'] = $userData->row()->full_name;
			$fields['user_mobile_no'] = $userData->row()->mobile_number;
			$fields['user_email_id'] = $userData->row()->email_id;
			$fields['delivery_lat'] = $delivery_lat;
			$fields['delivery_long'] = $delivery_long;
			$fields['delivery_address'] = $delivery_address;
			$fields['pickup_date'] = $pickup_date;
			$fields['pickup_time'] = $pickup_time;
			$fields['time_slot_id'] = $time_slot_id;
			$fields['pickup_time_to'] = $pickup_time_to;
			$fields['pickup_time_slot_label'] = $pickup_time_label;
			$fields['pickup_time_org'] = $pickup_date_time;
			$fields['delivery_charge'] = $delivery_charge_org;
			
			$fields['drop_slot_date'] = $drop_date;
			$fields['drop_slot_time'] = $drop_time;
			$fields['drop_time_slot_label'] = $drop_time_label;
			$fields['drop_slot_time_org'] = $drop_date_time;
			$fields['drop_slot_time_to'] = $drop_time_to;
			$fields['drop_slot_id'] = $drop_time_slot_id;
			
			$fields['service_type'] = $service_type;
			$fields['pickup_type'] = $pickup_type;
			
			
			
			
			$fields['placed_time'] = date("Y-m-d H:i:s");
			$fields['pickup_otp'] = otpcode(4);
			$fields['drop_otp'] = otpcode(4);
			$fields['total_item_price'] = $total_item_price;
			$fields['tax_percent'] = "0";
			$fields['tax_amt'] = $total_text_amt;
			$fields['total_addon'] = $total_addon;
			$fields['total_amt'] = number_format($total, 2);
			$fields['paid_by_promo'] = 0;
			$fields['delivery_address_id'] = $address_id;
			$fields['paid_by_wallet'] = $paid_wallet_amt;
			$fields['paid_by_online'] = $paid_online_amt;
			$fields['paid_by_cash'] = $paid_cash_amt;
			$fields['skip_for_pay'] = round($total-($paid_wallet_amt+$paid_online_amt+$paid_cash_amt),2);
			
			$fields['invoice_date'] = date("Y-m-d H:i:s");
			$fields['invoice_number'] = otpcode(15);
			$fields['vendor_id'] = $laundryData->row()->id;
			$fields['vendor_name'] = $laundryData->row()->vendor_name;
			$fields['vendor_mobile_no'] = $laundryData->row()->contact_number;
			$fields['vendor_lat'] = $laundryData->row()->vendor_lat;
			$fields['vendor_long'] = $laundryData->row()->vendor_long;
			$fields['vendor_address'] = $laundryData->row()->vendor_gps_address;
			$fields['country_id'] = $laundryData->row()->country_id;
			$fields['country_name'] = $laundryData->row()->country_name;
			$fields['country_code'] = $laundryData->row()->country_phone_code;
			$fields['currency_name'] = $laundryData->row()->currency_name;
			$fields['currency_symbol'] = $laundryData->row()->c_symbol;
			$fields['vendor_image'] = $laundryData->row()->vendor_image;
			$fields['booking_status'] = 0;
			$fields['pickup_boy_id'] = "";
			$fields['pickup_boy_name'] = "";
			$fields['pickup_boy_number'] = "";
			$fields['drop_boy_id'] = "";
			$fields['drop_boy_name'] = "";
			$fields['drop_boy_number'] = "";
			$fields['online_transaction_id'] = post('online_transaction_id');
			$this->db->insert('booking_list', $fields);
			$booking_id = $this->db->insert_id();
			
			
			//--Insert Addons
			$productsok = $this->db->query("SELECT * FROM `increase_decrease` WHERE `increase_decrease`.`vendor_id`=".$laundry_id." AND `increase_decrease`.`status`=1 AND  `increase_decrease`.`applicable_on`='".$apon."' AND `increase_decrease`.`from_date_time`<='".$pickup_date_time."' AND `increase_decrease`.`to_date_time`>='".$pickup_date_time."'");
			if($productsok->num_rows()>0)
			{
				foreach ($productsok->result_array() as $key => $product2)
				{
					
					$fields2['booking_id'] 	= $booking_id;
					$fields2['added_date_time'] 	= date("Y-m-d H:i:s");
					$fields2['addon_id'] 	= $product2['id'];
					$fields2['title'] 	= $product2['title'];
					$fields2['increase_decrease'] 	= $product2['increase_decrease'];
					$fields2['amount_type'] 	= $product2['amount_type'];
					$fields2['amount'] 	= $product2['amount'];
					$fields2['applicable_on'] 	= $product2['applicable_on'];
					$inc_amt=get_amount_inc2($total_item_price2,$product2['increase_decrease'],$product2['amount'],$product2['amount_type']);
					
					if($product2['increase_decrease']=="plus")
					{
						$fields2['addon_amount'] 	= round($inc_amt);
						//echo $inc_amt;
						//$total=$total+round($inc_amt);
						//$total_addon=$total_addon+round($inc_amt);
					}
					else {
						$fields2['addon_amount'] 	= round($inc_amt);
						//$total=$total-round($inc_amt);
						//$total_addon=$total_addon+round($inc_amt);
						// code...
					}
					$this->db->insert('addon_charges_in_booking', $fields2);
				}
				
			}
			
			//-- end insert addons
			
			
			
			
			
			foreach ($products_array as $key => $product)
			{
				$productData = explode("_",$product);
				$productId = $productData[0];
				$productQty = $productData[1];
				$prod_data = $this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`=".$productId." AND `loundry_item_list`.`status`=1");
				if($prod_data->num_rows() > 0)
				{
					$item_price=$prod_data->row()->item_offer_price;
					$mrp=$prod_data->row()->item_price;
					if($increased_product>0)
					{
						$item_price=get_amount_inc($item_price,$increased_product_operation,$increased_product,$increased_product_type);
						$mrp=get_amount_inc($mrp,$increased_product_operation,$increased_product,$increased_product_type);
					}
					
					$text_amount = $productQty * (($item_price * $prod_data->row()->tax)/100);
					$total_amt = $text_amount + ($productQty*$item_price);
					$prod_fields['booking_id'] = $booking_id;
					$prod_fields['item_id'] = $prod_data->row()->id;
					$prod_fields['item_name'] = $prod_data->row()->item_name;
					$prod_fields['unit_id'] = $prod_data->row()->unit_id;
					$prod_fields['unit_name'] = $prod_data->row()->unit_name;
					$prod_fields['country_id'] = $prod_data->row()->country_id;
					$prod_fields['item_description'] = $prod_data->row()->item_description;
					$prod_fields['price'] = $mrp;
					$prod_fields['offer_price'] = $item_price;
					$prod_fields['qty'] = $productQty;
					$prod_fields['total_amount'] = $total_amt;
					$prod_fields['is_type_bucket'] = $prod_data->row()->is_type_bucket;
					$prod_fields['bucket_id'] ="0";
					$prod_fields['inc_amount'] = $increased_product;
					$prod_fields['inc_type'] = $increased_product_type;
					$prod_fields['inc_operation'] = $increased_product_operation;
					$prod_fields['category_name'] = $prod_data->row()->category_id;
					//$prod_fields['category_id'] = intval(trim($prod_data->row()->category_id));
					$prod_fields['category_id'] = 1;
					$prod_fields['added_date_time'] = date("Y-m-d h:i:s");;
					$prod_fields['tax_percent'] = $prod_data->row()->tax;
					$prod_fields['tax_amt'] = $text_amount;
					$this->db->insert('booking_list_item', $prod_fields);
				}
				else
				{
					$res = "Product data not found.";
					fail_response($res);
				}
			}
			
			$res['msg'] = "Booking Successfully Done.";
			$res["total"] = number_format($total, 2);
			$res["offer_total"] = $offer_total;
			$res["total_qty"] = $total_qty;
			$res["invoice_number"] = $fields['invoice_number'];
			$res["booking_id"] = $booking_id;
			$device_token=$userData->row()->device_token;
			if($device_token!=null && $device_token!="")
			{
				send_notification_ul($device_token,"Order","Order Placed Successfully.","Your Order id #".$booking_id." has been placed successfully.",$booking_id,"");
			}
			
			$device_token=$laundryData->row()->device_token;
			if($device_token!=null && $device_token!="")
			{
				send_notification_ul($device_token,"Order","New Order Available.","New Order id #".$booking_id." is available for confirmation.",$booking_id,"");
			}
			
			
			
			success_response($res);
			
		}
		
		
		public function add_address()
		{
			$user_id =post('user_id');
			$contect_persion =post('contect_persion');
			$mobile =post('mobile');
			
			is_blank(trim($user_id),"User Id");
			is_user_not($user_id);
			is_blank($contect_persion,"Contect Persion");
			is_blank($mobile,"Mobile");
			
			$fields['user_id'] = post('user_id');
			$fields['user_name'] = post('contect_persion');
			$fields['mobile'] = post('mobile');
			$fields['lat'] = post('address_lat');
			$fields['long'] = post('address_long');
			$fields['google_addres'] = post('google_address');
			$fields['house_no'] = post('house_no');
			$fields['street_name'] = post('street');
			$fields['area'] = post('area');
			$fields['city'] = post('city');
			$fields['state'] = post('state');
			$fields['pincode'] = post('pin_code');
			$fields['landmark'] = post('landmark');
			$fields['date'] = date("Y-m-d");
			$fields['date_time'] =date("Y-m-d h:i:s");
			$fields['status'] = 1;
			$this->db->insert('address_list', $fields);
			$address_id = $this->db->insert_id();
			$res['msg'] = "Address Added Successfully Done.";
			$res["address_id"] = $address_id;
			
			success_response($res);
			
		}
		
		
		public function address_list()
		{
			$user_id =post('user_id');
			is_blank(trim($user_id),"User Id");
			is_user_not($user_id);
			
			$query = $this->db->query("SELECT * FROM `address_list` WHERE `address_list`.`status`=1 AND `address_list`.`user_id`='$user_id'");
			$array=[];
			foreach ($query->result_array() as $key => $rowinfo)
			{
				$response['address_id'] = $rowinfo['id'];
				$response['user_id'] = $rowinfo['user_id'];
				$response['address_lat'] 	= $rowinfo['lat'];
				$response['address_long'] = $rowinfo['long'];
				$response['google_address'] 	= $rowinfo['google_addres'];
				$response['contect_persion'] = $rowinfo['user_name'];
				$response['mobile'] 	= $rowinfo['mobile'];
				$response['house_no'] = $rowinfo['house_no'];
				$response['street'] 	= $rowinfo['street_name'];
				$response['area'] = $rowinfo['area'];
				$response['city'] 	= $rowinfo['city'];
				$response['state'] = $rowinfo['state'];
				$response['pin_code'] 	= $rowinfo['pincode'];
				$response['landmark'] = $rowinfo['landmark'];
				$response['added_date'] = $rowinfo['date_time'];
				
				$array[] = $response;
			}
			$result["address_list"] = $array;
			$result['msg'] = "Address List Done.";
			
			success_response($result);
		}
		
		public function address_details()
		{
			$address_id =post('address_id');
			is_blank(trim($address_id),"Address Id");
			
			$query = $this->db->query("SELECT * FROM `address_list` WHERE `address_list`.`status`=1 AND `address_list`.`id`='$address_id'");
			if ($query->num_rows()>0) {
				$rowinfo = $query->row_array();
				
				$response['address_id'] = $rowinfo['id'];
				$response['user_id'] = $rowinfo['user_id'];
				$response['address_lat'] 	= $rowinfo['lat'];
				$response['address_long'] = $rowinfo['long'];
				$response['google_address'] 	= $rowinfo['google_addres'];
				$response['contect_persion'] = $rowinfo['user_name'];
				$response['mobile'] 	= $rowinfo['mobile'];
				$response['house_no'] = $rowinfo['house_no'];
				$response['street'] 	= $rowinfo['street_name'];
				$response['area'] = $rowinfo['area'];
				$response['city'] 	= $rowinfo['city'];
				$response['state'] = $rowinfo['state'];
				$response['pin_code'] 	= $rowinfo['pincode'];
				$response['landmark'] = $rowinfo['landmark'];
				$response['added_date'] = $rowinfo['date_time'];
				
				$result['address_data'] = $response;
				$result['msg'] = "Address Data Done.";
				success_response($result);
				
				}else{
				$result['msg'] = "Address Data not found.";
				fail_response($result);
			}
		}
		
		public function update_address()
		{
			$address_id =post('address_id');
			$contect_persion =post('contect_persion');
			$mobile =post('mobile');
			
			
			is_blank(trim($address_id),"Address Id");
			is_blank($contect_persion,"Contect Persion");
			is_blank($mobile,"Mobile");
			
			$query = $this->db->query("SELECT * FROM `address_list` WHERE `address_list`.`status`=1 AND `address_list`.`id`='$address_id'");
			if ($query->num_rows()>0) {
				
				$fields['user_name'] = post('contect_persion');
				$fields['mobile'] = post('mobile');
				$fields['lat'] = post('address_lat');
				$fields['long'] = post('address_long');
				$fields['google_addres'] = post('google_address');
				$fields['house_no'] = post('house_no');
				$fields['street_name'] = post('street');
				$fields['area'] = post('area');
				$fields['city'] = post('city');
				$fields['state'] = post('state');
				$fields['pincode'] = post('pin_code');
				$fields['landmark'] = post('landmark');
				
				
				$this->db->where(['id'=>$address_id])->update('address_list', $fields);
				$res['msg'] = "Address Update Successfully Done.";
				success_response($res);
				
				}else{
				$result['msg'] = "Address ID not found.";
				fail_response($result);
			}
			
		}
		
		
		public function order_histry($value='')
		{
			$user_id =post('user_id');
			is_blank(trim($user_id),"User Id");
			is_user_not($user_id);
			
			$query = $this->db->query("SELECT `booking_list`.*,(CASE WHEN (`booking_status` = 0) THEN 'Placed'
			WHEN (`booking_status` = 1) THEN 'Confirm'
			WHEN (`booking_status` = 2) THEN 'Pickup Boy Alloted'
			WHEN (`booking_status` = 3) THEN 'Order Picked Up'
			WHEN (`booking_status` = 4) THEN 'Received At Laundry'
			WHEN (`booking_status` = 5) THEN 'Inprocess'
			WHEN (`booking_status` = 6) THEN 'Order Ready'
			WHEN (`booking_status` = 7) THEN 'Allot For Drop'
			WHEN (`booking_status` = 8) THEN 'Delivered'
			WHEN (`booking_status` = 9) THEN 'Cancelled'
			ELSE 'None' END) AS `book_status` FROM `booking_list` WHERE  `booking_list`.`user_id`='$user_id' ORDER BY id DESC");
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
				$response['pickup_date'] = date("d-M-y", strtotime($rowinfo['pickup_date']));
				$response['pickup_time'] 	= date("g:i A", strtotime($rowinfo['pickup_time']));
				if($rowinfo['pickup_time_to']!="00:00:00")
				{
					$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']))." To ".date('h:i A', strtotime($rowinfo['pickup_time_to']));
				}
				else
				{
    				$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				}
				$response['pickup_time_org'] 	= $rowinfo['pickup_time_org'];
				$response['placed_time'] = date("d-M-y g:i A", strtotime($rowinfo['placed_time']));
				
				if($rowinfo['pickup_time_to']!="00:00:00")
				{
					$response['placed_time'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ."\n ".date('h:i A', strtotime($rowinfo['pickup_time']))." To ".date('h:i A', strtotime($rowinfo['pickup_time_to']));
				}
				else
				{
    				$response['placed_time'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				}
				$response['drop_slot_date'] 	= $rowinfo['drop_slot_date'];
				$response['drop_slot_time'] 	= $rowinfo['drop_slot_time'];
				$response['drop_slot_time_org'] 	= $rowinfo['drop_slot_time_org'];
				$response['drop_time_slot_label'] 	= date('d-M-Y', strtotime($rowinfo['drop_slot_date']))." ".$rowinfo['drop_time_slot_label'];
				
				
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
				$response['pickup_type'] = $rowinfo['pickup_type'];
				$response['service_type'] = $rowinfo['service_type'];
				
				if($rowinfo['pickup_type']=="Home Delivery")
				{
					$response['pickup_type_label'] = "Pickup & Delivery Service";
				}
				else {
					$response['pickup_type_label'] = "Self Pickup & Drop";
					// code...
				}
				
				if($rowinfo['service_type']=="Normal")
				{
					$response['service_type_label'] = "Normal";
				}
				else {
					$response['service_type_label'] = "Express";
				}
				
				
				
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
				
				
				
				
				$products = $this->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`booking_id`=".$rowinfo['id']."");
				
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
						//$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
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
				$response["order_product"] = $productarray;
				
				
				$array[] = $response;
			}
			$result["order_list"] = $array;
			$result['msg'] = "Oreder List Done.";
			
			success_response($result);
		}
		
		
		public function order_details()
		{
			$order_id =post('order_id');
			is_blank(trim($order_id),"Order Id");
			
			$query = $this->db->query("SELECT `booking_list`.*,(CASE WHEN (`booking_status` = 0) THEN 'Placed'
			WHEN (`booking_status` = 1) THEN 'Confirm'
			WHEN (`booking_status` = 2) THEN 'Pickup Boy Alloted'
			WHEN (`booking_status` = 3) THEN 'Order Picked Up'
			WHEN (`booking_status` = 4) THEN 'Received At Laundry'
			WHEN (`booking_status` = 5) THEN 'Inprocess'
			WHEN (`booking_status` = 6) THEN 'Order Ready'
			WHEN (`booking_status` = 7) THEN 'Allot For Drop'
			WHEN (`booking_status` = 8) THEN 'Delivered'
			WHEN (`booking_status` = 9) THEN 'Cancelled'
			ELSE 'None' END) AS `book_status` FROM `booking_list` WHERE  `booking_list`.`id`='$order_id'");
			
			if ($query->num_rows()>0)
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
				
				// $response['pickup_time_slot_label'] = date('D d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				// if($rowinfo['pickup_time_to']!="00:00:00")
				// {
				// $response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ."\n".date('h:i A', strtotime($rowinfo['pickup_time']))." To ".date('h:i A', strtotime($rowinfo['pickup_time_to']));
				// }
				// else
				// {
				// 		$response['pickup_time_slot_label'] = date('d-M-Y', strtotime($rowinfo['pickup_date'])) ." ".date('h:i A', strtotime($rowinfo['pickup_time']));
				// }
				$response['pickup_time_slot_label'] 	= date('d-M-Y', strtotime($rowinfo['pickup_date']))." ".$rowinfo['pickup_time_slot_label'];
				$response['pickup_time_org'] 	= $rowinfo['pickup_time_org'];
				$response['drop_slot_date'] 	= $rowinfo['drop_slot_date'];
				$response['drop_slot_time'] 	= $rowinfo['drop_slot_time'];
				$response['drop_slot_time_org'] 	= $rowinfo['drop_slot_time_org'];
				$response['drop_time_slot_label'] 	= date('d-M-Y', strtotime($rowinfo['drop_slot_date']))." ".$rowinfo['drop_time_slot_label'];
				
				
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
				$response['delivery_charge'] = $rowinfo['delivery_charge'];
				$response['pickup_type'] = $rowinfo['pickup_type'];
				$response['service_type'] = $rowinfo['service_type'];
				
				if($rowinfo['pickup_type']=="Home Delivery")
				{
					$response['pickup_type_label'] = "Pickup & Delivery Service";
				}
				else {
					$response['pickup_type_label'] = "Self Pickup & Drop";
					// code...
				}
				
				if($rowinfo['service_type']=="Normal")
				{
					$response['service_type_label'] = "Normal";
				}
				else {
					$response['service_type_label'] = "Express";
				}
				
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
				
				
				$bucket_id="0";
				$uncount_bucket=0;
				//echo "SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`booking_id`=".$rowinfo['id']." and `booking_list_item`.`is_type_bucket`=".$isbucket."";
				//$products = $this->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`booking_id`=".$rowinfo['id']."  AND `booking_list_item`.`bucket_id`=".$bucket_id."");
				$products = $this->db->query("SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` AS `item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id`= `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id`=".$rowinfo['id']." and `booking_list_item`.`bucket_id`=".$bucket_id."");
				//"SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` AS `item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id`= `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id`=".$row_booking->id." and `booking_list_item`.`bucket_id`=".$bucket_id.""
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
						//$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
						$productres['item_description'] 	= $product['item_description'];
						$productres['price'] 	= $product['price'];
						$productres['offer_price'] 	= $product['offer_price'];
						$productres['qty'] 	= $product['qty'];
						
						$productres['is_type_bucket'] 	= $product['is_type_bucket'];
						if($product['is_type_bucket']=="1")
						{
							$row_bucket=get_total_item_in_bucket($product['id'],$rowinfo['id']);
							if($row_bucket['total_item']<=0)
							{
								$uncount_bucket=$uncount_bucket+$product['qty'];
							}
							$productres['total_item'] 	=$row_bucket['total_item'];
							$productres['total_amount'] 	=$row_bucket['total_item_price'];
							$productres['offer_price'] 	= $row_bucket['total_item_price'];
						}
						else {
							$productres['total_amount'] 	= $product['total_amount'];
							$productres['total_item'] 	=$product['qty'];
							// code...
						}
						
						
						$productres['product_image'] 	= base_url()."uploads/".$product['item_image'];
						$productres['total_amount'] 	= $product['total_amount'];
						$productres['category_name'] 	= $product['category_name'];
						$productres['category_id'] 	= $product['category_id'];
						$productres['currency_symbol'] 	= $rowinfo['currency_symbol'];
						$productres['tax_percent'] 	= $product['tax_percent'];
						$productres['tax_amt'] 	= $product['tax_amt'];
						
						$productarray[] = $productres;
					}
				}
				$response["order_product"] = $productarray;
				if($uncount_bucket>0)
				{
					$response['skip_for_pay_label'] = $rowinfo['skip_for_pay']." + ".$uncount_bucket." Buckets";
				}
				else {
					$response['skip_for_pay_label'] = $rowinfo['skip_for_pay'];
					// code...
				}
				$result["order_data"] = $response;
				$result['message'] = "Oreder data Done.";
				
				success_response($result);
				}else{
				$msg = "Oreder data not found.";
				fail_response($msg);
			}
			
		}
		
		
		public function cancel_order($value='')
		{
			$user_id =post('user_id');
			$order_id =post('order_id');
			$cancel_reason =post('cancel_reason');
			is_blank(trim($user_id),"User Id");
			is_user_not($user_id);
			is_blank(trim($order_id),"Order Id");
			is_blank(trim($cancel_reason),"Cancel reason");
			
			$query = $this->db->query("SELECT * FROM `booking_list` WHERE  `booking_list`.`id`='$order_id'");
			
			if ($query->num_rows()>0)
			{
				$fields['cancelled_by_id'] = $user_id;
				$fields['cancellation_reason'] = $cancel_reason;
				$fields['cancelled_time'] = date("Y-m-d h:i:s");
				$fields['booking_status'] = 9;
				$this->db->where(['id'=>$order_id])->update('booking_list', $fields);
				
				$res['msg'] = "Oreder has been cancelled successfully.";
				
				$vendor_id=$query->row()->vendor_id;
				$userData = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$vendor_id'");
				if($userData->num_rows()>0)
				{
					$device_token=$userData->row()->device_token;
					if($device_token!=null && $device_token!="")
					{
						send_notification_ul($device_token,"Order","Order Cancelled.","Your order id #".$order_id." Cancelled by Customer Due to ".$cancel_reason,$order_id,"");
					}
					
				}
				
				success_response($res);
				
				}else{
				$msg = "Oreder data not found.";
				fail_response($msg);
			}
		}
		
		public function user_details()
		{
			$user_id =post('user_id');
			is_blank(trim($user_id),"User Id");
			is_user_not($user_id);
			$query = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
			if ($query->num_rows() > 0)
			{
				$row = $query->row();
				
				$res['user_id'] = $row->id;
				$res['user_name'] = $row->full_name;
				$res['email'] = $row->email_id;
				$res['mobile'] = $row->mobile_number;
				$res['user_status'] = $row->user_status;
				$res['wallet_balance'] = $row->wallet_balance;
				$res['pincode'] = $row->pincode;
				$res['photo'] = base_url()."assets/images/".$row->photo;
				$res['msg'] = "User Details found successfully.";
				success_response($res);
			}
			
		}
		
		public function customer_recharge_wallet()
		{
			$user_id =post('user_id');
			
			$amt =post('amt');
			is_user_not($user_id);
			
			is_blank($user_id,"User Id");
			is_blank($amt,"Amount");
			
			
			$this->db->query("Update `user_details` set wallet_balance=wallet_balance+'".$amt."' where `user_details`.`id`='$user_id' ");
			$insert_id = $this->db->insert_id();
			$data['user_id'] = $user_id;
			$data['amt'] = $amt;
			$data['transaction_operation'] ="plus";
			$data['remark'] = "Wallet recharged successfully";
			$data['added_date'] = date("Y-m-d");
			$data['added_date_time'] = date("Y-m-d H:i:s");
			$data['status'] = "1";
			$data['booking_id'] = "0";
			
			$this->db->insert('wallet_transaction_user', $data);
			
			
			$res['msg'] = "Wallet recharged successfully.";
			success_response($res);
			
			
			
			
			
		}
		
		
		public function cust_get_wallet()
		{
			$user_id =post('user_id');
			is_blank(trim($user_id),"User Id");
			is_user_not($user_id);
			$query = $this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id`='$user_id'");
			if ($query->num_rows() > 0)
			{
				$row = $query->row();
				
				$res['user_id'] = $row->id;
				
				
				$laundry = $this->db->query("SELECT `user_details`.`id`  AS `user_id_tbl`,
				`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `user_details`
				LEFT JOIN `country_list` ON `user_details`.`country_id`=`country_list`.`id`  WHERE `user_details`.`id`=".$user_id."");
				
				$rowlaundry = $laundry->row();
				$res['currency_symbol'] = $rowlaundry->currency_symbol;
				$res['wallet_balance'] = $row->wallet_balance;
				
				$products = $this->db->query("SELECT * FROM `wallet_transaction_user` WHERE `wallet_transaction_user`.`user_id`=".$row->id." order by id desc");
				//"SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` AS `item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id`= `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id`=".$row_booking->id." and `booking_list_item`.`bucket_id`=".$bucket_id.""
				$productarray=[];
				if($products->num_rows()>0)
				{
					
					foreach ($products->result_array() as $key => $rowinfo)
					{
						
						$dataset['id'] 	= $rowinfo['id'];
						$dataset['transaction_operation'] 	= $rowinfo['transaction_operation'];
						$dataset['amt'] 	= get_round($rowinfo['amt'],2);
						$dataset['remark'] 	= $rowinfo['remark'];
						$dataset['added_date'] 	= date("d-M-y", strtotime($rowinfo['added_date']));
						$dataset['added_date_time'] 	= date("d-M-y h:i A", strtotime($rowinfo['added_date_time']));
						$dataset['booking_id'] 	= $rowinfo['booking_id'];
						$dataset['status'] 	= $rowinfo['status'];
						
						$productarray[] = $dataset;
					}
					$res['transaction_list'] = $productarray;
				}
				else {
					// code..
					$res['transaction_list'] =[];
				}
				
				
				
				$res['msg'] = "Data found successfully.";
				success_response($res);
			}
			
		}
		
		
		public function getSupportData()
		{
			$user_id =post('user_id');
			//is_blank(trim($user_id),"User Id");
			$query = $this->db->query("SELECT * FROM `other_details`");
			if ($query->num_rows() > 0)
			{
				$row = $query->row();
				
				$res['support_email'] = $row->support_email;
				$res['support_call_number'] = $row->support_number;
				$res['support_whatsapp_number'] = $row->support_whatsapp_number;
				
				$res['msg'] = "Success.";
				success_response($res);
			}
			
		}
		
		
		public function update_user_details()
		{
			$user_id =post('user_id');
			$pincode =post('pincode');
			
			is_blank(trim($user_id),"User Id");
			is_user_not($user_id);
			
			$full_name =post('full_name');
			is_blank(trim($full_name),"Name");
			
			$fields['full_name'] = $full_name;
			if($pincode!=null &&$pincode!="")
			{
				$fields['pincode'] = $pincode;
			}
			$image=saveImageFile('image_tag','assets/images/');
			if($image!=null && $image!="")
			{
				$fields['photo'] = $image;
			}
			
			$this->db->where(['id'=>$user_id])->update('user_details', $fields);
			$res['msg'] = "User Details update successfully.";
			success_response($res);
		}
		
		
		public function get_laundry_time_slot($value='')
		{
			
			$laundry_id =post('laundry_id');
			is_blank($laundry_id,"Laundry Id");
			
			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`vendor_status`='1'");
			//	echo "testing". "SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`vendor_status`='1'";
			if ($query->num_rows() > 0)
			{
				
				$array3=[];
				for($i=0;$i<7;$i++){
					
					$todayDay1 = date("l",strtotime(date('d-m-Y', strtotime("+".$i." day"))));
					
					$day_data = $this->db->query("SELECT * FROM `loundry_day_list` WHERE
					`loundry_day_list`.`day_name`='$todayDay1' AND `loundry_day_list`.`vendor_id`='$laundry_id' AND `loundry_day_list`.`status`='1'");
					if($day_data->num_rows()>0){
						
						$response3['day_id'] 	= $day_data->row()->id;
						$response3['day_name'] 	= $day_data->row()->day_name;
						$response3['date'] 	= date('d-m-Y', strtotime("+".$i." day"));
						$response3['date_org'] 	= date('Y-m-d', strtotime("+".$i." day"));
						$response3['day_open_time'] 	= date("g:i A", strtotime($day_data->row()->open_time));
						$response3['day_close_time'] 	= date("g:i A", strtotime($day_data->row()->close_time));
						
						
						
						
						$day_time_slot = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`day_id`=".$day_data->row()->id);
						$dayarray=[];
						
						if($day_time_slot->num_rows()>0){
							foreach ($day_time_slot->result_array() as $key => $rowinfo)
							{
								$dayres['time_slot_id'] 	= $rowinfo['id'];
								$dayres['time_slot'] 	= $rowinfo['org_slot_time'];
								$dayres['display_time_slot'] 	= $rowinfo['display_slot_time'];
								$dayres['org_time_slot_to'] 	= $rowinfo['org_time_slot_to'];
				            	$dayres['display_time_slot_to'] 	= $rowinfo['display_time_slot_to'];
					            $dayres['timeslot_label'] 	= $rowinfo['display_slot_time']." To ".$rowinfo['display_time_slot_to'];
								
								
								$dayarray[] = $dayres;
							}
						}
						$response3['time_slot'] = $dayarray;
						$array3[] = $response3;
					}
					
				}
				
				$res['day_list'] = $array3;
				$result['msg'] = "Laundry Data found.";
				success_response($res);
				}else{
				$result['msg'] = "Laundry Data not found.";
				fail_response($result);
			}
		}
		
		
		
		
		public function get_laundry_time_slot_new($value='')
		{
			
			$laundry_id =post('laundry_id');
			$delivery_typeok =post('delivery_type');
			
			is_blank($laundry_id,"Laundry Id");
			
			$min_hours=0;
			$delivery_type="";
			$delivery_type_message="";
			$delivery_charge="";
			$delivery_charge_org="";
			
			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`vendor_status`='1'");
			//	echo "testing". "SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`vendor_status`='1'";
			if ($query->num_rows() > 0)
			{
			    $laundry_row=gettablerow($laundry_id,"loundry_list","id");
				
				$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
				// 	echo "SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				// 	LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."";
				
				$rowlaundry = $laundry->row();
				//				$response2['currency_name'] 	= $rowlaundry->currency_name;
				//				$response2['currency_symbol'] 	= $rowlaundry->currency_symbol;
				
				// echo $delivery_typeok;
				if($delivery_typeok=="Normal")
				{
				    $delivery_type="Normal Delivery";
					$min_hours=$laundry_row->normal_delivery_hours;
					$delivery_charge_org=$laundry_row->normal_delivery_charge;
					$delivery_charge="Applicable Delivery Charge : ".$rowlaundry->currency_symbol."".$laundry_row->normal_delivery_charge;
					
					$delivery_type_message="Normal Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				else
				{
					
					$min_hours=$laundry_row->express_delivery_hours;
					$delivery_type="Express Delivery";
					$delivery_charge_org=$laundry_row->express_delivery_charge;
					$delivery_charge="Applicable Delivery Charge : ".$rowlaundry->currency_symbol."".$laundry_row->express_delivery_charge;
					$delivery_type_message="Express Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				
				
				$array3=[];
				for($i=0;$i<7;$i++){
					
					$todayDay1 = date("l",strtotime(date('d-m-Y', strtotime("+".$i." day"))));
					
					$day_data = $this->db->query("SELECT * FROM `loundry_day_list` WHERE
					`loundry_day_list`.`day_name`='$todayDay1' AND `loundry_day_list`.`vendor_id`='$laundry_id' AND `loundry_day_list`.`status`='1'");
					if($day_data->num_rows()>0){
						
						$response3['day_id'] 	= $day_data->row()->id;
						$response3['day_name'] 	= $day_data->row()->day_name;
						$response3['date'] 	= date('d-m-Y', strtotime("+".$i." day"));
						$response3['date_org'] 	= date('Y-m-d', strtotime("+".$i." day"));
						$response3['day_open_time'] 	= date("g:i A", strtotime($day_data->row()->open_time));
						$response3['day_close_time'] 	= date("g:i A", strtotime($day_data->row()->close_time));
						
						
						
						
						$day_time_slot = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`day_id`=".$day_data->row()->id);
						$dayarray=[];
						
						if($day_time_slot->num_rows()>0){
							foreach ($day_time_slot->result_array() as $key => $rowinfo)
							{
								$dayres['time_slot_id'] 	= $rowinfo['id'];
								$dayres['time_slot'] 	= $rowinfo['org_slot_time'];
								$dayres['display_time_slot'] 	= $rowinfo['display_slot_time'];
								$dayres['org_time_slot_to'] 	= $rowinfo['org_time_slot_to'];
				            	$dayres['display_time_slot_to'] 	= $rowinfo['display_time_slot_to'];
					            $dayres['timeslot_label'] 	= $rowinfo['display_slot_time']." To ".$rowinfo['display_time_slot_to'];
								
								
								$dayarray[] = $dayres;
							}
						}
						$response3['time_slot'] = $dayarray;
						$array3[] = $response3;
					}
					
				}
				$res['day_list'] = $array3;
				
				
				
				
				
				//--Data list drop
				$array3=[];
				for($i=0;$i<7;$i++){
					$datet = date('Y-m-d H:i:s', strtotime('+'.$min_hours.' hours'));
					
					$todayDay1 = date("l",strtotime(date('d-m-Y', strtotime($datet."+".$i." day"))));
					//	echo " T ".$todayDay1;
					$day_data = $this->db->query("SELECT * FROM `loundry_day_list` WHERE
					`loundry_day_list`.`day_name`='$todayDay1' AND `loundry_day_list`.`vendor_id`='$laundry_id' AND `loundry_day_list`.`status`='1'");
					if($day_data->num_rows()>0){
						
						$response3['day_id'] 	= $day_data->row()->id;
						$response3['day_name'] 	= $day_data->row()->day_name;
						$datetok = date('Y-m-d H:i:s', strtotime('+'.$min_hours.' hours'));
						$response3['date'] 	= date('d-m-Y', strtotime($datetok."+".$i." day"));
						$response3['date_org'] 	= date('Y-m-d', strtotime($datetok."+".$i." day"));
						$response3['day_open_time'] 	= date("g:i A", strtotime($day_data->row()->open_time));
						$response3['day_close_time'] 	= date("g:i A", strtotime($day_data->row()->close_time));
						
						
						
						
						$day_time_slot = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`day_id`=".$day_data->row()->id);
						$dayarray=[];
						
						if($day_time_slot->num_rows()>0){
							foreach ($day_time_slot->result_array() as $key => $rowinfo)
							{
								$dayres['time_slot_id'] 	= $rowinfo['id'];
								$dayres['time_slot'] 	= $rowinfo['org_slot_time'];
								$dayres['display_time_slot'] 	= $rowinfo['display_slot_time'];
								$dayres['org_time_slot_to'] 	= $rowinfo['org_time_slot_to'];
				            	$dayres['display_time_slot_to'] 	= $rowinfo['display_time_slot_to'];
					            $dayres['timeslot_label'] 	= $rowinfo['display_slot_time']." To ".$rowinfo['display_time_slot_to'];
								
								
								$dayarray[] = $dayres;
							}
						}
						$response3['time_slot'] = $dayarray;
						$array3[] = $response3;
					}
					
				}
				$res['day_list2'] = $array3;
				
				// --Data list drop
				
				$res['delivery_type'] =$delivery_type;
				$res['delivery_charge_label'] =$delivery_charge;
				$res['delivery_charge'] =$delivery_charge_org;
				$res['delivery_type_message'] =$delivery_type_message;
				$res['msg'] = "Laundry Data found.";
				success_response($res);
				}else{
				$result['msg'] = "Laundry Data not found.";
				fail_response($result);
			}
		}
		
		
		public function get_laundry_dropslot2($value='')
		{
			
			$laundry_id =post('laundry_id');
			$delivery_typeok =post('delivery_type');
			$pickup_date =post('pickup_date');
			$pickup_time =post('pickup_time');
			
			
			is_blank($laundry_id,"Laundry Id");
			
			$min_hours=0;
			$delivery_type="";
			$delivery_type_message="";
			$delivery_charge="";
			$delivery_charge_org="";
			
			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`vendor_status`='1'");
			//	echo "testing". "SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`vendor_status`='1'";
			if ($query->num_rows() > 0)
			{
			    $laundry_row=gettablerow($laundry_id,"loundry_list","id");
				
				$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
				// 	echo "SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				// 	LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."";
				
				$rowlaundry = $laundry->row();
				//				$response2['currency_name'] 	= $rowlaundry->currency_name;
				//				$response2['currency_symbol'] 	= $rowlaundry->currency_symbol;
				
				// echo $delivery_typeok;
				if($delivery_typeok=="Normal")
				{
				    $delivery_type="Normal Delivery";
					$min_hours=$laundry_row->normal_delivery_hours;
					$delivery_charge_org=$laundry_row->normal_delivery_charge;
					$delivery_charge="Applicable Delivery Charge : ".$rowlaundry->currency_symbol."".$laundry_row->normal_delivery_charge;
					
					$delivery_type_message="Normal Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				else
				{
					
					$min_hours=$laundry_row->express_delivery_hours;
					$delivery_type="Express Delivery";
					$delivery_charge_org=$laundry_row->express_delivery_charge;
					$delivery_charge="Applicable Delivery Charge : ".$rowlaundry->currency_symbol."".$laundry_row->express_delivery_charge;
					$delivery_type_message="Express Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				
				
				//--Data list drop
				$array3=[];
				for($i=0;$i<7;$i++){
					$datet = date('Y-m-d H:i:s', strtotime('+'.$min_hours.' hours'));
					
					$todayDay1 = date("l",strtotime(date('d-m-Y', strtotime($datet."+".$i." day"))));
					//	echo " T ".$todayDay1;
					$day_data = $this->db->query("SELECT * FROM `loundry_day_list` WHERE
					`loundry_day_list`.`day_name`='$todayDay1' AND `loundry_day_list`.`vendor_id`='$laundry_id' AND `loundry_day_list`.`status`='1'");
					if($day_data->num_rows()>0){
						
						$response3['day_id'] 	= $day_data->row()->id;
						$response3['day_name'] 	= $day_data->row()->day_name;
						$datetok = date('Y-m-d H:i:s', strtotime('+'.$min_hours.' hours'));
						$response3['date'] 	= date('d-m-Y', strtotime($datetok."+".$i." day"));
						$response3['date_org'] 	= date('Y-m-d', strtotime($datetok."+".$i." day"));
						$response3['day_open_time'] 	= date("g:i A", strtotime($day_data->row()->open_time));
						$response3['day_close_time'] 	= date("g:i A", strtotime($day_data->row()->close_time));
						
						
						
						
						$day_time_slot = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`day_id`=".$day_data->row()->id);
						$dayarray=[];
						
						if($day_time_slot->num_rows()>0){
							foreach ($day_time_slot->result_array() as $key => $rowinfo)
							{
								$dayres['time_slot_id'] 	= $rowinfo['id'];
								$dayres['time_slot'] 	= $rowinfo['org_slot_time'];
								$dayres['display_time_slot'] 	= $rowinfo['display_slot_time'];
								$dayres['org_time_slot_to'] 	= $rowinfo['org_time_slot_to'];
				            	$dayres['display_time_slot_to'] 	= $rowinfo['display_time_slot_to'];
					            $dayres['timeslot_label'] 	= $rowinfo['display_slot_time']." To ".$rowinfo['display_time_slot_to'];
								
								
								$dayarray[] = $dayres;
							}
						}
						$response3['time_slot'] = $dayarray;
						$array3[] = $response3;
					}
					
				}
				$res['day_list2'] = $array3;
				
				// --Data list drop
				
				$res['delivery_type'] =$delivery_type;
				$res['delivery_charge_label'] =$delivery_charge;
				$res['delivery_charge'] =$delivery_charge_org;
				$res['delivery_type_message'] =$delivery_type_message;
				$res['msg'] = "Laundry Data found.";
				success_response($res);
				}else{
				$result['msg'] = "Laundry Data not found.";
				fail_response($result);
			}
		}
		
		
		
		public function get_laundry_dropslot($value='')
		{
			
			$laundry_id =post('laundry_id');
			$delivery_typeok =post('delivery_type');
			$pickup_date =post('pickup_date');
			$pickup_time =post('pickup_time');
			
			
			is_blank($laundry_id,"Laundry Id");
			
			$min_hours=0;
			$delivery_type="";
			$delivery_type_message="";
			$delivery_charge="";
			$delivery_charge_org="";
			
			$query = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`vendor_status`='1'");
			//	echo "testing". "SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`='$laundry_id' AND `loundry_list`.`vendor_status`='1'";
			if ($query->num_rows() > 0)
			{
				$laundry_row=gettablerow($laundry_id,"loundry_list","id");
				
				$laundry = $this->db->query("SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$laundry_id."");
				// 	echo "SELECT `loundry_list`.`id`  AS `laundry_id_tbl`,
				// 	`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol` FROM `loundry_list`
				// 	LEFT JOIN `country_list` ON `loundry_list`.`country_id`=`country_list`.`id`  WHERE `loundry_list`.`id`=".$rowinfo['vendor_id']."";
				
				$rowlaundry = $laundry->row();
				//				$response2['currency_name'] 	= $rowlaundry->currency_name;
				//				$response2['currency_symbol'] 	= $rowlaundry->currency_symbol;
				
				// echo $delivery_typeok;
				if($delivery_typeok=="Normal")
				{
					$delivery_type="Normal Delivery";
					$min_hours=$laundry_row->normal_delivery_hours;
					$delivery_charge_org=$laundry_row->normal_delivery_charge;
					$delivery_charge="Applicable Delivery Charge : ".$rowlaundry->currency_symbol."".$laundry_row->normal_delivery_charge;
					
					$delivery_type_message="Normal Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				else
				{
					
					$min_hours=$laundry_row->express_delivery_hours;
					$delivery_type="Express Delivery";
					$delivery_charge_org=$laundry_row->express_delivery_charge;
					$delivery_charge="Applicable Delivery Charge : ".$rowlaundry->currency_symbol."".$laundry_row->express_delivery_charge;
					$delivery_type_message="Express Delivery can Completed and Drop order within (".$min_hours." Hours) as per available time slots.";
				}
				
				$date = $pickup_date." ".$pickup_time;
				
				
				$newDate = date('Y-m-d H:i:s', strtotime($date. ' + '.$min_hours.' hours'));
				//echo $newDate;
				//	echo $newDate;
				
				//--Data list drop
				$array3=[];
				for($i=0;$i<7;$i++){
					$datet = $newDate;
					
					$todayDay1 = date("l",strtotime(date('d-m-Y', strtotime($datet."+".$i." day"))));
					//	echo " T ".$todayDay1;
					$day_data = $this->db->query("SELECT * FROM `loundry_day_list` WHERE
					`loundry_day_list`.`day_name`='$todayDay1' AND `loundry_day_list`.`vendor_id`='$laundry_id' AND `loundry_day_list`.`status`='1'");
					if($day_data->num_rows()>0){
						
						$response3['day_id'] 	= $day_data->row()->id;
						$response3['day_name'] 	= $day_data->row()->day_name;
						//	$datetok = date('Y-m-d H:i:s', strtotime('+'.$min_hours.' hours'));
						$datetok =$newDate;
						
						$response3['date'] 	= date('d-m-Y', strtotime($datetok."+".$i." day"));
						$response3['date_org'] 	= date('Y-m-d', strtotime($datetok."+".$i." day"));
						$response3['day_open_time'] 	= date("g:i A", strtotime($day_data->row()->open_time));
						$response3['day_close_time'] 	= date("g:i A", strtotime($day_data->row()->close_time));
						
						
						
						
						$day_time_slot = $this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`day_id`=".$day_data->row()->id);
						$dayarray=[];
						
						if($day_time_slot->num_rows()>0){
							foreach ($day_time_slot->result_array() as $key => $rowinfo)
							{
								$dayres['time_slot_id'] 	= $rowinfo['id'];
								$dayres['time_slot'] 	= $rowinfo['org_slot_time'];
								$dayres['display_time_slot'] 	= $rowinfo['display_slot_time'];
								$dayres['org_time_slot_to'] 	= $rowinfo['org_time_slot_to'];
								$dayres['display_time_slot_to'] 	= $rowinfo['display_time_slot_to'];
								$dayres['timeslot_label'] 	= $rowinfo['display_slot_time']." To ".$rowinfo['display_time_slot_to'];
								
								
								$dayarray[] = $dayres;
							}
						}
						$response3['time_slot'] = $dayarray;
						$array3[] = $response3;
					}
					
				}
				$res['day_list2'] = $array3;
				
				// --Data list drop
				
				$res['delivery_type'] =$delivery_type;
				$res['delivery_charge_label'] =$delivery_charge;
				$res['delivery_charge'] =$delivery_charge_org;
				$res['delivery_type_message'] =$delivery_type_message;
				$res['msg'] = "Laundry Data found.";
				success_response($res);
				}else{
				$result['msg'] = "Laundry Data not found.";
				fail_response($result);
			}
		}
		
		public function contact_by_customer($value='')
		{
			$user_id =post('user_id');
			$full_name =post('full_name');
			$mobile_number =post('mobile_number');
			$email_id =post('email_id');
			$remark =post('remark');
			is_blank($user_id,"User Id");
			is_user_not($user_id);
			is_blank($full_name,"Full Name");
			is_blank($mobile_number,"Mobile Number");
			is_blank($email_id,"Email id");
			is_blank($remark,"Remark");
			
			$fields['name'] = $full_name;
			$fields['mobile_number'] = $mobile_number;
			$fields['email_id'] = $email_id;
			$fields['support_remark'] = $remark;
			$fields['sender_id'] = $user_id;
			$fields['sender_type'] = "1";
			$fields['status'] = "1";
			
			$this->db->insert('support', $fields);
			
			
			$insert_id = $this->db->insert_id();
			if($insert_id!=null && $insert_id!=0)
			{
				
				$res['remark'] = $remark;
				$res['msg'] = "Help request send successfully.";
				success_response($res);
			}
			else
			{
				$res = "Failled to insert.";
				fail_response($res);
			}
		}
		
		
		public function search_laundry($value='')
		{
			
			
			$distance =post('distance');
			$user_lat =post('user_lat');
			$user_long =post('user_long');
			$search_key =trim(post('search_key'));
			is_blank($distance,"Distance");
			is_blank($user_lat,"Lat");
			is_blank($user_long,"Long");
			is_blank($search_key,"Search Key");
			
			$array1=[];
			
			
			$laundry_list =  $this->db->query("SELECT `loundry_list`.*, (3959 * acos (cos ( radians($user_lat) )	* cos( radians( vendor_lat ) )* cos( radians( vendor_long ) - radians($user_long) ) + sin ( radians($user_lat) )	* sin( radians( vendor_lat ) ))	) AS distance
			FROM loundry_list WHERE loundry_list.type = 'Loundry' AND `loundry_list`.`vendor_name` LIKE '%$search_key%' HAVING distance < $distance ORDER BY distance LIMIT 0 , 20")->result_Array();
			
			foreach ($laundry_list as $key => $valuedriver)
			{
				$response1['vendor_id'] 	= $valuedriver['id'];
				$response1['vendor_name'] 	= $valuedriver['vendor_name'];
				$response1['vendor_gps_address'] 	= $valuedriver['vendor_gps_address'];
				$response1['vendor_open_time_today'] 	= $valuedriver['vendor_name'];
				$response1['vendor_closing_time_today'] 	= $valuedriver['vendor_name'];
				$response1['vendor_rating'] 	= $valuedriver['average_rating'];
				$response1['vendor_distance'] 	= $valuedriver['vendor_name'];
				$response1['vendor_image'] 	= base_url()."uploads/".$valuedriver['vendor_image'];
				$response1['vendor_lat'] 	= $valuedriver['vendor_lat'];
				$response1['vendor_long'] 	= $valuedriver['vendor_long'];
				$response1['distance'] 	= $valuedriver['distance'];
				$todayDay = date("l",strtotime(date('d-m-Y')));
				$to_day = $this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`day_name`='$todayDay' AND `loundry_day_list`.`vendor_id`=".$valuedriver['id']."");
				$response1['day_name'] 	=$todayDay;
				if($to_day->num_rows()>0)
				{
					$response1['open_time_today'] 	= date("g:i A", strtotime($to_day->row()->open_time));
					$response1['closing_time_today'] 	= date("g:i A", strtotime($to_day->row()->close_time));
					$response1['is_open'] 	= $to_day->row()->status;
					}else{
					$response1['open_time_today'] 	= "0.00";
					$response1['closing_time_today'] 	= "0.00";
					$response1['is_open'] 	= "0";
				}
				
				$array1[] = $response1;
			}
			$result["laundry_list"] = $array1;
			$result['msg'] = "Data found Successfully .";
			success_response($result);
		}
		
		
	}
