<!--
    //index.php
    !-->
<?php
    include('database.php');
    
    session_start();
    
    if(!isset($_SESSION['user_id']))
    {
     header('location:login.php');
    }
   echo $_SESSION['login_detail_id'];
    ?>

<html>
    <head>
        <title>PETER PEN</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
         <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
         <!-- icon -->
          <link rel="stylesheet" href="https://cdn.rawgit.com/mervick/emojionearea/master/dist/emojionearea.min.css">
        <script src="https://cdn.rawgit.com/mervick/emojionearea/master/dist/emojionearea.min.js"></script>
         <style>
           .textY{
                    padding: 7px;
                    background: #40adceb5;
                    width: 100%;
                    color: white;
                    text-align: center;
                    border-radius: 12px;
                    display: inline;
           }
           .textF{
               padding: 7px;
                background: #c3c5c5b5;
                width: 100%;
                color: white;
                text-align: center;
                border-radius: 12px;
                display: inline;
                color: black;
                
           }
           .unseen{
            padding: 3px;
            background: red;
            color: white;
            border-radius: 50%;
           }
         </style>
    </head>
    <body style="position: relative;">
        <div class="container">
            <br />
            <h3 align="center">CHAT MESSAGE</a></h3>
            <br />
            <br />
            <div class="table-responsive">
               
                <p align="right">Hi - <?php echo $_SESSION['user']; ?> - <a href="logout.php">Logout</a></p>
              <div id="usertable"></div>
               <div id="user_model_details"></div>
            </div>
     </div>
    </body>

</html>
    <script src="javascript/js.js"></script>
        