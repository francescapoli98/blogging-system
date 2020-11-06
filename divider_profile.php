<?php session_start();

include_once 'incipit.php';
include_once 'header.php';

// connessione al Database
include("db.php");

if(isset($_SESSION['username'])){
  $id=$_SESSION['id'];
  if($profilo = current($db->query("SELECT id_profilo FROM profilo WHERE id_utente='$id'")->fetch_assoc())){
      header("location: profilo.php?profilo=".$profilo);
  } else {
  header("location: profilo_form.php");
}
} else{
  header("location: profilo_form.php");
}

include_once 'footer.php';

?>
