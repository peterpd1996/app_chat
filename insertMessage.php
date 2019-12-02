<?php 
	session_start();
	$data = [
		':to_user' => $_POST['to_user_id'],
		':from_user' => $_SESSION['user_id'],
		':message' => $_POST['chat_mess'],
		':status_' => 0 
	];

	include 'database.php';

	$query = "INSERT INTO chat_message(to_user_id,from_user_id,chat_message,status_) VALUES (:to_user,:from_user,:message,:status_)";
	$stm = $db -> prepare($query);
	$rs = $stm -> execute($data);
	if($rs){
		echo history_message($_POST['to_user_id'],$_SESSION['user_id'],$db);
	}

 ?>