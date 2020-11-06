<?php
session_start();
// connect to the database
include("db.php");

//username check
if(isset($_POST['user_name']) && $_POST['user_name'] != '') {
  $response = array();
  $username = mysqli_real_escape_string($db, $_POST['user_name']);
   $res = mysqli_query($db, "SELECT username FROM utenti WHERE username ='".$username."'");
   $count = mysqli_num_rows($res);
   if($count > 0){
      $response['status'] = false;
      $response['msg'] = 'Username non disponibile.';
    } else if(strlen($username) < 3 || strlen($username) > 20) {
        $response['status'] = false;
        $response['msg'] = 'Lunghezza compresa tra 3 e 20 lettere';
    } else if (!preg_match("/^[_a-zA-Z0-9]+$/", $username)) {
        $response['status'] = false;
        $response['msg'] = 'Solo caratteri alfanumerici e _ sono ammessi.';
    } else{
        $response['status'] = true;
        $response['msg'] = 'Username disponibile.';
    }
 echo json_encode($response);
 }
//email check
 if(isset($_POST['email']) && $_POST['email'] != '') {
   $response = array();
   $email = mysqli_real_escape_string($db, $_POST['email']);
    $res = mysqli_query($db, "SELECT email FROM utenti WHERE email ='".$email."'");
    $count = mysqli_num_rows($res);
    if($count > 0){
       $response['status'] = false;
       $response['msg'] = 'Email già in uso.';
     } else if (!preg_match("/^([_a-zA-Z0-9]+)@([a-z]+)\.([a-z.]{2,6})$/", $email)) {
         $response['status'] = false;
         $response['msg'] = 'Formato email non valido, o incompleto.';
     } else{
         $response['status'] = true;
         $response['msg'] = 'Email disponibile.';
     }
  echo json_encode($response);
  }

 ?>
