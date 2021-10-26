<?php include('carte_script.php');?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>
<script type="text/javascript">
$(document).ready(function(){
  //controllo sul numero di carta
  $('#num_carta').keyup(function() {
    var carta = $(this).val();
    $.post("carte_script.php", {carta: carta} ,
    function(data) {
      if (data.status == true) {
        $('#control').parent('div').removeClass('alert alert-danger').addClass('alert alert-success');
      } else {
        $('#control').parent('div').removeClass('alert alert-success').addClass('alert alert-danger');
      }
      $('#control').html(data.msg);
    },'json');
  });




  $('#cvv').keyup(function() {
    var cvv = $(this).val();
    $.post("carte_script.php", {cvv: cvv} ,
    function(data) {
      if (data.status == true) {
        $('#control2').parent('div').removeClass('alert alert-danger').addClass('alert alert-success');
      } else {
        $('#control2').parent('div').removeClass('alert alert-success').addClass('alert alert-danger');
      }
      $('#control2').html(data.msg);
    },'json');
  });
});
</script>
<!-- inizio form-->
<div class="container">
  <?php if(isset($_SESSION['username'])): //solo chi è utente registrato può accedere a questa pagina ?>
    <h4 class="display-4">Tutti i vantaggi di Premium, per te.</h4>
    <h4>Inserisci i dati della tua carta di credito.</h4>
  </br>
    <form action="" method="POST">
        <?php include("errors.php");?>

        <div class="form-group row">
          <div class="col-sm-4 text-right">
            <h6>Data di scadenza:</h6>
          </div>
          <div class="col-sm-8">
            <input type="date" name="scadenza" class="form-control"/>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm-4 text-right">
            <h6>Numero della carta:</h6>
          </div>
          <div class="col-sm-8">
            <input type="number" name="num_carta" id="num_carta" class="form-control" placeholder="Numero di 16 cifre"/>
             <div><span id="control"></span></div>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm-4 text-right">
            <h6>Tipologia di carta:</h6>
          </div>
          <div class="col-sm-8">
            <input type="text" name="tipo" class="form-control" placeholder="es. Visa"/>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm-4 text-right">
            <h6>Nominativo:</h6>
          </div>
          <div class="col-sm-8">
            <input type="text" name="nominativo" class="form-control" placeholder="Nome del proprietario della carta"/>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm-4 text-right">
            <h6>CVV:</h6>
          </div>
          <div class="col-sm-8">
            <input type="number" name="cvv" id="cvv" class="form-control" placeholder="Numero di 3 cifre sul retro"/>
             <div><span id="control2"></span></div>
          </div>
        </div>

        <div class="form-group row">
          <div class="col-sm-6 text-right">
            <input type="submit" name="invia" value="Invia!" class="btn btn-info ss"/>
            <input type="reset" name="reset" value="Reset" class="btn btn-info ss"/>
          </div>
        </div>

    </form>
   </div>

<!-- alcune info-->
 </br>
   <div class="container premium">
   </br>
     <h3> Cosa ottieni passando a Premium?</h4>
       <ul class=" list-unstyled">
         <li class="lead">Passando ad un account Premium gestire i tuoi blog sarà più semplice e divertente!</li>
         <li class="lead">Avrai la possibilità di creare quanti blog desideri, senza limitazioni,</li>
         <li class="lead">Potrai creare blog in collaborazione con altri utenti Premium,</li>
         <li class="lead"> Il tutto a soli <i class="font-weight-bold">	&euro;1,50 al mese!</i></li>
       </ul>
    </div>
 <?php endif ?>

 <?php if(!isset($_SESSION ['username'])):  //se l'utente non è registrato ?>
     <div class="alert alert-danger"> Non puoi passare a un account Premium senza essere un utente registrato.</div>
 <?php endif ?>

<?php include_once 'footer.php';?>
