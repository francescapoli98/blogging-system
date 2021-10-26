<?php
session_start();
// connect to the database
include("db.php");

  if (isset($_POST['string'])) {
    $word = $_POST['string'];
    $query_blog = $db->query("SELECT * FROM blog WHERE lower(titolo) LIKE lower('%".$word."%') ORDER BY titolo ASC");
    $query_profilo = $db->query("SELECT * FROM profilo,utenti WHERE profilo.id_utente = utenti.id_utente AND lower(username) LIKE lower('%".$word."%') ORDER BY username ASC");

    if(mysqli_num_rows($query_blog)==0 && mysqli_num_rows($query_profilo)==0){
      echo json_encode('<div class="alert alert-danger">Nessun risultato.</div>');
    } else {
      $data = "";
      if($query_blog->num_rows > 0){
          while($row = $query_blog->fetch_assoc()){
            $data .= '<div class="row results"><a id=" '. $row['id_blog'] .' " value="' . $row['titolo'] . ' " href="show_blog.php?blog= ' .$row['id_blog']. ' "> ' . $row['titolo'] . ' - blog </a></div>';
          }
      }

      if($query_profilo->num_rows > 0){
          while($row = $query_profilo->fetch_assoc()){
            $data .= '<div class="row results"><a id=" '. $row['id_profilo'] .' " value="' . $row['username'] . ' " href="profilo.php?profilo= '. $row['id_profilo'] .' "> ' . $row['username'] . ' - utente </a></div>';
          }
      }
          echo json_encode($data);
    } //fine else
  }



?>
