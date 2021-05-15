<?php
include_once '../includes.php';
$_POST = json_decode(file_get_contents('php://input'), true);

if ($_POST['action']=="add_new_request") {
	$name=$_POST['user_name'];
	$mobile=$_POST['user_mobile'];
	$landmark=$_POST['landmark'];
	$pincode=$_POST['pincode'];
	$area=$_POST['area'];
	$district=$_POST['district'];
	$region=$_POST['region'];
	$state=$_POST['state'];
	$required_stuff=$_POST['required_stuff'];
	$remark=$_POST['remark'];

	$temp_request_id = $srijan->get_request_id();

	$request_id='NSR'.$temp_request_id;

	$isVerified = 0;

	$verification_code = rand(100000,999999);
	$create_date=time();

	if ($name=="" || $mobile=="" || $landmark=="" || $pincode=="" || $required_stuff=="" || $remark=="") 
	{
		$message= "All fields are required";
	}
	else{

		$data=$srijan->add_new_request($request_id,$name,$mobile,$landmark,$pincode,$area,$district,$region,$state,$required_stuff,$remark,$isVerified,$verification_code,$create_date);
		 
		$statsdata=$srijan->add_seeker_stats_details($request_id,$create_date);
       

		if ($data && $statsdata) {
			$message=$data;
		}else{
			$message="Error occured";
		}
	} 

	$message= (object) $message;
	$json = json_encode($message);
	echo $json; 
}	

if ($_POST['action']=="verify_user") {

	$request_id=$_POST['requestid'];
	$otp=$_POST['otp'];

	if ($otp=="") 
	{
		$message = "Otp field is required";
	}
	else{

		$data=$srijan->verify_seeker($request_id,$otp);
       
		if ($data) {
			$message="Request added successfully.";
		}else{
			$message="Invalid OTP";
		}
	} 

	$message= (object) $message;
	$json = json_encode($message);
	echo $json; 
}




?>