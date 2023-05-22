<?php
	defined('BASEPATH') OR exit('No direct script access allowed');
	ob_start();
	class Auth extends CI_Controller {

		function __construct(){
			parent::__construct();

			$logged=$this->session->userdata('loggedUser');

			if($logged['designation']!='Admin')
			{ return redirect('user'); }

			$this->logged=$logged;
			date_default_timezone_set('Asia/Kolkata');
		}

		public function index()
		{
			$result['notice'] ="";

			$this->load->view('admin/admin-dashboard',$result);
		}

		public function laundry_management()
		{

			$result['data']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry'");
			$this->load->view('admin/laundry-management',$result);
		}

		public function new_laundry()
		{

			$result['data']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND is_verified =0");
			$this->load->view('admin/new-laundry',$result);
		}

		public function approve_laundry($id="")
		{

			$data['is_verified'] = 1;
			$data['loundry_info'] = $_POST['loundry_info'];

			$this->db->where(['id'=>$id])->update('loundry_list', $data);
			setMessage('1','Laundry Approve Successfully.');

			return redirect("Auth/laundry_management");
		}

		public function add_laundry()
		{
			$result['notice'] ="";
			$result['data']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry'");
			$result['country']=$this->db->query("SELECT * FROM `country_list`");

			$this->load->view('admin/add-laundry',$result);
		}

		public function add_new_laundry()
		{


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
				$data['vendor_image']=$img['file_name'];
			}

			if (isset($_POST['recommended'])) {
				$data['is_recomended'] =1;
				}else{
				$data['is_recomended'] =0;
			}
			$data['contact_number'] = $_POST['mobile'];
			$data['contact_email_id'] = $_POST['email'];
			$data['wallet_balance'] = 0;
			$data['is_verified'] = 1;
			$data['vendor_status'] = $_POST['status'];
			$data['vendor_registration_date'] = date("Y-m-d h:i:s");
			$data['type'] = "Loundry";
			$data['country_id'] = $_POST['country'];
			$data['vendor_name'] = $_POST['laundry_name'];
			$data['vendor_display_address'] = $_POST['display_address'];
			$data['vendor_gps_address'] = $_POST['locality'];
			$data['vendor_lat'] = $_POST['latitude'];
			$data['vendor_long'] = $_POST['longitude'];
			$data['contact_password'] = $_POST['password'];
			$data['loundry_info'] = $_POST['loundry_info'];

			$this->db->insert('loundry_list', $data);
			setMessage('1','Laundry Added Successfully.');
			return redirect('Auth/laundry_management');
		}

		public function edit_laundry($id="")
		{
			$data=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`='$id'");
			$result['country']=$this->db->query("SELECT * FROM `country_list`");
			if ($data->num_rows()>0) {
				$result['data'] =$data->row_array();
				$this->load->view('admin/edit-laundry',$result);
			}
		}

		public function update_laundry($id="")
		{

			if (isset($id)) {
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
					if($img!=null && $img!="")
					{
					$data['vendor_image']=$img['file_name'];
					}

				}

				if (isset($_POST['recommended'])) {
					$data['is_recomended'] =1;
					}else{
					$data['is_recomended'] =0;
				}

				$data['contact_email_id'] = $_POST['email'];
				$data['vendor_status'] = $_POST['status'];
				$data['country_id'] = $_POST['country'];
				$data['vendor_name'] = $_POST['laundry_name'];
				$data['vendor_display_address'] = $_POST['display_address'];
				$data['vendor_gps_address'] = $_POST['locality'];
				$data['vendor_lat'] = $_POST['latitude'];
				$data['vendor_long'] = $_POST['longitude'];
				$data['contact_password'] = $_POST['password'];
				$data['loundry_info'] = $_POST['loundry_info'];
				//print_r($data);
				//return;
				$this->db->where(['id'=>$id])->update('loundry_list', $data);
				setMessage('1','Laundry Update Successfully.');
				}else{
				setMessage('0','Error');
			}
			return redirect('Auth/laundry_management');
		}


		public function laundry_status($id="",$status="")
		{

			if (isset($id) && isset($status)) {

				$data['vendor_status'] = $status;
				$this->db->where(['id'=>$id])->update('loundry_list', $data);
				setMessage('1','Laundry Update Successfully.');
				}else{
				setMessage('0','Error');
			}
			return redirect('Auth/laundry_management');
		}


		public function laundry_dashboard($id='')
		{
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");
			if ($result['laundry']->num_rows()>0) {

				$this->load->view('admin/laundry-dashboard',$result);
			}
			else
			{
				return redirect('Auth');
			}
		}

		public function laundry_banner($id)
		{
			$result['notice'] ="";
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");
			if ($result['laundry']->num_rows()>0) {

				$result['data']=$this->db->query("SELECT `loundry_banner`.*,`loundry_list`.`vendor_name` FROM `loundry_banner` LEFT JOIN `loundry_list` ON `loundry_banner`.`vendor_id`=loundry_list.`id` WHERE `loundry_banner`.`vendor_id`= '$id'");


				$this->load->view('admin/laundry-banner',$result);
				}else{
				return redirect('Auth');
			}
		}


		public function laundry_date($id='')
		{

			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");
			if ($result['laundry']->num_rows()>0) {

				$result['laundry_date']=$this->db->query("SELECT * FROM `day_list` WHERE `day_list`.`id` NOT IN (SELECT `loundry_day_list`.`day_id` FROM `loundry_day_list` WHERE `loundry_day_list`.`vendor_id`= '$id')");

				$result['data']=$this->db->query("SELECT `loundry_day_list`.*,`day_list`.`day_name` as day,`day_list`.`day_no` FROM `loundry_day_list` LEFT JOIN `day_list` ON `loundry_day_list`.`day_id`=day_list.`id` WHERE `loundry_day_list`.`vendor_id`= '$id' ORDER BY `loundry_day_list`.`sno` ASC");

				//echo "<pre>"; print_r($result['data']->result_array()); die();


				$this->load->view('admin/laundry-date',$result);
				}else{
				return redirect('Auth');
			}
		}

		public function add_laundry_date()
		{
			///check_post();
			$laundry_id = $_POST['laundry_id'];
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
			return redirect("Auth/laundry_date/$laundry_id");
		}

		public function edit_date($id='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`id`= '$id'");

			if ($data->num_rows()>0) {

				$result['date_time'] = $data->row();
				$this->load->view('admin/laundry-date-edit',$result);
				}else{
				return redirect('Auth');
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
				return redirect("Auth/laundry_date/".$data->row()->vendor_id);
				}else{
				return redirect('Auth');
			}
		}

		public function date_status($id='',$value='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`id`= '$id'");

			if ($data->num_rows()>0) {
				$data1['status'] =$value;
				$this->db->where(['id'=>$id])->update('loundry_day_list', $data1);
				setMessage('1','Time Update Successfully.');
				return redirect("Auth/laundry_date/".$data->row()->vendor_id);
				}else{
				return redirect('Auth');
			}

		}


		public function add_time_slot($id='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_day_list` WHERE `loundry_day_list`.`id`= '$id'");

			if ($data->num_rows()>0) {
				$day_id = $data->row()->id;
				$vendor_id = $data->row()->vendor_id;
				$result['time_slot']=$this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`day_id`= '$day_id'
				AND `loundry_time_list`.`vendor_id`= '$vendor_id'");

				$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$vendor_id'")->row();
				$result['date_time'] = $data->row();
				$this->load->view('admin/laundry-time_slot',$result);

				}else{
				return redirect('Auth');
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
				return redirect("Auth/add_time_slot/".$data->row()->id);

				}else{
				return redirect('Auth');
			}
		}

		public function delete_time_slot($id='')
		{


			$data=$this->db->query("SELECT * FROM `loundry_time_list` WHERE `loundry_time_list`.`id`= '$id'");
			if ($data->num_rows()>0) {

				$this->db->query("DELETE  FROM `loundry_time_list` WHERE `loundry_time_list`.`id`= '$id'");

				setMessage('1','Time Slot Deleted Successfully.');
				return redirect("Auth/add_time_slot/".$data->row()->day_id);

				}else{
				return redirect('Auth');
			}
		}



		public function add_new_banner($value='')
		{
			$id = $_POST['laundry_id'];
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
				return redirect("Auth/laundry_banner/$id");
				}else{
				setMessage('0','Error');
				return redirect("Auth/laundry_banner/$id");
			}
		}


		public function edit_banner($id='')
		{


			$result['banner']=$this->db->query("SELECT * FROM `loundry_banner` WHERE `loundry_banner`.`id`= '$id'");
			if ($result['banner']->num_rows()>0) {

				$result['data']=$this->db->query("SELECT `loundry_banner`.*,`loundry_list`.`vendor_name` FROM `loundry_banner` LEFT JOIN `loundry_list` ON `loundry_banner`.`vendor_id`=loundry_list.`id` WHERE `loundry_banner`.`vendor_id`= ".$result['banner']->row()->vendor_id."");

				$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= ".$result['banner']->row()->vendor_id."");

				$this->load->view('admin/edit-banner',$result);
				}else{
				return redirect('Auth');
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
				return redirect("Auth/laundry_banner/".$result['banner']->row()->vendor_id);
			}
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
				return redirect("Auth/laundry_banner/".$result['banner']->row()->vendor_id);
			}
		}


		public function laundry_rider($id='')
		{
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");
			if ($result['laundry']->num_rows()>0) {

				$result['data']=$this->db->query("SELECT `rider_listing`.*,`loundry_list`.`vendor_name` FROM `rider_listing` LEFT JOIN `loundry_list` ON `rider_listing`.`vendor_id`=loundry_list.`id` WHERE `rider_listing`.`vendor_id`= '$id'");


				$this->load->view('admin/laundry-rider',$result);
				}else{
				return redirect('Auth');
			}
		}


		public function add_new_rider($value='')
		{
			//check_post();


			$id = $_POST['laundry_id'];
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
				return redirect("Auth/laundry_rider/$id");
				}else{
				setMessage('0','Error');
				return redirect("Auth/laundry_rider/$id");
			}
		}


		public function rider_edit($id='')
		{
			$result['rider']=$this->db->query("SELECT * FROM `rider_listing` WHERE  `rider_listing`.`id`= '$id'");
			if ($result['rider']->num_rows()>0) {

				/*$result['data']=$this->db->query("SELECT `rider_listing`.*,`loundry_list`.`vendor_name` FROM `rider_listing` LEFT JOIN `loundry_list` ON `rider_listing`.`vendor_id`=loundry_list.`id` WHERE `rider_listing`.`vendor_id`= '$id'");*/


				$this->load->view('admin/rider-edit',$result);
				}else{
				return redirect('Auth');
			}
		}


		public function update_rider($value='')
		{
			//check_post();



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
				return redirect("Auth/rider_edit/$id");
				}else{
				setMessage('0','Error');
				return redirect("Auth/rider_edit/$id");
			}


		}

		public function category_management()
		{

			$result['data']=$this->db->query("SELECT * FROM `category`");
			$this->load->view('admin/category-management',$result);
		}

		public function add_category()
		{
			$this->load->view('admin/category-add');
		}

		public function add_new_category()
		{

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
				$data['icon']=$img['file_name'];
			}

			$data['name'] = $_POST['category_name'];
			$data['status'] = $_POST['status'];
			$this->db->insert('category', $data);
			setMessage('1','Category Added Successfully.');
			return redirect('Auth/category_management');
		}


		public function category_status($id="",$status="")
		{
			if (isset($id) && isset($status)) {

				$data['status'] = $status;
				$this->db->where(['id'=>$id])->update('category', $data);
				setMessage('1','Category Update Successfully.');
				}else{
				setMessage('0','Error');
			}
			return redirect('Auth/category_management');
		}


		public function edit_category($id="")
		{
			$data=$this->db->query("SELECT * FROM `category` WHERE  `category`.`id`='$id'");

			if ($data->num_rows()>0) {
				$result['data'] =$data->row_array();
				$this->load->view('admin/category-edit',$result);
				}else{
				return redirect('Auth/category_management');
			}
		}

		public function update_category($id="")
		{

			if (isset($id)) {
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
					$data['icon']=$img['file_name'];
				}

				$data['name'] = $_POST['category_name'];
				$data['status'] = $_POST['status'];

				$this->db->where(['id'=>$id])->update('category', $data);
				setMessage('1','Category Update Successfully.');
				}else{
				setMessage('0','Error');
			}
			return redirect('Auth/category_management');
		}


		public function unit_management()
		{

			$result['data']=$this->db->query("SELECT * FROM `unit_table`");
			$this->load->view('admin/unit-management',$result);
		}

		public function add_unit()
		{
			$this->load->view('admin/unit-add');
		}

		public function add_new_unit()
		{

			$data['unit_name'] = $_POST['unit_name'];
			$this->db->insert('unit_table', $data);
			setMessage('1','Unit Added Successfully.');
			return redirect('Auth/unit_management');
		}


		public function unit_status($id="",$status="")
		{
			if (isset($id) && isset($status)) {

				$data['status'] = $status;
				$this->db->where(['id'=>$id])->update('category', $data);
				setMessage('1','Unit Update Successfully.');
				}else{
				setMessage('0','Error');
			}
			return redirect('Auth/category_management');
		}


		public function edit_unit($id="")
		{
			$data=$this->db->query("SELECT * FROM `unit_table` WHERE  `unit_table`.`id`='$id'");

			if ($data->num_rows()>0) {
				$result['data'] =$data->row_array();
				$this->load->view('admin/unit-edit',$result);
				}else{
				return redirect('Auth/category_management');
			}
		}

		public function update_unit($id="")
		{

			if (isset($id)) {

				$data['unit_name'] = $_POST['unit_name'];


				$this->db->where(['id'=>$id])->update('unit_table', $data);
				setMessage('1','Unit Update Successfully.');
				}else{
				setMessage('0','Error');
			}
			return redirect('Auth/unit_management');
		}


		public function product_management($value='')
		{
			$result['data']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry'");
			$this->load->view('admin/product-laundry',$result);
		}

		public function laundry_product($loundry_id='')
		{
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$loundry_id'");
			if ($result['laundry']->num_rows()>0) {

				$result['units']=$this->db->query("SELECT * FROM `unit_table`");
				$result['category']=$this->db->query("SELECT * FROM `category` WHERE `category`.`status`= '1'");
				$result['products']=$this->db->query("SELECT `loundry_item_list`.*,`unit_table`.`unit_name` AS `unitname`,
				`country_list`.`country_name` AS `country` ,`country_list`.`currency_name` AS `currency_name`,`country_list`.`currency_symbol` AS `currency_symbol`,`category`.`name` AS `category_name` FROM `loundry_item_list`
				LEFT JOIN `unit_table` ON `loundry_item_list`.`unit_id`=`unit_table`.`id`
				LEFT JOIN `country_list` ON `loundry_item_list`.`country_id`=`country_list`.`id`
				LEFT JOIN `category` ON `loundry_item_list`.`category_id`=`category`.`id`
				WHERE `loundry_item_list`.`vendor_id`= '$loundry_id'");

				//echo "<pre>"; print_r($result['products']->result()); die();
				$this->load->view('admin/product-managment',$result);
				}else{
				return redirect('Auth');
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
				$this->load->view('admin/product-edit',$result);
				}else{
				return redirect('Auth');
			}
		}

		public function delete_product($id='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`= '$id'");

			if ($data->num_rows()>0) {

				$this->db->query("DELETE  FROM `loundry_item_list` WHERE `loundry_item_list`.`id`= '$id'");
				setMessage('1','Product Deleted Successfully.');
				return redirect("Auth/laundry_product/".$data->row()->vendor_id);
				}else{
				return redirect('Auth');
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
				return redirect('Auth/laundry_product/'.$product->row()->vendor_id);
				}else{
				setMessage('0','Error! Product Not Update');
				return redirect('Auth');
			}

		}

		public function add_new_product()
		{
			$loundry_id = post('laundry_id');
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
				$data['vendor_id'] = $_POST['laundry_id'];
				$data['category_id'] = $_POST['category'];
				$data['status'] = $_POST['status'];
				$data['added_date_time'] = date("Y-m-d h:i:s");;
				$data['update_date_time'] = date("Y-m-d h:i:s");;
				$data['unit_id'] = $_POST['unit'];
				$data['country_id'] = $laundry->row()->country_id;
				$data['unit_name'] = $unit->row()->unit_name;

				$this->db->insert('loundry_item_list', $data);

				setMessage('1','Product Not Added Successfully');
				return redirect('Auth/laundry_product/'.$laundry->row()->id);
				}else{
				setMessage('0','Error! Product Not Added');
				return redirect('Auth');
			}
		}

		public function product_status($id='',$value='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_item_list` WHERE `loundry_item_list`.`id`= '$id'");

			if ($data->num_rows()>0) {
				$data1['status'] =$value;
				$this->db->where(['id'=>$id])->update('loundry_item_list', $data1);
				setMessage('1','Product Update Successfully.');
				return redirect("Auth/laundry_product/".$data->row()->vendor_id);
				}else{
				return redirect('Auth');
			}

		}


		public function changePassword($value='')
		{
			$this->load->view('admin/change-password');
		}
		public function updatePassword($value='')
		{
			$id = $this->logged['user_id'];
			$old_password = $_POST['old_password'];
			$data = $this->db->query("SELECT * FROM `loundry_list`WHERE `loundry_list`.`type`='Admin' AND `loundry_list`.`id`= '$id'  AND `loundry_list`.`contact_password`= '$old_password'");

			if ($data->num_rows()>0) {
				$data1['contact_password'] = $_POST['new_password'];
				$this->db->where(['id'=>$id])->update('loundry_list', $data1);
				setMessage('1','Password has been change');
				return redirect('Auth');
				}else{
				setMessage('0','Error! Password can not change');
				return redirect('Auth/changePassword');
			}
		}

		public function check_post($value='')
		{
			echo "<pre>"; print_r($_POST); die;
		}

		public function laundry_wallet($id='')
		{
			$result['laundry']=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`= '$id'");
			if ($result['laundry']->num_rows()>0) {

				$result['income']=$this->db->query("SELECT `wallet_transaction_partner`.*,`loundry_list`.`vendor_name` FROM `wallet_transaction_partner` LEFT JOIN `loundry_list` ON `wallet_transaction_partner`.`vendor_id`=`loundry_list`.`id` WHERE `wallet_transaction_partner`.`status`=1 AND `wallet_transaction_partner`.`is_send_to_bank`=1 and `wallet_transaction_partner`.`status`=0 AND `wallet_transaction_partner`.`vendor_id`= '$id'");

				$result['out']=$this->db->query("SELECT `wallet_transaction_partner`.*,`loundry_list`.`vendor_name` FROM `wallet_transaction_partner` LEFT JOIN `loundry_list` ON `wallet_transaction_partner`.`vendor_id`=`loundry_list`.`id` WHERE `wallet_transaction_partner`.`status`=1 AND  `wallet_transaction_partner`.`vendor_id`= '$id'");

				// $result['in_amt']=$this->db->query("SELECT IFNULL(SUM(`wallet_transaction_partner`.`amt`),0) AS in_amt FROM `wallet_transaction_partner` WHERE `wallet_transaction_partner`.`type`=1
				// AND `wallet_transaction_partner`.`status` = 1 AND `wallet_transaction_partner`.`vendor_id` =$id");
				// //$in_amt->row()->in_amt;
				//
				//
				// $result['out_amt']=$this->db->query("SELECT IFNULL(SUM(`wallet_transaction_partner`.`amt`),0) AS out_amt FROM `wallet_transaction_partner` WHERE `wallet_transaction_partner`.`type`=0
				// AND `wallet_transaction_partner`.`status` = 1 AND `wallet_transaction_partner`.`vendor_id` =$id");


				$this->load->view('admin/laundry-wallet',$result);
				}else{
				return redirect('Auth');
			}
		}

		public function delete_wallet($id="",$laundry_id="")
		{

			$datat=$this->db->query("SELECT * FROM `wallet_transaction_partner` WHERE id='".$id."' and status!='"."2"."'");

			if ($datat->num_rows()>0) {
				$row_t=$datat->row();
				$data['status'] = 2;
				$this->db->where(['id'=>$id])->update('wallet_transaction_partner', $data);
				if($row_t->type=="1")
				{
					$this->db->query("Update loundry_list set wallet_balance=wallet_balance+'".$row_t->amt."' where id='".$row_t->vendor_id."'");
				}
				else {
						$this->db->query("Update loundry_list set wallet_balance=wallet_balance-'".$row_t->amt."' where id='".$row_t->vendor_id."'");
				}

				setMessage('1','Transaction Delete Successfully.');

				}
				else {
					setMessage('1','Transaction not found.');

				}


			// update_laundry_wallet($id);

			return redirect('Auth/laundry_wallet/'.$laundry_id);
		}

		public function insertWallet($value='')
		{

			$data['vendor_id'] = $_POST['laundry_id'];
			$data['amt'] = $_POST['amount'];
			$data['type'] = $_POST['type_wallet'];
			$data['transaction_operation'] = $_POST['trancection'];
			$data['remark'] = $_POST['remark'];
			$data['added_date'] = date("Y-m-d");
			$data['added_date_time'] = date("Y-m-d h:i:s");
			$data['status'] = 1;
			$data['is_send_to_bank'] = 0;


			$this->db->insert('wallet_transaction_partner', $data);
		//	update_laundry_wallet($_POST['laundry_id']);
			if($_POST['type_wallet']=="1")
			{
				$this->db->query("Update loundry_list set wallet_balance=wallet_balance+'".$_POST['amount']."' where id='".$_POST['laundry_id']."'");
			}
			else {
				$this->db->query("Update loundry_list set wallet_balance=wallet_balance-'".$_POST['amount']."' where id='".$_POST['laundry_id']."'");
			}
			setMessage($_POST['type_wallet'],'Wallet Update Successfully');
			return redirect('Auth/laundry_wallet/'.$_POST['laundry_id']);
		}


		public function laundry_booking()
		{

			if (post('dateFrom')!=null) {
				$dateFrom=post('dateFrom');
				$dateTo=post('dateTo');
				}else{
				$dateFrom=date('Y-m-d');
				$dateTo=date('Y-m-d');
			}

			$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE
			DATE_FORMAT(`placed_time`,'%Y-%m-%d') >= DATE_FORMAT('".$dateFrom."','%Y-%m-%d')  AND DATE_FORMAT(placed_time,'%Y-%m-%d') <= DATE_FORMAT('".$dateTo."','%Y-%m-%d')");
			$this->load->view('admin/laundry-booking',$result);
		}

		public function today_booking()
		{

			$dateFrom=date('Y-m-d');
			$dateTo=date('Y-m-d');

			$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE
			DATE_FORMAT(`placed_time`,'%Y-%m-%d') >= DATE_FORMAT('".$dateFrom."','%Y-%m-%d')  AND DATE_FORMAT(placed_time,'%Y-%m-%d') <= DATE_FORMAT('".$dateTo."','%Y-%m-%d')");
			$this->load->view('admin/today-booking',$result);
		}


		public function laundry_today_booking($laundry_id='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`='$laundry_id'");

			if ($data->num_rows()>0) {
				$dateFrom=date('Y-m-d');
				$dateTo=date('Y-m-d');

				$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` = $laundry_id AND
				DATE_FORMAT(`placed_time`,'%Y-%m-%d') >= DATE_FORMAT('".$dateFrom."','%Y-%m-%d')  AND DATE_FORMAT(placed_time,'%Y-%m-%d') <= DATE_FORMAT('".$dateTo."','%Y-%m-%d') ORDER BY placed_time DESC");
				$this->load->view('admin/laundry-today-booking',$result);
			}
		}

		public function laundry_all_booking($laundry_id='')
		{
			$data=$this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`type`='Loundry' AND `loundry_list`.`id`='$laundry_id' ");

			if ($data->num_rows()>0) {
				$dateFrom=date('Y-m-d');
				$dateTo=date('Y-m-d');

				$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`vendor_id` = $laundry_id  ORDER BY placed_time DESC");
				$this->load->view('admin/laundry-all-booking',$result);
			}
		}

		public function booking_details($booking_id='')
		{
			$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`id` = $booking_id");
			if ($result['booking']->num_rows()>0) {
				$result['booking_item']=$this->db->query("SELECT `booking_list_item`.*,`loundry_item_list`.`item_image` FROM `booking_list_item` LEFT JOIN `loundry_item_list` ON `booking_list_item`.`item_id` = `loundry_item_list`.`id` WHERE `booking_list_item`.`booking_id` = $booking_id");
				$this->load->view('admin/booking-details',$result);
			}
		}



		public function order_view()
		{
			$booking_id = post('id');
			$result['booking']=$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`id` = $booking_id");
			$result['status_list']=$this->db->query("SELECT *  FROM `booking_status` WHERE `booking_status`.`status`=1");

			if ($result['booking']->num_rows()>0) {
				$result['rider_lists']=$this->db->query("SELECT * FROM `rider_listing` WHERE `rider_listing`.`rider_status` = 1 AND  `rider_listing`.`vendor_id` = ".$result['booking']->row()->vendor_id."");
				$this->load->view('admin/order-action-view',$result);
			}
		}


		public function update_order_status($value='')
		{
			$booking_id = post('book_id');
			$pick_up_boy = post('pick_up_boy');
			$drop_boy_id = post('drop_boy');
			$booking_status = post('book_status');

			$booking_data =$this->db->query("SELECT * FROM `all_booking` WHERE `all_booking`.`id` = $booking_id");
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

			}
		}

		public function customer_management()
		{
			$result['data']=$this->db->query("SELECT * FROM `user_details` ORDER BY registration_date_time DESC");
			$this->load->view('admin/customer-management',$result);
		}

		public function customer_status($id="",$status="")
		{

			if (isset($id) && isset($status)) {

				$data['user_status'] = $status;
				$this->db->where(['id'=>$id])->update('user_details', $data);
				setMessage('1','Customer Update Successfully.');
				}else{
				setMessage('0','Error');
			}
			return redirect('Auth/customer_management');
		}
		public function edit_customer($customer_id="")
		{
			$data=$this->db->query("SELECT * FROM `user_details` WHERE `user_details`.`id` =$customer_id");
			//echo $this->db->last_query(); die();
			if ($data->num_rows()>0) {
				$result['data'] =$data->row_array();
				$this->load->view('admin/edit-customer',$result);
			}
		}


		public function update_customer($id="")
		{


			if (isset($id)) {
				//echo "<pre>"; print_r($_POST); die();


				$data['full_name'] = $_POST['customer_name'];
				$data['user_status'] = $_POST['status'];
				$data['gps_address'] = $_POST['locality'];
				$data['gps_lat'] = $_POST['latitude'];
				$data['gps_long'] = $_POST['longitude'];
				$data['user_status'] = $_POST['status'];

				$this->db->where(['id'=>$id])->update('user_details', $data);
				setMessage('1','Customer Update Successfully.');
				}else{
				setMessage('0','Error');
			}
			return redirect('Auth/customer_management');
		}
	}
