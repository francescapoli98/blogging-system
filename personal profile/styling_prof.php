<?php include('profilo_script.php');?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>
<?php
$profid = $_GET['edit'];
$result = mysqli_query($db,"SELECT * FROM profilo WHERE id_profilo ='$profid' ");
if (mysqli_num_rows($result) == 1) {
  //prendo tutti i dati del profilo
  $infos= mysqli_fetch_assoc($result);
}
  ?>
<div class="container">
   <h4 class="display-4">Modifica le tue informazioni.</h4>
   <form action="" method="POST" enctype="multipart/form-data">
     <?php include("errors.php");?>
     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Nome:</h6>
       </div>
       <div class="col-sm-8">
         <input type="text" name="edit_name" class="form-control" value="<?=$infos['nome']?>" />
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Cognome:</h6>
       </div>
       <div class="col-sm-8">
         <input type="text" name="edit_surname" class="form-control" value="<?=$infos['cognome']?>" />
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Età:</h6>
       </div>
       <div class="col-sm-8">
         <input type="number" name="edit_age" class="form-control" value="<?=$infos['eta']?>"/>
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Città:</h6>
       </div>
       <div class="col-sm-8">
         <input type="text" name="edit_city" class="form-control" value="<?=$infos['citta']?>"/>
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Foto:</h6>
       </div>
       <div class="col-sm-8">
         <input type="file" class="form-control-file" name="edit_img"/>
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-4 text-right">
         <h6>Bio:</h6>
       </div>
       <div class="col-sm-8">
         <input type="text" name="edit_bio" class="form-control" value="<?=$infos['bio']?>"/>
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <input type="submit" name="modifica" value="Invia" class="btn btn-info ss">
       </div>
     </div>

 </form>
</div>


<?php include_once 'footer.php';?>
