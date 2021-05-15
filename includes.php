<?php
	header('Access-Control-Allow-Origin: *');
	ob_start("ob_gzhandler");
	error_reporting(2);
	date_default_timezone_set("Asia/Kolkata");
	session_start();

	include_once 'config/dbconfig.php';

	include_once 'db-controller/srijancontroller.php';

	$srijan = new anisrijan($db);

?>