<?php
include_once '../includes.php';
$_POST = json_decode(file_get_contents('php://input'), true);

if ($_POST['action']=="chk_login_user") {

	$user_type=$_POST['usertype'];
	$mobile_number=$_POST['mobilenumber'];

	if ($user_type=="" || $mobile_number == "") 
	{
		$message = "All fields are required";
	}
	else{
		if($user_type == "doner"){
			$data=$srijan->check_login_doner($mobile_number,$user_type);
		}else if($user_type == "seeker"){
			$data=$srijan->check_login_seeker($mobile_number,$user_type);
		}
		
		if ($data){
			$message=$data;
		}else{
			$message="No user found with this credentials.";
		}
	} 
	$message= (object) $message;
	$json = json_encode($message);
	echo $json; 
}	

if ($_POST['action']=="verify_user") {

	$otp=$_POST['otp'];
	$user_type=$_POST['usertype'];
	$mobile_number=$_POST['mobilenumber'];

	if ($otp=="") 
	{
		$message= "Otp field is required";
	}
	else{

		if($user_type == "doner"){
			$data=$srijan->verify_doner_login($mobile_number,$otp);
		}else if($user_type == "seeker"){
			$data=$srijan->verify_seeker_login($mobile_number,$otp);
		}

		if ($data) {
			$message="Welcome User.";
		}else{
			$message="Invalid OTP";
		}
	} 

	$message= (object) $message;
	$json = json_encode($message);
	echo $json; 
}

?>