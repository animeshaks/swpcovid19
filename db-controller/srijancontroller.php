<?php
class anisrijan{
	private $db;

	public function __construct($db)
	{
		$this->db = $db;
	}

	public function get_donation_id(){
		$query = mysqli_query($this->db, "SELECT lpad(id+1,5,'0') AS id FROM donation ORDER BY id DESC LIMIT 1") or die(mysqli_error($this->db));
	
		$row=mysqli_fetch_array($query,MYSQLI_ASSOC);
		if($row['id']<00002)
			$id = '00001';
		else
			$id = $row['id'];
		return $id;
	}

	public function add_new_donation($donation_id,$doner_name,$doner_mobile,$landmark,$pincode,$area,$district,$region,$state,$donation_stuff,$donation_type,$chargable_amount,$remark,$isVerified,$verification_code,$create_date){
		$donation_id = mysqli_real_escape_string($this->db,$donation_id);
		$doner_name = mysqli_real_escape_string($this->db,$doner_name);
		$doner_mobile = mysqli_real_escape_string($this->db,$doner_mobile);
		$landmark = mysqli_real_escape_string($this->db,$landmark);
		$pincode = mysqli_real_escape_string($this->db,$pincode);
		$area = mysqli_real_escape_string($this->db,$area);
		$district = mysqli_real_escape_string($this->db,$district);
		$region = mysqli_real_escape_string($this->db,$region);
		$state = mysqli_real_escape_string($this->db,$state);
		$donation_stuff = mysqli_real_escape_string($this->db,$donation_stuff);
		$donation_type = mysqli_real_escape_string($this->db,$donation_type);
		$chargable_amount = mysqli_real_escape_string($this->db,$chargable_amount);
		$remark = mysqli_real_escape_string($this->db,$remark);
		$isVerified = mysqli_real_escape_string($this->db,$isVerified);
		$verification_code = mysqli_real_escape_string($this->db,$verification_code);
		$create_date = mysqli_real_escape_string($this->db,$create_date);

		$query = mysqli_query($this->db, "INSERT INTO donation (donation_id,doner_name,doner_mobile,doner_pincode,doner_landmark,doner_area,doner_district,doner_region,doner_state,donation_stuff,donation_type,donation_charge,description,isVerified,verification_code,create_date) VALUES ('$donation_id','$doner_name','$doner_mobile','$pincode','$landmark','$area','$district','$region','$state','$donation_stuff','$donation_type','$chargable_amount','$remark','$isVerified','$verification_code','$create_date')") or die(mysqli_error($this->db));

		if($query)
			return $donation_id;
		else
			return false;
	}

	public function verify_doner($donation_id,$otp){
		$donation_id = mysqli_real_escape_string($this->db,$donation_id);
		$otp = mysqli_real_escape_string($this->db,$otp);

		$query1 = mysqli_query($this->db, "SELECT donation_id FROM donation WHERE donation_id='$donation_id' AND verification_code='$otp'") or die(mysqli_error($this->db));
		if ($query1) {
			$row=mysqli_fetch_array($query1,MYSQLI_ASSOC);

			$last_login = time();

			$query2 = mysqli_query($this->db, "UPDATE donation SET isVerified = 1 WHERE donation_id='$row[donation_id]'") or die(mysqli_error($this->db));

			return $row;
		}else{
			return false;
		}
	}

	public function add_donation_stats_details($donation_id,$create_date){
		$donation_id = mysqli_real_escape_string($this->db,$donation_id);
		$query = mysqli_query($this->db, "INSERT INTO donation_statistics (donation_id,upvote,downvote,last_updated) VALUES ('$donation_id',0,0,'$create_date')") or die(mysqli_error($this->db));
		if($query)
			return true;
		else
			return false;	
	}

	public function get_request_id(){
		$query = mysqli_query($this->db, "SELECT lpad(id+1,5,'0') AS id FROM request ORDER BY id DESC LIMIT 1") or die(mysqli_error($this->db));
	
		$row=mysqli_fetch_array($query,MYSQLI_ASSOC);
		if($row['id']<00002)
			$id = '00001';
		else
			$id = $row['id'];
		return $id;
	}

