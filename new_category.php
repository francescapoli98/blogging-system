<?php session_start();
//verifica id dell'utente!
if(!isset($_SESSION['id'])){
  echo "Questa pagina non è disponibile.";
  die();
 }

// connessione al Database
include("db.php");

if(isset($_POST['descrizione'])){
  $desc = $_POST['descrizione'];
  if (!preg_match("/^[a-zA-Z\s]+$/",$desc)){
      echo "False";
    } else{
      $check = $db -> query("SELECT * FROM categorie WHERE lower(descrizione) = lower('$desc')");
      var_dump($check);
      if (mysqli_num_rows($check) == 0) {
        $db->query("INSERT INTO categorie(descrizione) VALUES ('$desc') ");
        echo "<option value=".$db->insert_id.">".$desc."</option>";
        } else {
          echo "False";
        }
    }
  }

?>
