<?php session_start();
//verifica id dell'utente!
if(!isset($_SESSION['id'])){
  echo "Questa pagina non è disponibile.";
  die();
 }
// connect to the database
include("db.php");

  $id = $_POST['id'];
  $query = "DELETE FROM commenti WHERE id_commenti = '$id'";
  $result = mysqli_query($db,$query);


 ?>
