<?php
defined('BASEPATH') OR exit('No direct script access allowed');
ob_start();
class Login extends CI_Controller {


	public function index()
	{
		if($this->session->userdata('loggedUser'))
		return redirect('auth');
		$this->load->view('login');
	}

	public function authenticate()
	{
		//$condition=['user_id'=>$_POST['user_id'],'password'=>$_POST['password'],'block!='=>1,'access'=>"universal"];
		
		$name = $this->db->query("SELECT * FROM `loundry_list` WHERE `loundry_list`.`contact_number`='" . $_POST['user_id'] . "' AND `loundry_list`.`contact_password`='" . $_POST['password'] . "'");
		

		if($name->num_rows()>0)
		{
			
			$row = $name->row();
			$sessiondata=array(
				'name'     		=> 	$row->vendor_name,
				'user_id'		=>	$row->id,
				'user_email'  	=>	$row->contact_email_id,
				'designation' 	=>	$row->type,
				'mobile_no' 	=>	$row->contact_number,
				'doj' 			=>	$row->vendor_registration_date,
				'image' 	=>	$row->vendor_image,
				'vendor_lat' 	=>	$row->vendor_lat,
				'vendor_long' 	=>	$row->vendor_long
			);			
			$this->session->set_userdata('loggedUser',$sessiondata);
			return redirect('auth');
		}
		else
		{
			//$this->setMessage('0','UserID/Password is wrong');
			return redirect('login');
		}
		
	}
}
