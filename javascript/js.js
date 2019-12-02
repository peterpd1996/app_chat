$(document).ready(function(){

        // cach 1
        // function fetch_user(){
        //   $('#usertable').load("fetch_user.php");
        // }
        // cach 2
        fetch_user();

        var load;
        setInterval(function(){
            update();
            fetch_user();
        },5000)

          function fetch_user(){
            $.ajax({
              url:"fetch_user.php",
              method:"POST",
              success:function(data){
                $('#usertable').html(data);

              }
            })
          }
        
        function update(){
          $.ajax({
            // cu 5s lai upadate lai 1 lan
            url:"update.php",
           
          })
        }
        function loadmess(to_user_id){
            $.ajax({
                    url:"loadmessage.php",
                    method:'POST',
                    data:{to_user_id:to_user_id},
                    success:function(data){
                       $('#chat_history_'+to_user_id).html(data);
                    }
                  })
        }
         function make_chat_dialog_box(to_user_id, to_user_name)
             {
              var modal_content = '<div id="user_dialog_'+to_user_id+'" class="" title="You have chat with '+to_user_name+'">';
              modal_content += '<div style="height:350px; border:1px solid #ccc; overflow-y: auto; margin-bottom:24px; padding:16px;" class="chat_history" data-touserid="'+to_user_id+'" id="chat_history_'+to_user_id+'">';
              
              modal_content += '</div>';
              modal_content += '<div class="form-group">';
              modal_content += '<textarea name="chat_message_'+to_user_id+'" id="chat_message_'+to_user_id+'" class="form-control enterMes"></textarea>';
              modal_content += '</div><div class="form-group " align="right">';
              modal_content+= '<button type="button" name="send_chat" id="'+to_user_id+'" class="btn btn-info send_chat">Send</button></div></div>';
              $('#user_model_details').html(modal_content);
             }
            // start chat click
             $(document).on('click', '.start_chat ', function(){
                  var to_user_id = $(this).data('touserid');
                  var to_user_name = $(this).data('tousername');

                  make_chat_dialog_box(to_user_id, to_user_name);
                  $("#user_dialog_"+to_user_id).dialog({
                   autoOpen:false,
                   width:350
                  });
                  $('#user_dialog_'+to_user_id).dialog('open');
                  // tao emoji
                  $('#chat_message_'+to_user_id).emojioneArea({
                    searchPosition: "bottom",
                    toneStyle:"bullet"
                  });
                  loadmess(to_user_id);
                  
                 load =  setInterval(function(){
                  loadmess(to_user_id);
                  },3000)
                  
                  
              // end start chat   
             
                 

              })
             $(document).on('keypress', '.enterMes ', function(e){
             
                     var key = e.which;
                     if(key == 13)  // the enter key code
                      {
                        var empty =  $('.enterMes').val();

                        if (empty.trim() != '') {
                          $('.send_chat').click();
                          return false;
                        }
                        
                      }
                    }); 
               
           
          
             // var scr = $('.chat_history');
             // scr.scrollTop = scr.scrollHeight;
             // console.log(scr);
              
            
             $(document).on('click','.send_chat',function(){
                  var to_user_id = $(this).attr('id');
                  var message = $("#chat_message_"+to_user_id).val();
                  $("#chat_message_"+to_user_id).val('');
                  if (message.trim()== '') {
                    return false; 
                  }
                  $.ajax({
                    url:"insertMessage.php",
                    method:'POST',
                    data:{to_user_id:to_user_id,chat_mess:message},
                    success:function(data){
                      // cho mất nội dung mình vừa nhập đi khi mình bấm nút sent
                      var element = $('#chat_message_'+to_user_id).emojioneArea();
                      element[0].emojioneArea.setText('');
                      $('#chat_history_'+to_user_id).html(data);
                    }
                  })

                  
             })
             $(document).on('click','.ui-button-icon',function(){
               clearInterval(load);
             })
             // kiem tra tying cho user 

            $(document).on('blur','.enterMes',function(){
              var type = 0;
              $.ajax({
                url:'typing.php',
                method:'POST',
                data:{typing:type},
                success:function(){}
              })
              console.log('dang blur')
            
             })
             $(document).on('focus','.enterMes',function(){
              var type = 1;
              $.ajax({
                url:'typing.php',
                method:'POST',
                data:{typing:type},
                success:function(){}
              })
               console.log('dang change')
             
             })



             // ui-dialog-titlebar-close
                
             
             


})
        

  