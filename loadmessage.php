<?php 
	include 'database.php';
	session_start();
	echo history_message($_POST['to_user_id'],$_SESSION['user_id'],$db);

 ?>