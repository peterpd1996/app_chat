
<?php 

	$dsn = 'mysql:host=127.0.0.1;dbname=appchat';
	// Set options
	$options = array(
	PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8mb4",
	PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
	);
	// Create a new PDO instanace
	try {
	$db = new PDO($dsn, 'peter', 'anhduong123', $options);
		
	}
	// Catch any errors
	catch (PDOException $e) {
	echo $e->getMessage();
	exit();
}
function get_user_last_activity($user_id,$db){

	$query = "SELECT * FROM login_details WHERE user_id = $user_id ORDER BY last_activity DESC LIMIT 1";
	$stm = $db->prepare($query);
	$stm -> execute();
	$result = $stm -> fetchAll();
	 foreach ($result as $value) {
	 	return $value['last_activity'];
	 }
}
function getProfile($user_id,$db){
	$query = "SELECT profile FROM login WHERE user_id = $user_id";
	$stm = $db->prepare($query);
	$stm -> execute();
	$result = $stm -> fetchAll();
	 foreach ($result as $value) {
	  return $value['profile'];
	 }
}
function update_count_message($to_user,$from_user,$db){
	$query = "UPDATE chat_message SET status_ = 1 WHERE to_user_id = $from_user AND from_user_id = $to_user  AND status_ = 0";
	$stm = $db->prepare($query);
	$stm -> execute();

}
function history_message($to_user,$from_user,$db){

	$query =  "SELECT * FROM chat_message 
	WHERE to_user_id = $to_user AND from_user_id = $from_user 
	OR from_user_id = $to_user AND to_user_id = $from_user 
	";
	$stm = $db -> prepare($query);
	$stm -> execute();
	$rs = $stm -> fetchAll();
	
	$profileToUser = getProfile($to_user,$db);
	if ($profileToUser == '') {
		$img = "";
	}else{
		$img = "<img style = 'border-radius: 50%;
    object-fit: cover;padding-right:3px' width = '30px' height = '30px' src = 'images/".$profileToUser."'/>";
	}

			// <img width = '30px' height = '30px' src = 'images/".$profileFromUser."'/>
	$text = "";
	$text.="<ul class = 'list-unstyled'> ";
	foreach ($rs as $value) {
		if ($value['from_user_id'] == $from_user) {
			$text .= "<div style = 'text-align:right'>";
			$text.="<p style = 'padding-top:9px'></p>";
			$text.="<li class = 'text-right textY'> ".$value['chat_message']." </li>"."<br>";
			$text.="</div>";
		}else{
			$text.="<p style = 'padding-top:9px'></p>";
			$text.= $img."<li class = 'textF'>".$value['chat_message']." </li>"."<br>";

			// $text.="<div class ='img'> ".$img."</div>";
			// $text.= "<div class = 'message'>  <li class = 'textF'>".$value['chat_message']." </li></div>"."<br>";
		}
	}
	$text.="</ul>";
	update_count_message($to_user,$from_user,$db);
	return $text;
}
function count_unseen($from_user,$to_user,$db){
	// bời vì nó nhắn  cho mình thì thằng to user là mình còn thằng from user là nó 
	 $query = "SELECT COUNT(chat_message_id) FROM `chat_message` WHERE to_user_id =  $from_user and from_user_id = $to_user AND status_ = 0";
	$stm = $db -> prepare($query);
	$stm -> execute();
	$rs = $stm -> fetchAll();
	return $rs[0][0];
}
function update_checkType($login_detail_id,$check,$db)
{
	 echo  $query = "UPDATE login_details SET is_type = $check WHERE login_details_id = $login_detail_id";
		$stm = $db -> prepare($query);
		$rs = $stm -> execute();
			
}
function istyping($user_id,$db)
{
	$query = "SELECT is_type FROM login_details WHERE user_id = $user_id ORDER BY last_activity DESC LIMIT 1";
	$stm = $db -> prepare($query);
	$stm -> execute();
	$rs = $stm -> fetchAll();
	foreach ($rs as $value) {
		
	
	if ($value['is_type'] == 1) {
		return  "<span style = 'opacity:0.5' class = 'text-muted'>Typing...<span>";
	}
	return false;
	
	}
}


 



?>