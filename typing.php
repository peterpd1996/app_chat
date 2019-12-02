<?php 
	include 'database.php';
	session_start();
	echo $_SESSION['login_detail_id']."<br>";
	echo $_POST['typing']."<br>";
	
   update_checkType($_SESSION['login_detail_id'],$_POST['typing'],$db);
 ?>