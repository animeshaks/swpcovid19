<?php
include_once '../includes.php';
$_POST = json_decode(file_get_contents('php://input'), true);

if ($_POST['action']=="add_new_donation") {
	$doner_name=$_POST['user_name'];
	$doner_mobile=$_POST['user_mobile'];
	$landmark=$_POST['landmark'];
	$pincode=$_POST['pincode'];
	$area=$_POST['area'];
	$district=$_POST['district'];
	$region=$_POST['region'];
	$state=$_POST['state'];
	$donation_stuff=$_POST['donation_stuff'];
	$donation_type=$_POST['donation_type'];
	$chargable_amount=$_POST['chargable_amount'];
	$remark=$_POST['remark'];

	$temp_donation_id = $srijan->get_donation_id();

	$donation_id='NSD'.$temp_donation_id;

	$isVerified = 0;

	$verification_code = rand(100000,999999);
	$create_date=time();

	if ($doner_name=="" || $doner_mobile=="" || $landmark=="" || $pincode=="" || $donation_stuff=="" || $donation_type=="" || $remark=="") 
	{
		$message= "All fields are required";
	}
	else{

		$data=$srijan->add_new_donation($donation_id,$doner_name,$doner_mobile,$landmark,$pincode,$area,$district,$region,$state,$donation_stuff,$donation_type,$chargable_amount,$remark,$isVerified,$verification_code,$create_date);
		 
		$statsdata=$srijan->add_donation_stats_details($donation_id,$create_date);
       

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

	$donation_id=$_POST['donationid'];
	$otp=$_POST['otp'];

	if ($otp=="") 
	{
		$message= "Otp field is required";
	}
	else{

		$data=$srijan->verify_doner($donation_id,$otp);
       
		if ($data) {
			$message="Donation added successfully.";
		}else{
			$message="Error occured";
		}
	} 

	$message= (object) $message;
	$json = json_encode($message);
	echo $json; 
}


?>