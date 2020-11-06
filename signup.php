<?php include("data_processor.php");?>
<?php include_once 'incipit.php'; ?>
<?php include_once 'header.php'; ?>

<script>
$(document).ready(function(){
  //username
  $('#username').keyup(function() {
    var usercheck = $(this).val();
    //ajax
    $.post("check_signup.php",
    {user_name: usercheck} ,
    function(data) {
      if (data.status == true) {
        $('#usercheck').parent('div').removeClass('alert alert-danger').addClass('alert alert-success');
      } else {
        $('#usercheck').parent('div').removeClass('alert alert-success').addClass('alert alert-danger');
      }
      $('#usercheck').html(data.msg);
    },
    'json');
  });
  //email
  $('#email').keyup(function() {
    var mailcheck = $(this).val();
    //ajax
    $.post("check_signup.php", {email: mailcheck} ,
    function(data) {
      if (data.status == true) {
        $('#mailcheck').parent('div').removeClass('alert alert-danger').addClass('alert alert-success');
      } else {
        $('#mailcheck').parent('div').removeClass('alert alert-success').addClass('alert alert-danger');
      }
      $('#mailcheck').html(data.msg);
    },'json');
  });

});
</script>

<div class="container">
  <h4> Registrati per entrare nella community di RockYourBlog. </h4>
  <h6> Inserisci i tuoi dati:</h6>
  <form class="form-horizontal" action="" method="POST">
    <?php include("errors.php");?>
    <div class="form-group">
    <label class="control-label col-sm-2">Email:</label>
    <div class="col-sm-10">
      <input type="email" class="form-control" name="email" id="email" placeholder="es. mariorossi@email.com"  required>
      <div><span id="mailcheck" class="help-block"></span></div>
    </div>
  </div>
   <div class="form-group">
   <label class="control-label col-sm-2">Username:</label>
   <div class="col-sm-10">
     <input type="text" class="form-control" name="username" id="username" placeholder="username"  required>
     <div><span id="usercheck"></span></div>
   </div>
 </div>
   <div class="form-group">
   <label class="control-label col-sm-2">Password:</label>
   <div class="col-sm-10">
     <input type="password" class="form-control" name="password" id="password" placeholder="password" required>
   </div>
 </div>
 <button type="submit" class="btn btn-outline-info" id="register" name="register">Entra</button>
</form>
</div>
<?php include_once 'footer.php'; ?>
