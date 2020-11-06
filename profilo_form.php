<?php include('profilo_script.php');?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>
<div class="container">
  <?php if(isset($_SESSION['username'])):?>
   <h4 class="display-4">Parlaci di te.</h4>
   <h6> Compila il form per completare la personalizzazione del tuo profilo!</h6>
   <form action="profilo_form.php" method="POST" enctype="multipart/form-data">
     <?php include("errors.php");?>
     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Nome:</h6>
       </div>
       <div class="col-sm-8">
         <input type="text" name="name" class="form-control" />
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Cognome:</h6>
       </div>
       <div class="col-sm-8">
         <input type="text" name="surname" class="form-control" />
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Età:</h6>
       </div>
       <div class="col-sm-8">
         <input type="number" name="age" class="form-control"/>
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Città:</h6>
       </div>
       <div class="col-sm-8">
         <input type="text" name="city" class="form-control" />
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Foto:</h6>
       </div>
       <div class="col-sm-8">
         <input type="file" class="form-control-file" name="profile_img" />
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Bio:</h6>
       </div>
       <div class="col-sm-8">
         <input type="text" name="bio" class="form-control"/>
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <input type="submit" name="invia" value="Invia" class="btn btn-info ss">
         <input type="reset" name="reset" value="Reset" class="btn btn-info ss">
       </div>
     </div>

 </form>
  <?php endif ?>
</div>

  <?php if(!isset($_SESSION ['username'])):?>
      <div class="alert alert-danger"> Non puoi personalizzare il tuo profilo senza essere un utente registrato.</div>
  <?php endif ?>

<?php include_once 'footer.php';?>
