<?php include('data_processor.php');?>
<?php include_once 'incipit.php'; ?>
<?php include_once 'header.php'; ?>

<script>
//SUGGERIMENTO AUTOMATICO DI USERNAMES
$(document).ready(function(){
 $("#user").keyup(function(){
   $("#suggest").empty();
    var string = $(this).val();
    if (string != ""){
      $.post("check_user.php", //pagina richiamata
        {"string":string}, //data:
        function(data){ //success:
          if (data != "False"){
            $("#suggest").append(data);
            $(".login").css("cursor","pointer");
            $(".login").on('click', function(){
              $("#user").val(this.value);
              $("#suggest").empty();
            });
          }
        },
    'json');
  }; //chiusura if(string !empty)
   }); //chiusura keyup
 });


</script>

<div class="container-fluid">
<div class="container" style="margin-top: 30px;">
  <div class="row" >
    <div class="col">
      <h2 class="text-monospace align-self-center"> benvenuto. </h2>
    </div>
  </div>
  <div class="row">
    <div class="col">
<!--LOGIN-->
      <form action="" method="POST">
        <div class="form-group">
         <input type="text" placeholder="Username" name="user" id="user" class="form-control" required>
         <div id="suggest"></div>
       </div>
       <div class="form-group">
         <input type="password" placeholder="Password" name="psw" class="form-control" required>
       </div>
        <input type="submit" class="btn btn-info" name="entra" value="Login"/>
        <input type="reset" name="reset" value="Reset" class="btn btn-secondary"/>
      </form>
      <?php include('errors.php');?>
    </div>
  <div class="col clearfix">
      <h6> Non fai ancora parte del team? </h6>
      <button class="btn btn-outline-dark position-relative media" ><a href="signup.php" class="stretched-link indexlink">Registrati</a></button>
  </div>
  <div class="col clearfix">
    <h6>Guarda ciò che ti interessa senza accedere.<h6>
      <button class="btn btn-outline-dark position-relative media" ><a href="home.php" class="stretched-link indexlink"> Scopri </a></button>
      <p><small> Ricorda che senza accedere non potrai né creare blog, né commentare o interagire con gli altri utenti. </small></p>
  </div>
  </div>
</div>
</div>
<?php include_once 'footer.php'; ?>
