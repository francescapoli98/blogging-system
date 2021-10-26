<?php
session_start();
// connect to the database
include("db.php");
//LOGIN
  if (isset($_POST['string'])) {
    $word = $_POST['string'];
    $result = mysqli_query($db,"SELECT * FROM utenti WHERE LOWER(username) LIKE LOWER('%".$word."%') ORDER BY username ");
       if (mysqli_num_rows($result) == 0) {
          echo json_encode('<div class="alert alert-danger">Nessun risultato.</div>');
       } else {
         $data = "";
         while ($row = mysqli_fetch_array($result)) {
           $data .= '<option class="login" id=" '. $row['id_utente'] .' " value="' . $row['username'] . ' "> ' . $row['username'] . ' </option>';
         }   echo json_encode($data);
       }
     }

//COAUTORE
     if (isset($_POST['name'])) {
       $word = $_POST['name'];
       $result = mysqli_query($db,"SELECT * FROM utenti WHERE LOWER(username) LIKE lower('%".$word."%') AND id_utente IN (SELECT id_utente FROM premium) ORDER BY username "); //QUERY DA AGGIUSTARE, BISOGNA AGGIUNGERE LA CLAUSOLA CHE L'UTENTE SIA PREMIUM ?????
          if (mysqli_num_rows($result) == 0) {
             echo json_encode('<div class="alert alert-danger">Nessun risultato.</div>');
          } else {
            $data = "";
            while ($row = mysqli_fetch_array($result)) {
              $data .= '<option class="choose" id=" '. $row['id_utente'] .' " value="' . $row['username'] . ' "> ' . $row['username'] . ' </option>';
            }   echo json_encode($data);
          }
        }
?>
