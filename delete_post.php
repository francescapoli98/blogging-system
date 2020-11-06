<?php session_start();
//verifica id dell'utente!
if(!isset($_SESSION['id'])){
  echo "Questa pagina non è disponibile.";
  die();
 }
// connect to the database
include("db.php");

  $id = $_POST['id'];
  $blog_id= current($db->query("SELECT id_blog FROM post WHERE id_post = '$id'")-> fetch_assoc());
  $db -> query("DELETE FROM post WHERE id_post = '$id'");
  $db -> query("DELETE FROM commenti WHERE id_post = '$id'");
  echo json_encode("$blog_id");
 ?>
