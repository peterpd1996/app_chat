<?php 
		session_start();
		
		include 'database.php';
		$query = "UPDATE login_details SET last_activity = now() WHERE login_details_id = ".$_SESSION['login_detail_id']." ";
		$stm = $db-> prepare($query);
		$stm -> execute();
 ?>