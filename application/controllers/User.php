<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	ob_start();
	class User extends CI_Controller {
		
		function __construct(){
			parent::__construct();
			
			$logged=$this->session->userdata('loggedUser');
			if($logged['designation']!='Loundry')
			{ return redirect('login'); }
			
			$this->logged=$logged;
			
			date_default_timezone_set('Asia/Kolkata');
		}
		
		public function index()
		{
			$laundry_id = $this->logged['user_id']; 
			$result['notice'] ="";
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= $laundry_id");
			
			$this->load->view('user/user-dashboard',$result);
		}
		
		public function logout()
		{
			$this->session->unset_userdata('loggedUser');
			session_destroy();
			return redirect('login');
		}
		
		public function product_management($value='')
		{
			
			$laundry_id = $this->logged['user_id']; 
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= $laundry_id");
			//echo $this->db->last_query(); die();	
			if ($result['laundry']->num_rows()>0) {
				
				$result['units']=$this->db->query("SELECT * FROM `unit_table`");
				$result['category']=$this->db->query("SELECT * FROM `category` WHERE `category`.`status`= '1'");
				$result['products']=$this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name` FROM `loundry_item_list` 
				LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id` 
				LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id` 
				LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id` 
				WHERE `loundry_item_list`.`vendor_id`= $laundry_id");
				$this->load->view('user/product-managment',$result);
				}else{
				return redirect('user');
			}
		}
		
		
		public function add_new_product()
		{
			$loundry_id = $this->logged['user_id'];
			$unit = post('unit');
			$laundry=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$loundry_id'");	
			if ($laundry->num_rows()>0) {
				$unit=$this->db->query("SELECT * FROM `unit_table` WHERE  `unit_table`.`id`= '$unit'");	
				
				$a=$_FILES['image']['name'];
				if($a)
				{
					$config = array(
					'upload_path' => "./uploads",
					'allowed_types' => "jpg|png|jpeg",
					);
					$this->load->library('upload',$config);
					$this->upload->do_upload('image');
					$img=$this->upload->data();
					$data['item_image']=$img['file_name'];
				}
				
				$data['item_name'] = $_POST['product_name'];
				$data['item_price'] = $_POST['item_price'];
				$data['tax'] = $_POST['item_tax'];
				$data['item_offer_price'] = $_POST['offer_price'];
				$data['item_description'] = $_POST['description'];
				$data['vendor_id'] = $loundry_id;
				$data['category_id'] = $_POST['category'];
				$data['status'] = $_POST['status'];
				$data['added_date_time'] = date("Y-m-d h:i:s");;
				$data['update_date_time'] = date("Y-m-d h:i:s");;
				$data['unit_id'] = $_POST['unit'];
				$data['country_id'] = $laundry->row()->country_id;
				$data['unit_name'] = $unit->row()->unit_name;
				
				$this->db->insert('loundry_item_list', $data);
				
				setMessage('1','Product Not Added Successfully');
				return redirect('user/product_management');
				}else{
				setMessage('0','Error! Product Not Added');
				return redirect('user');
			}
		}
		
		public function product_edit($product_id='')
		{
			
			$result['product']=$this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`= '$product_id'");
			if ($result['product']->num_rows()>0) {
				$loundry_id = $result['product']->row()->vendor_id;
				
				$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`id`= '$loundry_id'");
				$result['units']=$this->db->query("SELECT * FROM `unit_table`");
				$result['category']=$this->db->query("SELECT * FROM `category` WHERE `category`.`status`= '1'");
				$this->load->view('user/product-edit',$result);
				}else{
				return redirect('user');
			}
		}
		
		public function delete_product($id='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`= '$id'");
			
			if ($data->num_rows()>0) {
				
				$this->db->query("DELETE  FROM `loundry_item_list` WHERE `loundry_item_list`.`id`= '$id'");
				setMessage('1','Product Deleted Successfully.');
				return redirect("user/product_management/");
			}
			else
			{
				return redirect('user');
			}
		}
		public function update_product($value='')
		{
			//check_post();
			$product_id = post('product_id');
			$unit = post('unit');
			
			
			$product=$this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`= '$product_id'");	
			if ($product->num_rows()>0) {
				$unit=$this->db->query("SELECT * FROM `unit_table` WHERE  `unit_table`.`id`= '$unit'");	
				$a=$_FILES['image']['name'];
				if($a)
				{
					$config = array(
					'upload_path' => "./uploads",
					'allowed_types' => "jpg|png|jpeg",
					);
					$this->load->library('upload',$config);
					$this->upload->do_upload('image');
					$img=$this->upload->data();
					$data['item_image']=$img['file_name'];
				}
				
				$data['item_name'] = $_POST['product_name'];
				$data['item_price'] = $_POST['item_price'];
				$data['tax'] = $_POST['item_tax'];
				$data['item_offer_price'] = $_POST['offer_price'];
				$data['item_description'] = $_POST['description'];			
				$data['category_id'] = $_POST['category'];
				$data['status'] = $_POST['status'];		
				$data['update_date_time'] = date("Y-m-d h:i:s");;
				$data['unit_id'] = $_POST['unit'];			
				$data['unit_name'] = $unit->row()->unit_name;
				
				$this->db->where(['id'=>$product_id])->update('loundry_item_list', $data);			
				setMessage('1','Product Update Successfully');
				return redirect("user/product_management");
				}else{
				setMessage('0','Error! Product Not Update');
				return redirect('user');
			}
			
		}
		
		public function product_status($id='',$value='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`= '$id'");
			
			if ($data->num_rows()>0) {
				$data1['status'] =$value;
				$this->db->where(['id'=>$id])->update('loundry_item_list', $data1);
				setMessage('1','Product Update Successfully.');
				return redirect("user/product_management");
				}else{
				return redirect('user');
			}
			
		}
		
		
		
		
		public function laundry_rider()
		{
			$id = $this->logged['user_id'];
			
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");	
			if ($result['laundry']->num_rows()>0) {
				
				$result['data']=$this->db->query("SELECT `rider_listing`.*,`loundry_list`.`vendor_name` FROM `rider_listing` LEFT JOIN `loundry_list` ON `rider_listing`.`vendor_id`=loundry_list.`id` WHERE `rider_listing`.`vendor_id`= '$id'");
				
				
				$this->load->view('user/laundry-rider',$result);
				}else{
				return redirect('user');
			}
		}
		
		
		public function add_new_rider($value='')
		{
			
			$id = $this->logged['user_id'];
			$laundry=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");
			
			if ($laundry->num_rows()>0) {
				
				$a=$_FILES['image']['name'];
				if($a)
				{
					$config = array(
					'upload_path' => "./uploads",
					'allowed_types' => "jpg|png|jpeg",
					);
					$this->load->library('upload',$config);
					$this->upload->do_upload('image');
					$img=$this->upload->data();
					$data['rider_photo']=$img['file_name'];
				}
				
				$b=$_FILES['id_image']['name'];
				if($b)
				{
					$config = array(
					'upload_path' => "./uploads",
					'allowed_types' => "jpg|png|jpeg",
					);
					$this->load->library('upload',$config);
					$this->upload->do_upload('id_image');
					$img1=$this->upload->data();
					$data['rider_identy_card_photo']=$img1['file_name'];
				}
				
				$data['rider_name'] =$_POST['rider_name'];
				$data['rider_mobile_no'] =$_POST['mobile'];
				$data['rider_email_id'] =$_POST['email'];
				$data['rider_password'] =$_POST['rider_password'];
				$data['rider_confirm_password'] =$_POST['rider_password'];
				$data['rider_permanant_address'] =$_POST['address'];
				$data['rider_identy_card_no'] =$_POST['id_number'];
				$data['vendor_id'] =$_POST['laundry_id'];
				$data['rider_status'] =$_POST['status'];
				$data['rider_added_date_time'] =date("Y-m-d h:i:s");
				$data['wallet_balance'] =0;
				
				$this->db->insert('rider_listing', $data);
				setMessage('1','Rider Added Successfully.');
				return redirect("user/laundry_rider");
				}else{
				setMessage('0','Error');
				return redirect("user/laundry_rider");
			}
		}
		
		
		public function rider_edit($id='')
		{
			$result['rider']=$this->db->query("SELECT * FROM `rider_listing` WHERE  `rider_listing`.`id`= '$id'");	
			if ($result['rider']->num_rows()>0) {
				
				$this->load->view('user/rider-edit',$result);
				}else{
				return redirect('user');
			}
		}
		
		
		public function update_rider($value='')
		{
			$id = $_POST['rider_id'];
			$rider=$this->db->query("SELECT * FROM `rider_listing` WHERE  `rider_listing`.`id`= '$id'");
			
			if ($rider->num_rows()>0) {
				
				$a=$_FILES['image']['name'];
				if($a)
				{
					$config = array(
					'upload_path' => "./uploads",
					'allowed_types' => "jpg|png|jpeg",
					);
					$this->load->library('upload',$config);
					$this->upload->do_upload('image');
					$img=$this->upload->data();
					$data['rider_photo']=$img['file_name'];
				}
				
				$b=$_FILES['id_image']['name'];
				if($b)
				{
					$config = array(
					'upload_path' => "./uploads",
					'allowed_types' => "jpg|png|jpeg",
					);
					$this->load->library('upload',$config);
					$this->upload->do_upload('id_image');
					$img1=$this->upload->data();
					$data['rider_identy_card_photo']=$img1['file_name'];
				}
				
				$data['rider_name'] =$_POST['rider_name'];
				$data['rider_mobile_no'] =$_POST['mobile'];
				$data['rider_email_id'] =$_POST['email'];
				$data['rider_password'] =$_POST['rider_password'];
				$data['rider_confirm_password'] =$_POST['rider_password'];
				$data['rider_permanant_address'] =$_POST['address'];
				$data['rider_identy_card_no'] =$_POST['id_number'];
				$data['rider_status'] =$_POST['status'];
				
				$this->db->where(['id'=>$id])->update('rider_listing', $data);
				
				
				setMessage('1','Rider Update Successfully.');
				return redirect("user/laundry_rider");
				}else{
				setMessage('0','Error');
				return redirect("user/laundry_rider");
			}
			
			
		}
		
		
		
		public function laundry_banner()
		{
			
			$id = $this->logged['user_id'];
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");	
			if ($result['laundry']->num_rows()>0) {
				
				$result['data']=$this->db->query("SELECT `loundry_banner`.*,`loundry_list`.`vendor_name` FROM `loundry_banner` LEFT JOIN `loundry_list` ON `loundry_banner`.`vendor_id`=loundry_list.`id` WHERE `loundry_banner`.`vendor_id`= '$id'");
				
				
				$this->load->view('user/laundry-banner',$result);
				}else{
				return redirect('user');
			}		
		}
		
		public function add_new_banner($value='')
		{
			$id = $this->logged['user_id'];
			$laundry=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");
			
			if ($laundry->num_rows()>0) {
				
				$a=$_FILES['image']['name'];
				if($a)
				{
					$config = array(
					'upload_path' => "./uploads",
					'allowed_types' => "jpg|png|jpeg",
					);
					$this->load->library('upload',$config);
					$this->upload->do_upload('image');
					$img=$this->upload->data();
					$data['banner_image']=$img['file_name'];
				}
				$data['sno'] =$_POST['sr_number'];
				$data['vendor_id'] =$_POST['laundry_id'];
				$this->db->insert('loundry_banner', $data);
				setMessage('1','Banner Added Successfully.');
				return redirect("user/laundry_banner");
				}else{
				setMessage('0','Error');
				return redirect("user/laundry_banner");
			}
		}
		
		
		public function edit_banner($id='')
		{
			
			
			$result['banner']=$this->db->query("SELECT * FROM `loundry_banner` WHERE `loundry_banner`.`id`= '$id'");	
			if ($result['banner']->num_rows()>0) {
				
				$result['data']=$this->db->query("SELECT `loundry_banner`.*,`loundry_list`.`vendor_name` FROM `loundry_banner` LEFT JOIN `loundry_list` ON `loundry_banner`.`vendor_id`=loundry_list.`id` WHERE `loundry_banner`.`vendor_id`= ".$result['banner']->row()->vendor_id."");
				
				$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= ".$result['banner']->row()->vendor_id."");
				
				$this->load->view('user/edit-banner',$result);
				}else{
				return redirect('user');
			}
		}
		
		public function update_banner($value='')
		{
			$id = $_POST['banner_id'];
			$result['banner']=$this->db->query("SELECT * FROM `loundry_banner` WHERE `loundry_banner`.`id`= '$id'");	
			if ($result['banner']->num_rows()>0) {
				
				$a=$_FILES['image']['name'];
				if($a)
				{
					$config = array(
					'upload_path' => "./uploads",
					'allowed_types' => "jpg|png|jpeg",
					);
					$this->load->library('upload',$config);
					$this->upload->do_upload('image');
					$img=$this->upload->data();
					$data['banner_image']=$img['file_name'];
				}
				$data['sno'] =$_POST['sr_number'];
				
				$this->db->where(['id'=>$id])->update('loundry_banner', $data);
				setMessage('1','Banner Update Successfully.');
			}
			return redirect("user/laundry_banner");
		}
		
		public function banner_delete($id='')
		{
			
			$result['banner']=$this->db->query("SELECT * FROM `loundry_banner` WHERE `loundry_banner`.`id`= '$id'");	
			if ($result['banner']->num_rows()>0) {
				
				$path = base_url().'uploads/'.$result['banner']->row()->banner_image ;
				
				//unlink($path);
				$msg =  "File ".$result['banner']->row()->banner_image." has been deleted";
				$this->db->query("DELETE FROM `loundry_banner` WHERE `loundry_banner`.`id`= '$id'");	
				setMessage('1',$msg);
			}
			return redirect("user/laundry_banner");
		}
		
		
		
		
		
		
		
		
		
		public function laundry_date()
		{
			$id = $this->logged['user_id'];
			
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");	
			if ($result['laundry']->num_rows()>0) {			
				
				$result['laundry_date']=$this->db->query("SELECT * FROM `day_list` WHERE `day_list`.`id` NOT IN (SELECT `loundry_day_list`.`day_id` FROM `loundry_day_list` WHERE `loundry_day_list`.`vendor_id`= '$id')");
				
				$result['data']=$this->db->query("SELECT `loundry_day_list`.*,`day_list`.`day_name` as day,`day_list`.`day_no` FROM `loundry_day_list` LEFT JOIN `day_list` ON `loundry_day_list`.`day_id`=day_list.`id` WHERE `loundry_day_list`.`vendor_id`= '$id' ORDER BY `loundry_day_list`.`sno` ASC");
				
				//echo "<pre>"; print_r($result['data']->result_array()); die();
				
				
				$this->load->view('user/laundry-date',$result);
				}else{
				return redirect('user');
			}
		}
		
		public function add_laundry_date()
		{
			///check_post();
			$laundry_id = $this->logged['user_id'];
			
			$date_id = $_POST['date_id'];
			
			$results=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`day_id`='$date_id' AND `loundry_day_list`.`vendor_id`= '$laundry_id' ORDER BY `loundry_day_list`.`sno` ASC");
			
			if ($results->num_rows()>0) {
				setMessage('0','Eroor! Day Not Added.');
				}else{
				
				$laundry=$this->db->query("SELECT * FROM `day_list` WHERE `day_list`.`id` = '$date_id'");
				
				$data['vendor_id'] = $_POST['laundry_id'];
				$data['day_id'] = $_POST['date_id'];
				$data['open_time'] = $_POST['opentime'];
				$data['close_time'] = $_POST['closetime'];
				$data['sno'] = $laundry->row()->day_no;
				$data['day_name'] = $laundry->row()->day_name;
				
				$this->db->insert('loundry_day_list', $data);
				
				setMessage('1','Day Added Successfully.');
				
			}
			return redirect("user/laundry_date");
		}
		
		public function edit_date($id='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`id`= '$id'");
			
			if ($data->num_rows()>0) {
				
				$result['date_time'] = $data->row();
				$this->load->view('user/laundry-date-edit',$result);
				}else{
				return redirect('user');
			}
			
			
		}
		
		
		
		
		public function update_laundry_date($value='')
		{
			$id = $_POST['date_id'];
			$opentime = $_POST['opentime'];
			$closetime = $_POST['closetime'];
			
			$data=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`id`= '$id'");
			
			if ($data->num_rows()>0) {
				
				$data1['open_time'] =$_POST['opentime'];
				$data1['close_time'] =$_POST['closetime'];
				
				$this->db->where(['id'=>$id])->update('loundry_day_list', $data1);
				setMessage('1','Time Update Successfully.');
				return redirect("user/laundry_date");
				}else{
				return redirect('user');
			}
		}
		
		public function date_status($id='',$value='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`id`= '$id'");
			
			if ($data->num_rows()>0) {
				$data1['status'] =$value;
				$this->db->where(['id'=>$id])->update('loundry_day_list', $data1);
				setMessage('1','Time Update Successfully.');
				return redirect("user/laundry_date");
				}else{
				return redirect('user');
			}
			
		}
		
		
		public function add_time_slot($id='')
		{
			//$id = $this->logged['user_id'];
			$data=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`id`= '$id'");
			
			if ($data->num_rows()>0) {			
				$day_id = $data->row()->id;
				$vendor_id = $data->row()->vendor_id;
				$result['time_slot']=$this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`day_id`= '$day_id' 
				AND `loundry_time_list`.`vendor_id`= '$vendor_id'");
				
				$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$vendor_id'")->row();	
				$result['date_time'] = $data->row();
				$this->load->view('user/laundry-time_slot',$result);
				
				}else{
				return redirect('user');
			}
			
		}
		
		public function insert_time_slot($value='')
		{
			/*print_r(date("g:i A", strtotime(post('time_slot'))));
			check_post();*/
			$id = post('day_id');
			$data=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`id`= '$id'");
			
			if ($data->num_rows()>0) {			
				
				$data1['vendor_id'] =$_POST['vendor_id'];
				$data1['day_id'] =$data->row()->id;
				$data1['day_sno'] =$data->row()->sno;
				$data1['day_name'] =$data->row()->day_name;
				$data1['org_slot_time'] =$_POST['time_slot'];
				$data1['org_time_slot_to'] =$_POST['end_time_slot'];
				$data1['display_slot_time'] =date("g:i A", strtotime(post('time_slot')));
				$data1['display_time_slot_to'] =date("g:i A", strtotime(post('end_time_slot')));
				$this->db->insert('loundry_time_list', $data1);
				
				setMessage('1','Time Slot Added Successfully.');
				return redirect("user/add_time_slot/".$data->row()->id);
				
				}else{
				return redirect('user');
			}
		}
		
		public function delete_time_slot($id='')
		{
			
			
			$data=$this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`id`= '$id'");
			if ($data->num_rows()>0) {			
				
				$this->db->query("DELETE  FROM `loundry_time_list` WHERE `loundry_time_list`.`id`= '$id'");
				
				setMessage('1','Time Slot Deleted Successfully.');
				return redirect("user/add_time_slot/".$data->row()->day_id);
				
				}else{
				return redirect('user');
			}
		}
		
		public function laundry_wallet()
		{
			$id = $this->logged['user_id'];
			
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");	
			if ($result['laundry']->num_rows()>0) {
				
				$result['income']=$this->db->query("SELECT `wallet_transaction_partner`.*,`loundry_list`.`vendor_name` FROM `wallet_transaction_partner` LEFT JOIN `loundry_list` ON `wallet_transaction_partner`.`vendor_id`=`loundry_list`.`id` WHERE `wallet_transaction_partner`.`status`=1 AND `wallet_transaction_partner`.`type`=1 AND `wallet_transaction_partner`.`vendor_id`= '$id'");
				
				$result['out']=$this->db->query("SELECT `wallet_transaction_partner`.*,`loundry_list`.`vendor_name` FROM `wallet_transaction_partner` LEFT JOIN `loundry_list` ON `wallet_transaction_partner`.`vendor_id`=`loundry_list`.`id` WHERE `wallet_transaction_partner`.`status`=1 AND `wallet_transaction_partner`.`type`=0 AND `wallet_transaction_partner`.`vendor_id`= '$id'");
				$result['in_amt']=$this->db->query("SELECT IFNULL(SUM(`wallet_transaction_partner`.`amt`),0) AS in_amt FROM `wallet_transaction_partner` WHERE `wallet_transaction_partner`.`type`=1 
				AND `wallet_transaction_partner`.`status` = 1 AND `wallet_transaction_partner`.`vendor_id` =$id");
				
				
				
				$result['out_amt']=$this->db->query("SELECT IFNULL(SUM(`wallet_transaction_partner`.`amt`),0) AS out_amt FROM `wallet_transaction_partner` WHERE `wallet_transaction_partner`.`type`=0 
				AND `wallet_transaction_partner`.`status` = 1 AND `wallet_transaction_partner`.`vendor_id` =$id");
				
				$this->load->view('user/laundry-wallet',$result);
				}else{
				return redirect('user');
			}
		}
		
		
		public function today_booking()
		{
			$laundry_id = $this->logged['user_id']; 
			//echo $laundry_id ; die();
			$dateFrom=date('Y-m-d');
			$dateTo=date('Y-m-d');
			
			$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` = $laundry_id AND
			DATE_FORMAT(`placed_time`,'%Y-%m-%d') >= DATE_FORMAT('".$dateFrom."','%Y-%m-%d')  AND DATE_FORMAT(placed_time,'%Y-%m-%d') <= DATE_FORMAT('".$dateTo."','%Y-%m-%d')");
			$this->load->view('user/today-booking',$result);			
		}
		
		public function all_booking()
		{
			$laundry_id = $this->logged['user_id']; 
			//echo $laundry_id ; die();
			if (post('dateFrom')!=null) 
			{
				$dateFrom=post('dateFrom');
				$dateTo=post('dateTo');
			}else
			{
				$dateFrom=date('Y-m-d');
				$dateTo=date('Y-m-d');
			}
			
			$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` = $laundry_id AND
			DATE_FORMAT(`placed_time`,'%Y-%m-%d') >= DATE_FORMAT('".$dateFrom."','%Y-%m-%d')  AND DATE_FORMAT(placed_time,'%Y-%m-%d') <= DATE_FORMAT('".$dateTo."','%Y-%m-%d')");
			$this->load->view('user/laundry-booking',$result);			
		}
		
		public function cancle_booking()
		{
			$laundry_id = $this->logged['user_id']; 
			if (post('dateFrom')!=null) {
				$dateFrom=post('dateFrom');
				$dateTo=post('dateTo');
				}else{
				$dateFrom=date('Y-m-d');
				$dateTo=date('Y-m-d');
			}
			
			$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` = $laundry_id AND booking_status = 9 ");
			$this->load->view('user/cancel-booking',$result);			
		}
		
		public function booking_details($booking_id='')
		{
			$laundry_id = $this->logged['user_id']; 
			$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` = $laundry_id AND `all_booking`.`id` = $booking_id");
			if ($result['booking']->num_rows()>0) {
				$result['booking_item']=$this->db->query("SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id` = `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id` = $booking_id");
				$this->load->view('user/booking-details',$result);	
				}else{
				return redirect('User');
			}
		}
		
		
		
		public function order_view() 
		{
			$laundry_id = $this->logged['user_id']; 
			$booking_id = post('id');
			$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` = $laundry_id AND `all_booking`.`id` = $booking_id");
			$result['status_list']=$this->db->query("SELECT *  FROM `booking_status` WHERE `booking_status`.`status`=1");
			
			if ($result['booking']->num_rows()>0) {
				$result['rider_lists']=$this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`rider_status` = 1 AND  `rider_listing`.`vendor_id` = ".$result['booking']->row()->vendor_id."");	
				$this->load->view('user/order-action-view',$result);	
				}else{
				return redirect('User');
			}
		}
		
		
		public function update_order_status($value='')
		{
			$booking_id = post('book_id');
			$pick_up_boy = post('pick_up_boy');
			$drop_boy_id = post('drop_boy');
			$booking_status = post('book_status');
			$laundry_id = $this->logged['user_id']; 
			$booking_data =$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` = $laundry_id AND `all_booking`.`id` = $booking_id");
			if ($booking_data->num_rows()>0) {					
				if ($pick_up_boy!=null && $pick_up_boy!="") {
					$pick_up_boy_data =$this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`id` = $pick_up_boy");					
					
					$data['pickup_boy_id'] = $pick_up_boy_data->row()->id;
					$data['pickup_boy_name'] = $pick_up_boy_data->row()->rider_name;
					$data['pickup_boy_number'] = $pick_up_boy_data->row()->rider_mobile_no;
				}
				if ($drop_boy_id!=null && $drop_boy_id!="") {						
					$drop_boy_data =$this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`id` = $drop_boy_id");
					$data['drop_boy_id'] = $drop_boy_data->row()->id;
					$data['drop_boy_name'] = $drop_boy_data->row()->rider_name;
					$data['drop_boy_number'] = $drop_boy_data->row()->rider_mobile_no;
				}
				
				if ($booking_status==1) {
					$data['confirm_time'] = date("Y-m-d H:i:s");
				}
				
				if ($booking_status==3) {
					$data['pickup_date'] = date('Y-m-d');
					$data['pickup_time'] = date("H:i:s");
				}
				
				if ($booking_status==4) {
					$data['received_at_loundry_time'] = date("Y-m-d H:i:s");
				}
				if ($booking_status==5) {
					$data['in_process_time'] = date("Y-m-d H:i:s");
				}
				if ($booking_status==6) {
					$data['order_ready_time'] = date("Y-m-d H:i:s");
				}
				if ($booking_status==7) {
					$data['allot_for_drop_time'] = date("Y-m-d H:i:s");
				}
				if ($booking_status==8) {
					$data['drop_time'] = date("Y-m-d H:i:s");
				}
				if ($booking_status==9) {
					$data['cancelled_by_id'] = "0";
					$data['cancellation_reason'] = "Order cancelled by Admin";
					$data['cancelled_time'] = date("Y-m-d H:i:s");
				}
				$data['booking_status'] = $booking_status;
				$this->db->where(['id'=>$booking_id])->update('booking_list', $data);
				
				}else{
				return FALSE;
			}				
		}
		
	}
