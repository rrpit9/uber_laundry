<?php
defined('BASEPATH') OR exit('No direct script access allowed');
ob_start();
class Stable extends CI_Controller {

	public function __construct()
	{
		parent:: __construct();
		date_default_timezone_set('Asia/Kolkata');
	}	

	public function logout()
	{
		$this->session->unset_userdata('loggedUser');
		session_destroy();
		return redirect('login');
	}
}