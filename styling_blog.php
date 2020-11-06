<?php include("blog_processor.php");?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>
<?php
$blogid = $_GET['edit'];
$result = mysqli_query($db,"SELECT * FROM blog WHERE id_blog ='$blogid' ");
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
        <h6>Titolo del blog:</h6>
      </div>
      <div class="col-sm-6">
        <input type="text" class="form-control" name="edit_title" id="edit_title" value="<?= $infos['titolo'];?>"/>
        <p><small>Il titolo deve contenere solo caratteri alfanumerici.</small></p>
      </div>
    </div>

     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <h6>Immagine del blog:</h6>
       </div>
       <div class="col-sm-6">
         <input type="file" class="form-control-file" name="edit_img" />
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <h6>Descrizione:</h6>
       </div>
       <div class="col-sm-6">
         <textarea class="form-control" name="edit_description" id ="edit_description" rows="3" columns ="20"><?=$infos['descrizione'];?></textarea>
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <h6>Scegli un colore per lo sfondo</h6>
       </div>
       <div class="col-sm-6">
         <select id="edit_wall" class="form-control" name="edit_sfondo">
           <?php
           $first = $infos['id_sfondo'];
           $starterquery = $db -> query("SELECT * FROM colori WHERE id_colore = '$first' ");
           $starter = mysqli_fetch_array($starterquery);
           echo '<option value="'.$starter['id_colore'].'" style="color:'.$starter['codice_html'].'"> <div class="colors" style="background-color:'.$starter['codice_html'].';"></div>'.$starter['nome_colore'].'</option>';
           $query = $db -> query("SELECT * FROM colori");
           while($color = mysqli_fetch_array($query)){
             echo '<option value="'.$color['id_colore'].'" style="color:'.$color['codice_html'].'"> <div class="colors" style="background-color:'.$color['codice_html'].';"></div>'.$color['nome_colore'].'</option>';
                     }
           ?>
         </select>
       </div>
     </div>

     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <h6>Scegli uno stile per la cornice del blog</h6>
       </div>
       <div class="col-sm-6">
         <select id="edit_cornice" class="form-control" name="edit_cornice">
           <?php
           $initial = $infos['id_cornice'];
           $starterq = $db -> query("SELECT * FROM stili WHERE id_stile = '$initial'");
           $start = mysqli_fetch_array($starterq);
           echo '<option value="'.$start['id_stile'].'">'.$start['nome_stile'].'</option>';
           $query = $db -> query("SELECT * FROM stili ");
           while($style = mysqli_fetch_array($query)){
             echo '<option value="'.$style['id_stile'].'">'.$style['nome_stile'].'</option>';
                     }
           ?>
         </select>
       </div>
     </div>

  <!-- bottone-->
     <div class="form-group row">
       <div class="col-sm-6 text-right">
         <input type="submit" class="btn btn-info ss" name="modifica" value="Modifica"/>
       </div>
     </div>
   </form>
 </div>

 <?php include_once 'footer.php';?>
