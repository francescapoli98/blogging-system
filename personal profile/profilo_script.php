<?php
session_start();
// Creo la connessione al DataBase
include("db.php");
  // inizializzo le variabili
  $name = "";
  $surname = "";
  $city = "";
  $bio = "";
  $errors = array();




  if (isset($_POST['invia'])) {
  // ricevo i valori degli input dal form e controllo che siano corretti
  $name = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['name'] );
  $name = mysqli_real_escape_string($db, $name);
  $name = stripslashes($name);

  $surname = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['surname'] );
  $surname = mysqli_real_escape_string($db, $surname);
  $surname = stripslashes($surname);

  $city = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['city'] );
  $city = mysqli_real_escape_string($db, $city);
  $city = stripslashes($city);

  $bio = str_replace( array( "\r", "\r\n", "\n" ), '</br>', $_POST['bio'] );
  $bio = mysqli_real_escape_string($db, $bio);
  $bio = stripslashes($bio);

  $age = $_POST["age"];
  settype($age,"integer");

  // validazione form: non sono sicuro che il form sia stato riempito correttamente
  // il messaggio d' errore corrisponde a un elemnto nel array "$error"
  if (empty($name)) { array_push($errors, "Inserisci il tuo nome."); }
  if (empty($age)) { array_push($errors, "Inserire età."); }
  if (empty($surname)) { array_push($errors, "Inserisci il tuo cognome."); }
  if (empty($city)) { array_push($errors, "Inserisci il nome della tua città."); }
  if (empty($bio)) { array_push($errors, "Inserisci una tua descrizione."); }

    if (isset($_FILES['profile_img']) && !empty($_FILES['profile_img']['name'])){
        //solo se c'� l'immagine
        if ($_FILES['profile_img']['error'] > 0 || $_FILES ['profile_img']['size'] > 2097152){ //problema della dimensione
            array_push($errors, "L'immagine scelta è troppo grande.");
          } else{
            $imgname = $_FILES['profile_img']['name'];
            $tmp_name = $_FILES['profile_img']['tmp_name'];
            $imgname = rand(999,1000).date('YmdHis').$imgname;
            move_uploaded_file($tmp_name, 'profilepics/'.$imgname);
          }
        }  else {
          $imgname = NULL;
        }
if (count($errors) == 0) {
    $user = $_SESSION['id'];
    //prepared statements
    $query_profilo = $db ->prepare ("INSERT INTO profilo(id_utente,nome,cognome,eta,citta,bio,url_foto) VALUES (?,?,?,?,?,?,?)");
    $query_profilo ->bind_param("ississs", $user, $name, $surname, $age,$city,$bio,$imgname);
    $query_profilo -> execute();
    $query_profilo->close();
        header('location: profilo.php?profilo='.$db->insert_id);
      }

    }



    //MODIFICHE AL PROFILO
    if (isset($_POST['modifica'])){
      $prof = $_REQUEST['edit'];
      $oldprof = mysqli_query($db,"SELECT * FROM profilo WHERE id_profilo = '$prof'");
      $before = mysqli_fetch_array($oldprof);
    //ricevo valori dal form
      if(isset($_POST['edit_name'])){
        $edit_name = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['edit_name']);
        $edit_name = mysqli_real_escape_string($db, $edit_name);
        $edit_name = stripslashes($edit_name);
      } else {
        $edit_name = $before['nome'];
      }

      if(isset($_POST['edit_surname'])){
        $edit_surname = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['edit_surname'] );
        $edit_surname = mysqli_real_escape_string($db, $edit_surname);
        $edit_surname = stripslashes($edit_surname);
      } else {
        $edit_surname = $before['cognome'];
      }

      if(isset($_POST['edit_age'])){
        $edit_age = mysqli_real_escape_string($db,$_POST['edit_age']);
      } else {
        $edit_age = $before['eta'];
      }

      if(isset($_POST['edit_city'])){
        $edit_city = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['edit_city'] );
        $edit_city = mysqli_real_escape_string($db, $edit_city);
        $edit_city = stripslashes($edit_city);
      } else {
        $edit_city = $before['citta'];
      }

      if(isset($_POST['edit_bio'])){
        $edit_bio = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['edit_bio'] );
        $edit_bio = mysqli_real_escape_string($db, $edit_bio);
        $edit_bio = stripslashes($edit_bio);
      } else {
        $edit_bio = $before['bio'];
      }

    //salvo immagine del profilo
      if (isset($_FILES['edit_img']) && !empty($_FILES['edit_img']['name'])){
        //facoltativa
        if ($_FILES['edit_img']['error'] > 0 || $_FILES ['edit_img']['size'] > 2097152){  //problema della dimensione
          array_push($errors, "L'immagine scelta è troppo grande.");
        } else{
          $imgname = $_FILES['edit_img']['name'];
          $tmp_name = $_FILES['edit_img']['tmp_name'];
          $imgname = rand(999,1000).date('YmdHis').$imgname;
          move_uploaded_file($tmp_name, 'profilepics/'.$imgname);
        }
      }  else {
        $imgname = $before['url_foto'];
      }

    //query

    $edit = $db->prepare("UPDATE profilo SET nome=?, cognome=?, eta=?, citta=?, bio=?, url_foto=? WHERE id_profilo = ?");
    $edit->bind_param('ssisssi',$edit_name, $edit_surname, $edit_age, $edit_city, $edit_bio, $imgname,$prof);
    $edit->execute();
    $edit->close();
    header("location: profilo.php?profilo=".$prof);
    }
    ?>