	public function add_new_request($request_id,$name,$mobile,$landmark,$pincode,$area,$district,$region,$state,$required_stuff,$remark,$isVerified,$verification_code,$create_date){
		$request_id = mysqli_real_escape_string($this->db,$request_id);
		$name = mysqli_real_escape_string($this->db,$name);
		$mobile = mysqli_real_escape_string($this->db,$mobile);
		$landmark = mysqli_real_escape_string($this->db,$landmark);
		$pincode = mysqli_real_escape_string($this->db,$pincode);
		$area = mysqli_real_escape_string($this->db,$area);
		$district = mysqli_real_escape_string($this->db,$district);
		$region = mysqli_real_escape_string($this->db,$region);
		$state = mysqli_real_escape_string($this->db,$state);
		$required_stuff = mysqli_real_escape_string($this->db,$required_stuff);
		$remark = mysqli_real_escape_string($this->db,$remark);
		$isVerified = mysqli_real_escape_string($this->db,$isVerified);
		$verification_code = mysqli_real_escape_string($this->db,$verification_code);
		$create_date = mysqli_real_escape_string($this->db,$create_date);

		$query = mysqli_query($this->db, "INSERT INTO request (request_id,seeker_name,mobile,pincode,landmark,area,district,region,state,required_stuff,description,isVerified,verification_code,last_updated) VALUES ('$request_id','$name','$mobile','$pincode','$landmark','$area','$district','$region','$state','$required_stuff','$remark','$isVerified','$verification_code','$create_date')") or die(mysqli_error($this->db));

		if($query)
			return $request_id;
		else
			return false;
	}

	public function verify_seeker($request_id,$otp){
		$request_id = mysqli_real_escape_string($this->db,$request_id);
		$otp = mysqli_real_escape_string($this->db,$otp);

		$query1 = mysqli_query($this->db, "SELECT request_id FROM request WHERE request_id='$request_id' AND verification_code='$otp'") or die(mysqli_error($this->db));
		if ($query1) {
			$row=mysqli_fetch_array($query1,MYSQLI_ASSOC);

			$last_updated = time();

			$query2 = mysqli_query($this->db, "UPDATE request SET isVerified = 1, last_updated='$last_updated' WHERE request_id='$row[request_id]'") or die(mysqli_error($this->db));

			return $row;
		}else{
			return false;
		}
	}

	public function add_seeker_stats_details($request_id,$create_date){
		$request_id = mysqli_real_escape_string($this->db,$request_id);
		$query = mysqli_query($this->db, "INSERT INTO request_statistics (request_id,upvote,downvote,last_updated) VALUES ('$request_id',0,0,'$create_date')") or die(mysqli_error($this->db));
		if($query)
			return true;
		else
			return false;	
	}

	public function fetch_donations_by_pincode($pincode,$region){
		$pincode = mysqli_real_escape_string($this->db,$pincode);
		$region = mysqli_real_escape_string($this->db,$region);

		$query = mysqli_query($this->db, "SELECT donation.donation_id,donation.doner_name,donation.doner_mobile,donation.doner_pincode,donation.doner_landmark,donation.doner_area,donation.doner_district,donation.doner_region,donation.doner_state,donation.donation_stuff,donation.donation_type,donation.donation_charge,donation.description,donation.create_date,donation_statistics.upvote,donation_statistics.downvote FROM donation JOIN donation_statistics USING (donation_id) WHERE donation.doner_region='$region' ORDER BY create_date DESC") or die(mysqli_error($this->db));
		if($query){
			while ($row=mysqli_fetch_array($query,MYSQLI_ASSOC)) {
				$row['create_date']=date('d/m/Y',$row['create_date']);
				$data[]=$row;
			}
			return $data;
		}else{
			return false;
		}	
	}

	public function like_a_donation($donation_id,$request_id){
		$donation_id = mysqli_real_escape_string($this->db,$donation_id);
		$request_id = mysqli_real_escape_string($this->db,$request_id);

		$query = mysqli_query($this->db, "SELECT id FROM request WHERE request_id='$request_id'") or die(mysqli_error($this->db));
		$count = mysqli_num_rows($query);
		if($count == 0){
			return false;
		}
		else{
			$query1 = mysqli_query($this->db, "UPDATE donation_statistics SET upvote = upvote+1 WHERE donation_id='$donation_id'") or die(mysqli_error($this->db));
			if($query1)
				return true;
			else
				return false;	
		}
	}

	public function dislike_a_donation($donation_id,$request_id){
		$donation_id = mysqli_real_escape_string($this->db,$donation_id);
		$request_id = mysqli_real_escape_string($this->db,$request_id);

		$query = mysqli_query($this->db, "SELECT id FROM request WHERE request_id='$request_id'") or die(mysqli_error($this->db));
		$count = mysqli_num_rows($query);
		if($count == 0){
			return false;
		}
		else{
			$query1 = mysqli_query($this->db, "UPDATE donation_statistics SET downvote = downvote+1 WHERE donation_id='$donation_id'") or die(mysqli_error($this->db));
			if($query1)
				return true;
			else
				return false;	
		}
	}

}
?>