<?php
session_start();
$errors = array();

// connessione al database
include("db.php");

// REGISTRAZIONE
if (isset($_POST['register'])) {
  $username = mysqli_real_escape_string($db,$_POST['username']);
  $email = mysqli_real_escape_string($db, $_POST['email']);
  $password = mysqli_real_escape_string($db, $_POST['password']);
  // form validation
  if (empty($username)) { array_push($errors, "Username obbligatorio."); }
  if (empty($email)) { array_push($errors, "Inserisci la tua email."); }
  if (empty($password)) { array_push($errors, "Password obbligatoria."); }

  if (count($errors) == 0) {
    //codifica della password
  	$hash = password_hash($password, PASSWORD_DEFAULT);
    //prepared statements
  	$query_reg = $db ->prepare ("INSERT INTO utenti(username,email,password) VALUES (?,?,?)");
    $query_reg ->bind_param("sss",$username, $email, $hash);
  	$query_reg->execute();
    $query_reg->close();
    $_SESSION['username'] = $username;
    $_SESSION['id'] = $db->insert_id;
    header('location: divider_profile.php');
  }
}

//LOGIN
if (isset($_POST['entra'])) {
  $username = mysqli_real_escape_string($db, $_POST['user']);
  $password = mysqli_real_escape_string($db, $_POST['psw']);

  if (empty($username)) { array_push($errors, "Username richiesto.");  }
  if (empty($password)) {	array_push($errors, "Password richiesta.");  }

  if (count($errors) == 0) {
    $query = "SELECT * FROM utenti WHERE username='$username' ";
    $result = mysqli_query($db,$query);
    if (mysqli_num_rows($result) == 1)  { //se c'è corrispondenza
      $userinfo = mysqli_fetch_array($result);
      password_verify($password, $userinfo['password']); //controllo password codificata
        $_SESSION['username'] = $userinfo['username'];
        $_SESSION['id'] = $userinfo['id_utente'];
          header('location: home.php');
        }
        else {
          array_push($errors, "Combinazione username/password errata.");
        }
      }
    }


?>
