<?php
	
	function send_email($to=NULL,$subject=NULL,$message=NULL,$mailfor=NULL)
	{
		$config = array (
		'protocol' => 'smtp',
		'smtp_host'=> EMAIL_SEND_URL,
		'smtp_user'=> EMAIL,
		'smtp_pass'=> EMAIL_PASSWORD,
		'charset'  => 'utf-8',
		'priority' => '1'
		);
		
		$this->email->initialize($config);
		$this->email
		->set_newline("\r\n")
		->from(EMAIL,$mailfor)
		->to(trim($to))
		->subject($subject)
		->message($message)
		->set_mailtype('html');
		$this->email->send();
		if(EMAIL_SEND_STATUS==1)
		{
			if($this->email->send())
			return 1;
			else
			return 0;
		}
		else
		{
			return 1;
		}
	}
	function get_round($value,$upto)
	{
		if(is_decimal($value))
		{
			return number_format($value, $upto);
		}
		else {
			// code...
			return $value;
		}
		
		// code...
	}
	
	function is_decimal( $val )
	{
		return is_numeric( $val ) && floor( $val ) != $val;
	}
	
	//getUpdatebooking($row_booking->id);
	//get_total_item_in_bucket($product['id'],$rowinfo['id']);
	
	function get_category_found($cat_id,$laundry_id)
	{
		$CI =& get_instance();
		$found_count=0;
		if($cat_id!=null && $cat_id!="" && $cat_id!="0")
		{
			$status="1";
			$querybk = $CI->db->query("SELECT * FROM `loundry_item_list` WHERE  `loundry_item_list`.`category_id`='$cat_id' and `loundry_item_list`.`vendor_id`='$laundry_id'
			and `loundry_item_list`.`status`='$status'");
			if ($querybk->num_rows()>0)
			{
				$found_count=$querybk->num_rows();
				
				
				
			}
			else {
				$found_count=0;
			}
			
		}
		else {
			// code...
			$found_count=1;
		}
        return $found_count;
	}
	
	function get_total_item_in_bucket($bucket_id,$booking_id)
	{
		$CI =& get_instance();
		
		$querybk = $CI->db->query("SELECT * FROM `booking_list` WHERE  `booking_list`.`id`='$booking_id'");
		
		if ($querybk->num_rows()>0)
		{
			$rowinfobk = $querybk->row_array();
			
			$productarray=[];
			$total_item_price=0;
			$total_tax=0;
			$total_addon=0;
		$total_item=0;
        $products = $CI->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`bucket_id`=".$bucket_id."");
        if($products->num_rows()>0)
        {
		foreach ($products->result_array() as $key => $product)
		{
		$total_item_price=$total_item_price+$product['total_amount'];
		$total_tax=$total_tax+$product['tax_amt'];
		$total_item=$total_item+$product['qty'];
		}
		$productres=[];
		$productres['total_item']= $total_item;
		$productres['total_item_price']= $total_item_price;
		
		return $productres;
		}
		else {
		// code...item not found
		$productres['total_item'] 	="0";
		$productres['total_item_price'] 	= "0";
		
		return $productres;
		
		}
		
		
		}
		else {
        $productres['total_item'] 	="0";
        $productres['total_item_price'] 	= "0";
		
		return $productres;
        // code...booking not found
		}
		$productres['total_item'] 	="0";
		$productres['total_item_price'] 	= "0";
		
        return $productres;
		}
		
		
		function getUpdatebooking($booking_id)
		{
		$CI =& get_instance();
		
		$querybk = $CI->db->query("SELECT * FROM `booking_list` WHERE  `booking_list`.`id`='$booking_id'");
		
		if ($querybk->num_rows()>0)
		{
        $rowinfobk = $querybk->row_array();
		
        $productarray=[];
        $total_item_price=0;
        $total_tax=0;
        $total_addon=0;
        $products = $CI->db->query("SELECT * FROM `booking_list_item` WHERE `booking_list_item`.`booking_id`=".$rowinfobk['id']."");
        if($products->num_rows()>0)
        {
		foreach ($products->result_array() as $key => $product)
		{
		$total_item_price=$total_item_price+$product['total_amount'];
		$total_tax=$total_tax+$product['tax_amt'];
		}
		//update addon
		$productsad = $CI->db->query("SELECT * FROM `addon_charges_in_booking` WHERE `addon_charges_in_booking`.`booking_id`=".$rowinfobk['id']."");
		if($productsad->num_rows()>0)
		{
		foreach ($productsad->result_array() as $key => $productad)
		{
		if($productad['amount']>0)
		{
		$addon_amount="0";
		if($productad['amount_type']=="Percent")
		{
		$addon_amount=($total_item_price*$productad['amount']/100);
		}
		else {
		$addon_amount=$productad['amount'];
		// code...
		}
		$CI->db->query("Update `addon_charges_in_booking` set addon_amount='$addon_amount' WHERE `addon_charges_in_booking`.`id`=".$productad['id']."");
		
		}
		}
		}
		//update addon end
		//calculate addons
		
		$productsad = $CI->db->query("SELECT * FROM `addon_charges_in_booking` WHERE `addon_charges_in_booking`.`booking_id`=".$rowinfobk['id']."");
		if($productsad->num_rows()>0)
		{
		foreach ($productsad->result_array() as $key => $productad)
		{
		
		$total_addon=$total_addon+$productad['addon_amount'];
		}
		}
		
		//calculate addons end
		
		$total_amount=$total_item_price+$total_tax+$total_addon+$rowinfobk['delivery_charge'];
		$total_paid=$rowinfobk['paid_by_promo']+$rowinfobk['paid_by_wallet']+$rowinfobk['paid_by_online']+$rowinfobk['paid_by_cash'];
		$skip_for_pay=$total_amount-$total_paid;
		$CI->db->query("Update `booking_list` set total_item_price='$total_item_price'
		,tax_amt='$total_tax',total_amt='$total_amount',skip_for_pay='$skip_for_pay',total_addon='$total_addon'
		WHERE `booking_list`.`id`=".$rowinfobk['id']."");
		return true;
		}
		else {
		// code...item not found
		return false;
		}
		
		
		}
		else {
        return false;
        // code...booking not found
		}
		return false;
		}
		
		
		//get_amount_inc2($total_item_price2,$product2['increase_decrease'],$product2['amount'],$product2['amount_type'])
		
		function get_amount_inc2($item_price,$increased_product_operation,$increased_product,$increased_product_type)
		{
		if($increased_product>0)
		{
		$inc_amt=0;
		if($increased_product_type=="Percent")
		{
		$inc_amt=($item_price*$increased_product/100);
		}
		else {
		$inc_amt=$increased_product;
		// code...
		}
		
		return $inc_amt;
		}
		else {
		// code...
		return "0";
		}
		
		
		return "0";
		}
		
		
		
		function get_amount_inc($item_price,$increased_product_operation,$increased_product,$increased_product_type)
		{
		if($increased_product>0)
		{
		$inc_amt=0;
		if($increased_product_type=="Percent")
		{
		$inc_amt=($item_price*$increased_product/100);
		}
		else {
		$inc_amt=$increased_product;
		// code...
		}
		$updated_amount=$item_price;
		if($increased_product_operation=="plus")
		{
		$updated_amount=($item_price+$inc_amt);
		}
		else {
		// code...
		$updated_amount=($item_price-$inc_amt);
		}
		return $updated_amount;
		}
		else {
		// code...
		return $item_price;
		}
		
		
		return $item_price;
		}
		
		
		
		function gettablerow($value,$table,$column)
		{
		$CI =& get_instance();
		$game_row;
		$querygame = $CI->db->query("SELECT * FROM ".$table." WHERE ".$column."='$value'");
		if ($querygame->num_rows() > 0)
		{
		$game_row = $querygame->row();
		return $game_row;
		}
		else
		{
		return null;
		}
		}
		
		function send_notification_ul($device_token,$type,$title,$message,$id,$image)
		{
		//  echo "test0";
		if($device_token!=null)
		{
		//echo "test1";
		//	$title="OSR New ".$rowInfocategory['vehicle_title']." Booking available for confirmation.";
		//$message="OSR ".$rowInfocategory['vehicle_title']." Booking Id #".$tempbookingid." available for confiramtion.";
		
		$is_background="false";
		date_default_timezone_set("Asia/Kolkata");
		$ctime=date("Y-m-d H:i:s");
		$timestamp=$ctime;
		$cdate=date("Y-m-d");
		$order_id=$id;
		$img=$image;
		
		
		$tokenarray = array($device_token);
		$msg2 = array ('message' => $message, 'title' => $title, 'is_background' => $is_background, 'image' => $img, 'noturl' => "",'timestamp' => $timestamp, 'post' => '', 'extra' => $type."#".$order_id);
		
		$fields = array (
		'registration_ids'     => $tokenarray,
		'data'            => $msg2 );
		//echo "fields ".$fields;
		//AAAAFF6lxMM:APA91bFm46_zdxiS8B4Sc7Rknp1P6mTPKrH17B6vZcneDKH_UiryhzBl7QN2EygxuXL6G52Gxmyj-U7qCqPRRhBoFk2xADUgkMeoUu5VQMTQ9Qa6R7ygc1n7UXEnXnH9jMlDRu2N5Eaz
		$headers = array (
		'Authorization: key=' . "AAAAFF6lxMM:APA91bFm46_zdxiS8B4Sc7Rknp1P6mTPKrH17B6vZcneDKH_UiryhzBl7QN2EygxuXL6G52Gxmyj-U7qCqPRRhBoFk2xADUgkMeoUu5VQMTQ9Qa6R7ygc1n7UXEnXnH9jMlDRu2N5Eaz",
		'Content-Type: application/json'
		);
		//AIzaSyD7C71MkPwZYwYpvU-3cqC4EdEk31hE250
		$ch = curl_init();
        curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
        curl_setopt( $ch,CURLOPT_POST, true );
        curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
        curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
        curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
        curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
        $result = curl_exec($ch );
        curl_close( $ch );
		//echo $result;
		
		
		//		sendGCMUser($title,$message,$is_background,$image,$timestamp, $devicetokenuser,$lstInsertId);
		
		//$msg='<div id="message" class="alert alert-success" style="margin-top:8px; width:19%;">Notification Sended successfully!</div>';
		
		}
		}
		
		
		function send_notification_ultesting($device_token,$type,$title,$message,$id,$image)
		{
		//  echo "test0";
		if($device_token!=null)
		{
		//echo "test1";
		//	$title="OSR New ".$rowInfocategory['vehicle_title']." Booking available for confirmation.";
		//$message="OSR ".$rowInfocategory['vehicle_title']." Booking Id #".$tempbookingid." available for confiramtion.";
		
		$is_background="false";
		date_default_timezone_set("Asia/Kolkata");
		$ctime=date("Y-m-d H:i:s");
		$timestamp=$ctime;
		$cdate=date("Y-m-d");
		$order_id=$id;
		$img=$image;
		
		
		$tokenarray = array($device_token);
		$msg2 = array ('message' => $message, 'title' => $title, 'is_background' => $is_background, 'image' => $img, 'noturl' => "",'timestamp' => $timestamp, 'post' => '', 'extra' => $type."#".$order_id);
		
		$fields = array (
		'registration_ids'     => $tokenarray,
		'data'            => $msg2 );
		//echo "fields ".$fields;
		//AAAAFF6lxMM:APA91bFm46_zdxiS8B4Sc7Rknp1P6mTPKrH17B6vZcneDKH_UiryhzBl7QN2EygxuXL6G52Gxmyj-U7qCqPRRhBoFk2xADUgkMeoUu5VQMTQ9Qa6R7ygc1n7UXEnXnH9jMlDRu2N5Eaz
		$headers = array (
		'Authorization: key=' . "AAAAFF6lxMM:APA91bFm46_zdxiS8B4Sc7Rknp1P6mTPKrH17B6vZcneDKH_UiryhzBl7QN2EygxuXL6G52Gxmyj-U7qCqPRRhBoFk2xADUgkMeoUu5VQMTQ9Qa6R7ygc1n7UXEnXnH9jMlDRu2N5Eaz",
		'Content-Type: application/json'
		);
		//AIzaSyD7C71MkPwZYwYpvU-3cqC4EdEk31hE250
		$ch = curl_init();
        curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
        curl_setopt( $ch,CURLOPT_POST, true );
        curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
        curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
        curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
        curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
        $result = curl_exec($ch );
        curl_close( $ch );
		echo $result;
		
		
		//		sendGCMUser($title,$message,$is_background,$image,$timestamp, $devicetokenuser,$lstInsertId);
		
		//$msg='<div id="message" class="alert alert-success" style="margin-top:8px; width:19%;">Notification Sended successfully!</div>';
		
		}
		}
		
		
		
		function send_smsamitsir($mob,$msg,$id)
		{
		$url ="http://sms.messageindiaa.in/v2/sendSMS";
		$params = array (
		'sendername'=>"your sender id",
		'message'=>$msg,
		'username'=>"your username",
		'smstype'=>"TRANS",
		'numbers'=>$mob,
		'apikey'=>"your api key",
		'peid'=>"1701161855845755206",
		'templateid'=>$id,
		);
		
		$options = array(
		CURLOPT_SSL_VERIFYHOST => 0,
		CURLOPT_SSL_VERIFYPEER => 0
		);
		
		$defaults = array(
		CURLOPT_URL => $url. (strpos($url, '?')
		=== FALSE ? '?' : ''). http_build_query($params),
		CURLOPT_HEADER => 0,
		CURLOPT_RETURNTRANSFER => TRUE,
		CURLOPT_TIMEOUT =>56
		);
		
		$ch = curl_init();
		curl_setopt_array($ch, ($options + $defaults));
		$result = curl_exec($ch);
		if(!$result)
		{
		trigger_error(curl_error($ch));
		$flag=0;
		}
		else
		{
		$flag=1;
		}
		curl_close($ch);
		//echo $result;
		}
		
		
		
		
		
		
		/*----------------Convert Number------------------*/
		function post($name)
		{
		$CI =& get_instance();
		return ($CI->input->post($name));
		}
		
		function convertNumberToWord($num = false)
		{
		$num = str_replace(array(',', ' '), '' , trim($num));
		if(! $num) {
		return false;
		}
		$num = (int) $num;
		$words = array();
		$list1 = array('', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
		'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
		);
		$list2 = array('', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety', 'hundred');
		$list3 = array('', 'thousand', 'million', 'billion'
		);
		$num_length = strlen($num);
		$levels = (int) (($num_length + 2) / 3);
		$max_length = $levels * 3;
		$num = substr('00' . $num, -$max_length);
		$num_levels = str_split($num, 3);
		for ($i = 0; $i < count($num_levels); $i++) {
		$levels--;
		$hundreds = (int) ($num_levels[$i] / 100);
		$hundreds = ($hundreds ? ' ' . $list1[$hundreds] . ' hundred' . ( $hundreds == 1 ? '' : 's' ) . ' ' : '');
		$tens = (int) ($num_levels[$i] % 100);
		$singles = '';
		if ( $tens < 20 ) {
		$tens = ($tens ? ' ' . $list1[$tens] . ' ' : '' );
		} else {
		$tens = (int)($tens / 10);
		$tens = ' ' . $list2[$tens] . ' ';
		$singles = (int) ($num_levels[$i] % 10);
		$singles = ' ' . $list1[$singles] . ' ';
		}
		$words[] = $hundreds . $tens . $singles . ( ( $levels && ( int ) ( $num_levels[$i] ) ) ? ' ' . $list3[$levels] . ' ' : '' );
		}
		$commas = count($words);
		if ($commas > 1) {
		$commas = $commas - 1;
		}
		$data= implode(' ', $words);
		return $data." ".'only';
		}
		
		
		function otpcode2($x)
		{
		
		return $randomNum=substr(str_shuffle("0123456789abcdefghijklmnopqrstvwxyzABCDEFGHIJKLMNOPQRSTVWXYZ"), 0, $x);
		
		}
		
		function otpcode($x)
		{
		$x=4;
		//return $randomNum=substr(str_shuffle("0123456789abcdefghijklmnopqrstvwxyzABCDEFGHIJKLMNOPQRSTVWXYZ"), 0, $x);
		return $randomNum=substr(str_shuffle("0123456789"), 0, $x);
		}
		// function makes curl request to firebase servers
		
		// sending push message to single user by firebase reg id
		function send22($to, $message) {
		$fields = array(
		'to' => $to,
		'data' => $message,
		);
		return sendPushNotification22($fields);
		}
		
		// function makes curl request to firebase servers
		function sendPushNotification22($fields) {
		
        // Set POST variables
		$url = 'https://fcm.googleapis.com/fcm/send';
		
		$headers = array(
		'Authorization: key=' . FIREBASE_API_KEY,
		'Content-Type: application/json'
		);
        // Open connection
		$ch = curl_init();
		
        // Set the url, number of POST vars, POST data
		curl_setopt($ch, CURLOPT_URL, $url);
		
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		
        // Disabling SSL Certificate support temporarly
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		
		curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
		
        // Execute post
		$result = curl_exec($ch);
		if ($result === FALSE) {
		die('Curl failed: ' . curl_error($ch));
		}
		
        // Close connection
		curl_close($ch);
		
		json_encode($result);
		}
		
		
		
		function driver_list_userid($lat, $long, $catid, $ridetype)
		{
		$CI = & get_instance();
		$date = date("Y-m-d");
		$items = array();
		if(!empty($lat) && !empty($long))
		{
		if($ridetype == 2){
		$sql = "SELECT `or_m_user_id`,ROUND(6371 * 2 * ASIN(SQRT( POWER(SIN(('".$lat."' - ABS(or_m_lat)) *
		PI()/180 / 2), 2) + COS('".$lat."' * PI()/180 ) * COS(ABS(or_m_lat) * PI()/180) * POWER(SIN(('".$long."' - or_m_long) *
		PI()/180 / 2), 2) ))) AS distance FROM `m03_user_detail`  WHERE or_is_front= 'yes' AND c02_c01_cat_id_mulltiple = $catid AND `or_m_designation`=2
		HAVING distance < 3
		ORDER BY distance LIMIT 0, 6";
		}else{
		$sql = "SELECT `or_m_user_id`,ROUND(6371 * 2 * ASIN(SQRT( POWER(SIN(('".$lat."' - ABS(or_m_lat)) *
		PI()/180 / 2), 2) + COS('".$lat."' * PI()/180 ) * COS(ABS(or_m_lat) * PI()/180) * POWER(SIN(('".$long."' - or_m_long) *
		PI()/180 / 2), 2) ))) AS distance FROM `m03_user_detail` where or_is_front= 'yes' AND  or_ride_type = '".$ridetype."' AND c02_c01_cat_id_mulltiple = $catid AND `or_m_designation`=2
		HAVING distance < 3
		ORDER BY distance LIMIT 0, 6";
		}
		
		$coupon = $CI->db->query($sql)->result_array();
		foreach ($coupon as $key => $value)
		{
		$items[] = $value['or_m_user_id'];
		}
		return implode(",",$items);
		}else{
		return 0;
		}
		}
		
		
		function success_response($result)
		{
		header("Content-Type:application/json");
		// $data = array(
		// "status" => true,
		// "result" => $result
		// );
		
		$result['status']=true;
		$pdata['response']=$result;
		echo json_encode($pdata, true);
		die;
		}
		
		/*----------------Mobile Web Service For Fail Response------------------*/
		
		function fail_response($result)
		{
		header("Content-Type:application/json");
		// $data = array(
		// "status" => false,
		// "result" => $result
		// );
		
		//--
		$data = array(
		"status" => false,
		"msg" => $result,
		
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true);
		die;
		}
		
		
		function is_blank($fieldname,$fild)
		{
		if($fieldname=='')
		{
		
		$data = array(
		"status" => false,
		"msg" => $fild .' is empty'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		}
		
		else
		{
		return true;
		}
		}
		
		function convertdate($date)
		{
		if($date != '')
		{
		$date=date('Y-m-d',strtotime($date));
		}else{
		$date=date('Y-m-d');
		}
		return $date;
		
		}
		function dateforview($date)
		{
		if($date != '')
		{
		$date=date('m/d/Y',strtotime($date));
		}else{
		$date='';
		}
		return $date;
		
		}
		
		function is_check_mobile($mobile)
		{
		
		$CI =& get_instance();
		$query=$CI->db->query("select m04_cust_mobile_no from m04_customer where m04_cust_mobile_no='$mobile'");
		
		if($query->num_rows() > 0)
		{
		
		$data = array(
		"status" => false,
		"msg" => 'Mobile Number Already Registered'
		);
		echo json_encode($data, true); die;
		
		}
		else
		{
		return true;
		}
		}
		
		function is_check_email($email)
		{
		
		$CI =& get_instance();
		$query=$CI->db->query("select m04_cust_email from m04_customer where m04_cust_email='$email'");
		
		if($query->num_rows() > 0)
		{
		
		$data = array(
		"status" => false,
		"msg" => 'Email Id Already Registered'
		);
		echo json_encode($data, true); die;
		
		}
		else
		{
		return true;
		}
		}
		
		
		function setMessage($param1='',$param2='')
		{
		$CI =& get_instance();
		if($param1==1)
		{
		
		$CI->session->set_flashdata('msg',$param2);
		$CI->session->set_flashdata('msg_class','alert-success');
		}
		else
		{
		$CI->session->set_flashdata('msg',$param2);
		$CI->session->set_flashdata('msg_class','alert-danger');
		}
		}
		
		
		function check_post()
		{
		echo "<pre>"; print_r($_POST); die;
		}
		
		
		function laundry_total_rider($laundry_id='')
		{
		
		$CI =& get_instance();
		$total_rider=$CI->db->query("SELECT IFNULL(COUNT(`rider_listing`.`id`),0) AS total_rider FROM `rider_listing` WHERE `rider_listing`.`vendor_id` =$laundry_id");
		echo $total_rider->row()->total_rider;
		}
		
		
		function laundry_active_rider($laundry_id='')
		{
		
		$CI =& get_instance();
		$active_rider=$CI->db->query("SELECT IFNULL(COUNT(`rider_listing`.`id`),0) AS active_rider FROM `rider_listing` WHERE `rider_listing`.`rider_status` =1 AND `rider_listing`.`vendor_id` =$laundry_id");
		echo $active_rider->row()->active_rider;
		}
		
		function laundry_banner($laundry_id='')
		{
		
		$CI =& get_instance();
		$data=$CI->db->query("SELECT IFNULL(COUNT(`loundry_banner`.`id`),0) AS all_banner FROM `loundry_banner` WHERE `loundry_banner`.`vendor_id` =$laundry_id");
		echo $data->row()->all_banner;
		}
		
		function laundry_date($laundry_id='')
		{
		
		$CI =& get_instance();
		$data=$CI->db->query("SELECT IFNULL(COUNT(`loundry_day_list`.`id`),0) AS all_day FROM `loundry_day_list` WHERE `loundry_day_list`.`status`=1 AND `loundry_day_list`.`vendor_id` =$laundry_id");
		echo $data->row()->all_day;
		}
		
		function laundry_deactive_rider($laundry_id='')
		{
		
		$CI =& get_instance();
		$active_rider=$CI->db->query("SELECT IFNULL(COUNT(`rider_listing`.`id`),0) AS deactive_rider FROM `rider_listing` WHERE `rider_listing`.`rider_status` =0 AND `rider_listing`.`vendor_id` =$laundry_id");
		echo $active_rider->row()->deactive_rider;
		}
		function laundry_product($laundry_id='')
		{
		
		$CI =& get_instance();
		$loundry_items=$CI->db->query("SELECT ifnull(COUNT(`loundry_item_list`.`id`),0) as loundry_items from `loundry_item_list` where `loundry_item_list`.`vendor_id` =$laundry_id");
		//echo $CI->db->last_query();
		echo $loundry_items->row()->loundry_items;
		}
		
		function laundry_today_order($laundry_id='')
		{
		
		$CI =& get_instance();
		$data=$CI->db->query("SELECT IFNULL(COUNT(`booking_list`.`id`),0) AS today_booking FROM `booking_list` WHERE DATE_FORMAT(`placed_time`,'%Y-%m-%d') =CURDATE() AND `booking_list`.`vendor_id` =$laundry_id");
		echo $data->row()->today_booking;
		}
		
		function laundry_total_order($laundry_id='')
		{
		
		$CI =& get_instance();
		$data=$CI->db->query("SELECT IFNULL(COUNT(`booking_list`.`id`),0) AS today_booking FROM `booking_list` WHERE  `booking_list`.`vendor_id` =$laundry_id");
		echo $data->row()->today_booking;
		}
		
		/*Admin Dashboard */
		function all_rider()
		{
		
		$CI =& get_instance();
		$total_rider=$CI->db->query("SELECT IFNULL(COUNT(`rider_listing`.`id`),0) AS total_rider FROM `rider_listing` WHERE `rider_listing`.`vendor_id` =$laundry_id");
		echo $total_rider->row()->total_rider;
		}
		
		function all_active_rider()
		{
		
		$CI =& get_instance();
		$active_rider=$CI->db->query("SELECT IFNULL(COUNT(`rider_listing`.`id`),0) AS active_rider FROM `rider_listing` WHERE `rider_listing`.`rider_status` =1");
		echo $active_rider->row()->active_rider;
		}
		
		function all_deactive_rider()
		{
		
		$CI =& get_instance();
		$active_rider=$CI->db->query("SELECT IFNULL(COUNT(`rider_listing`.`id`),0) AS deactive_rider FROM `rider_listing` WHERE `rider_listing`.`rider_status` =0");
		echo $active_rider->row()->deactive_rider;
		}
		function all_product()
		{
		
		$CI =& get_instance();
		$loundry_items=$CI->db->query("SELECT ifnull(COUNT(`loundry_item_list`.`id`),0) as loundry_items from `loundry_item_list`");
		//echo $CI->db->last_query();
		echo $loundry_items->row()->loundry_items;
		}
		
		function all_order()
		{
		
		$CI =& get_instance();
		$data=$CI->db->query("SELECT IFNULL(COUNT(*),0) AS total_order FROM `booking_list`");
		echo $data->row()->total_order;
		}
		
		function today_order()
		{
		
		$CI =& get_instance();
		$data=$CI->db->query("SELECT IFNULL(COUNT(`booking_list`.`id`),0) AS today_booking FROM `booking_list` WHERE DATE_FORMAT(`placed_time`,'%Y-%m-%d') =CURDATE()");
		echo $data->row()->today_booking;
		}
		
		function all_category()
		{
		
		$CI =& get_instance();
		$data=$CI->db->query("SELECT IFNULL(COUNT(*),0) AS all_categry FROM `category` WHERE status=1");
		echo $data->row()->all_categry;
		}
		
		
		function all_unit()
		{
		
		$CI =& get_instance();
		$data=$CI->db->query("SELECT IFNULL(COUNT(*),0) AS all_unit FROM `unit_table`");
		echo $data->row()->all_unit;
		}
		function all_laundry($type="")
		{
		
		$CI =& get_instance();
		if ($type==2) {
		$data=$CI->db->query("SELECT IFNULL(COUNT(*),0) AS total_loundry FROM `loundry_list` where `loundry_list`.`type`='Loundry' AND is_verified =0");
		echo $data->row()->total_loundry;
		}elseif ($type==1) {
		$data=$CI->db->query("SELECT IFNULL(COUNT(*),0) AS total_loundry FROM `loundry_list` where vendor_status=1 AND is_verified =1 AND `loundry_list`.`type`='Loundry'");
		echo $data->row()->total_loundry;
		}elseif ($type==0) {
		$data=$CI->db->query("SELECT IFNULL(COUNT(*),0) AS total_loundry FROM `loundry_list` where vendor_status=0 AND is_verified =1 AND `loundry_list`.`type`='Loundry'");
		echo $data->row()->total_loundry;
		}else{
		$data=$CI->db->query("SELECT IFNULL(COUNT(*),0) AS total_loundry FROM `loundry_list` Where is_verified =1 AND `loundry_list`.`type`='Loundry'");
		echo $data->row()->total_loundry;
		}
		
		}
		
		
		// function laundry_wallet($laundry_id='')
		// {
		// 	$wallet_amt = 0;
		//
		// 	$CI =& get_instance();
		// 	$in_amt=$CI->db->query("SELECT IFNULL(SUM(`wallet_transaction_partner`.`amt`),0) AS in_amt FROM `wallet_transaction_partner` WHERE `wallet_transaction_partner`.`type`=1
		// 	AND `wallet_transaction_partner`.`status` = 1 AND `wallet_transaction_partner`.`vendor_id` =$laundry_id");
		// 	$in_amt->row()->in_amt;
		//
		//
		// 	$out_amt=$CI->db->query("SELECT IFNULL(SUM(`wallet_transaction_partner`.`amt`),0) AS out_amt FROM `wallet_transaction_partner` WHERE `wallet_transaction_partner`.`type`=0
		// 	AND `wallet_transaction_partner`.`status` = 1 AND `wallet_transaction_partner`.`vendor_id` =$laundry_id");
		// 	$out_amt->row()->out_amt;
		//
		// 	$wallet_amt = $in_amt->row()->in_amt - $out_amt->row()->out_amt;
		//
		// 	return $wallet_amt;
		//
		// }
		
		function laundry_wallet($laundry_id='')
		{
		$wallet_amt = 0;
		
		$CI =& get_instance();
		$queryvendor=$CI->db->query("SELECT * from loundry_list where `id` =$laundry_id");
		if($queryvendor->num_rows() > 0)
		{
		$row_vendor=$queryvendor->row();
		return $row_vendor->wallet_balance;
		}
		else {
		return 0;
		// code...
		}
		
		
		}
		
		
		
		function get_symbol_by_laundry_id($laundry_id='')
		{
		$wallet_amt = 0;
		$currency_name="";
		$currency_symbol="";
		
		$CI =& get_instance();
		$queryvendor=$CI->db->query("SELECT * from loundry_list where `id` =$laundry_id");
		if($queryvendor->num_rows() > 0)
		{
		$row_vendor=$queryvendor->row();
		$query_country=$CI->db->query("SELECT * from country_list  where `id` ='".$row_vendor->country_id."'");
		if($query_country->num_rows() > 0)
		{
		$row_country=$query_country->row();
		$currency_name=$row_country->currency_name;
		$currency_symbol=$row_country->currency_symbol;
		
		}
		}
		$resc['c_name']=$currency_name;
		$resc['c_symbol']=$currency_symbol;
		return $resc;
		}
		
		
		
		function update_laundry_wallet($laundry_id='')
		{
		$wallet_amt = 0;
		
		$CI =& get_instance();
		$in_amt=$CI->db->query("SELECT IFNULL(SUM(`wallet_transaction_partner`.`amt`),0) AS in_amt FROM `wallet_transaction_partner` WHERE `wallet_transaction_partner`.`type`=1
		AND `wallet_transaction_partner`.`status` = 1 AND `wallet_transaction_partner`.`vendor_id` =$laundry_id");
		$in_amt->row()->in_amt;
		
		
		$out_amt=$CI->db->query("SELECT IFNULL(SUM(`wallet_transaction_partner`.`amt`),0) AS out_amt FROM `wallet_transaction_partner` WHERE `wallet_transaction_partner`.`type`=0
		AND `wallet_transaction_partner`.`status` = 1 AND `wallet_transaction_partner`.`vendor_id` =$laundry_id");
		$out_amt->row()->out_amt;
		
		$wallet_amt = $in_amt->row()->in_amt - $out_amt->row()->out_amt;
		
		
		$data['wallet_balance'] = $wallet_amt;
		$CI->db->where(['id'=>$laundry_id])->update('loundry_list', $data);
		
		
		}
		
		
		
		function is_user_email($email)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select email_id from user_details where email_id='$email'");
		
		if($query->num_rows() > 0)
		{
		
		$data = array(
		"status" => false,
		"msg" => 'Email is already Registered'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		}
		
		else
		{
		return true;
		}
		}
		
		
		function is_user_not($email)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select id from user_details where id='$email'");
		
		if($query->num_rows() > 0)
		{
		return true;
		
		}
		
		else
		{
		$data = array(
		"status" => false,
		"msg" => 'User id not found.'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		
		}
		}
		
		function is_user_mobile($mobile)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select mobile_number from user_details where mobile_number='$mobile'");
		
		if($query->num_rows() > 0)
		{
		
		$data = array(
		"status" => false,
		"msg" => 'Mobile Number is already Registered'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		}
		
		else
		{
		return true;
		}
		}
		
		function saveImageFile($tag='',$folder)
		{
		if(isset($_FILES[$tag]) && is_uploaded_file($_FILES[$tag]['tmp_name']))
		{
		$image=time().otpcode2(8).$_FILES[$tag]['name'];
		@move_uploaded_file($_FILES[$tag]['tmp_name'],$folder.$image);
		return $image;
		}else{
		return "";
		}
		}
		
		function is_laundry_email($email)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select contact_email_id from loundry_list where contact_email_id='$email'");
		
		if($query->num_rows() > 0)
		{
		
		$data = array(
		"status" => false,
		"msg" => 'Email is already Registered'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		}
		
		else
		{
		return true;
		}
		}
		
		
		function is_laundry_not($laundry_id)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select id from loundry_list where id='$laundry_id'");
		
		if($query->num_rows() > 0)
		{
		return true;
		}
		else
		{
		$data = array(
		"status" => false,
		"msg" => 'Laundry id not found.'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		
		}
		}
		
		
		function is_item_not($item_id)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select id from loundry_item_list where id='$item_id'");
		
		if($query->num_rows() > 0)
		{
		return true;
		}
		else
		{
		$data = array(
		"status" => false,
		"msg" => 'Item id not found.'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		
		}
		}
		
		function is_laundry_mobile($mobile)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select contact_number from loundry_list where contact_number='$mobile'");
		
		if($query->num_rows() > 0)
		{
		
		$data = array(
		"status" => false,
		"msg" => 'Mobile Number is already Registered'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		}
		
		else
		{
		return true;
		}
		}
		
		function is_country_not($country_id)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select id from country_list where id='$country_id'");
		
		if($query->num_rows() > 0)
		{
		return true;
		}
		else
		{
		$data = array(
		"status" => false,
		"msg" => 'Country id not found.'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		
		}
		}
		
		
		function is_rider_not($rider_id)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select id from rider_listing where id='$rider_id'");
		
		if($query->num_rows() > 0)
		{
		return true;
		}
		else
		{
		$data = array(
		"status" => false,
		"msg" => 'Rider id not found.'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		
		}
		}
		
		function is_rider_mobile($mobile)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select rider_mobile_no from rider_listing where rider_mobile_no='$mobile'");
		
		if($query->num_rows() > 0)
		{
		
		$data = array(
		"status" => false,
		"msg" => 'Mobile Number is already Registered'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		}
		
		else
		{
		return true;
		}
		}
		
		function is_rider_email($email)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select rider_email_id from rider_listing where rider_email_id='$email'");
		
		if($query->num_rows() > 0)
		{
		$data = array(
		"status" => false,
		"msg" => 'Email is already Registered'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		}
		
		else
		{
		return true;
		}
		}
		
		function is_laundry_rider($laundry_id,$rider_id)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select id from rider_listing where id='$rider_id' AND vendor_id='$laundry_id'");
		
		if($query->num_rows() > 0)
		{
		return true;
		}
		else
		{
		$data = array(
		"status" => false,
		"msg" => 'Rider is this laundry.'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		
		}
		}
		
		function is_day_not($day_id)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select id from day_list where id='$day_id'");
		
		if($query->num_rows() > 0)
		{
		return true;
		}
		else
		{
		$data = array(
		"status" => false,
		"msg" => 'Day id not found.'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		
		}
		}
		
		
		function is_laundry_day_not($day_id)
		{
		$CI =& get_instance();
		$query=$CI->db->query("select id from loundry_day_list where id='$day_id'");
		
		if($query->num_rows() > 0)
		{
		return true;
		}
		else
		{
		$data = array(
		"status" => false,
		"msg" => 'Laundry Day id not found.'
		);
		$pdata['response']=$data;
		echo json_encode($pdata, true); die;
		
		}
		}
		?>
				