<?php
	session_start();

	require "database.php";
	if (isset($_SESSION['user_id'])) {
		header('location:index.php');
	}
	if (isset($_POST['login'])) {
		$error = [];
		if($_POST['username'] == ''){
			$error['username'] = 'Ban khong duoc de trong username';
		}else{
		   $user = $_POST['username'];
		}

		if($_POST['password'] == ''){
			$error['password'] = 'Ban khong duoc de trong password';
		}else{
		   $pass = $_POST['password'];
		}

		if (empty($error)) {
			$query = " SELECT * from login WHERE username = :user AND password = :pass";
			$stm = $db->prepare($query);
			$data = [
				'user' => $user,
				'pass' => md5($pass)
			];
			$stm -> execute($data);
			$count = $stm -> rowCount();
			if ($count > 0 ) {
				$resultSet = $stm->fetchAll(PDO::FETCH_ASSOC);
				$_SESSION['user'] = $resultSet[0]['username'];
				$_SESSION['user_id'] = $resultSet[0]['user_id'];
				$subQuery = "INSERT INTO login_details (user_id) VALUES ('".$_SESSION['user_id']."')";
				$stm = $db -> prepare($subQuery);
				$stm -> execute();
				$_SESSION['login_detail_id'] = $db -> lastInsertId(); // bieet duoc user nao vua login xong 
				header('location:index.php');
				
			}else{
				$error['incorrect'] =  "<p style = 'color:red'> The username or password is incorrect </p>";
			}

		}

	}

  ?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Chat Application using PHP Ajax Jquery</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <body>
        <div class="container">
            <br />
            <h3 align="center">Chat Application using PHP Ajax Jquery</a></h3>
            <br />
            <br />
            <div class="panel panel-default">
                <div class="panel-heading">Chat Application Login</div>
                <div class="panel-body">
                    <form method="post">
                        <p class="text-danger"></p>
                        <div class="form-group">
                            <label>Enter Username</label>
                            <input type="text" name="username" class="form-control" required />
                        </div>
                        <div class="form-group">
                            <label>Enter Password</label>
                            <input type="password" name="password" class="form-control" required />
                        </div>
                        <?php if (isset($error['incorrect'])) {
                        	echo $error['incorrect'];
                        } ?>
                        <div class="form-group">
                            <input type="submit" name="login" class="btn btn-info" value="Login" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>