<?php include("blog_processor.php");?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>
<?php
$postid = $_GET['edit'];
$result = mysqli_query($db,"SELECT * FROM post WHERE id_post ='$postid' ");
if (mysqli_num_rows($result) == 1) {
  //prendo tutti i dati del blog
  $infos= mysqli_fetch_assoc($result);
}
  ?>

 <div class="container">
   <h6 class="display-4">Cosa vuoi cambiare?</h6>
  <!-- inizio form -->
  <form action="" method="POST" enctype="multipart/form-data">
    <?php include('errors.php');?>
    <div class="form-group row">
      <div class="col-sm-6 text-right">
        <h6>Titolo del post:</h6>
      </div>
      <div class="col-sm-6">
        <input type="text" class="form-control" name="edit_titlep" id="edit_titlep" value="<?= $infos['titolo'];?>"/>
        <p><small>Il titolo deve contenere solo caratteri alfanumerici.</small></p>
      </div>
    </div>

     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <h6>Immagine del post:</h6>
       </div>
       <div class="col-sm-6">
         <input type="file" class="form-control-file" name="edit_imgp" />
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <h6>Testo:</h6>
       </div>
       <div class="col-sm-6">
         <textarea class="form-control" name="edit_textp" rows="3" columns ="20"><?=$infos['testo'];?></textarea>
       </div>
     </div>


  <!-- bottone-->
     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <input type="submit" class="btn btn-info ss" name="editthis" value="Modifica"/>
       </div>
     </div>
   </form>
 </div>

 <?php include_once 'footer.php';?>
