<?php 
	
	 include('database.php');
    	session_start();
    	$user = '';

                            $query = "SELECT * FROM login WHERE username != '".$_SESSION['user']."'  ";
                            $stm = $db -> prepare($query);
                            $stm -> execute();
                            $rs = $stm -> fetchAll(PDO::FETCH_ASSOC);
                            
                        
    	$user .= "
    	 <table class='table table-hover'>
                        <thead>
                          <th>User</th>
                          <th>Status</th>
                          <th>Active</th>
                        </thead>
                        <tbody>
                       
                       
       
    	 ";

    	 foreach ($rs as $value) {
    	 	$count = count_unseen($_SESSION['user_id'],$value['user_id'],$db);
    	 	if ($count == 0) {
    	 		$count = "";
    	 	}else{
    	 		$count = "<span class = 'unseen'> ".$count. " </span>";
    	 	}
    	 	$status = '';
    	 	$now = strtotime(date('Y-m-d H:i:s').' - 10 second');
    	 	$time = get_user_last_activity($value['user_id'],$db);
    	 	$user_last_activity = strtotime($time);

			if ($user_last_activity > $now) {
    	 		$status = "<div class = 'btn btn-success'>online</div>";
    	 	}else{
    	 		$status = "<div class = 'btn btn-danger'>offline</div>";
    	 	}
            $typing = istyping($value['user_id'],$db);



    	 	$user.=" <tr>
    	 				<td>  ".$value['username']." ".$count." ".$typing."</td>
    	 				<td>".$status."</td>
    	 				<td> <button class='btn btn-success start_chat' data-touserid = ".$value['user_id']."  data-tousername= '".$value['username']."'  >Chat</button></td>
    	 			 <tr>
    	 	 ";
    	 }
    	 $user.="</tbody> 
        </table>";

        echo $user;



 ?>
 