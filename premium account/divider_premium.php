<?php session_start();

include_once 'incipit.php';
include_once 'header.php';

// connessione al Database
include("db.php");

if(isset($_SESSION['username'])){
  $id=$_SESSION['id'];
  if($premium = current($db->query("SELECT id_premium FROM premium WHERE id_utente='$id'")->fetch_assoc())){
      header("location: premium.php?premium=".$premium);
  } else {
  header("location: carte_form.php");
}
} else{
  header("location: carte_form.php");
}

include_once 'footer.php';

?>
