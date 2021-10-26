<?php
session_start();
$errors = array();

//connessione al Database
include("db.php");

$categories = mysqli_query($db, "SELECT * FROM categorie");

$options='';
  while ($cat = mysqli_fetch_array($categories)){
    $options .= '<div class="form-check">
                  <label class="form-check-label">
                    <input type="checkbox" class="form-check-input" name="categoria[]" value="'.$cat['id_categoria'].'">'.$cat['descrizione'].'</input>
                  </label>
                 </div>';
  }


?>
