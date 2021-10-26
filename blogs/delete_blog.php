<?php session_start();
if(!isset($_SESSION['id'])){
  echo "Questa pagina non è disponibile.";
  die();
 }
// connect to the database
include("db.php");

  $id = $_POST['id'];
  $query = "DELETE FROM blog WHERE id_blog = '$id'";
  $result = mysqli_query($db,$query);


?>
