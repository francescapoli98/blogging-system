<?php session_start();
// connessione al Database
include("db.php");
$comment = "";
    if(isset($_POST['ok'])){
      $comment = str_replace( array( "\r", "\r\n", "\n" ), '', $_POST['comment'] );
      $comment = mysqli_real_escape_string($db, $comment);
      $comment = stripslashes($comment);

      $user = $_SESSION['id'];
      $date = date('Y-m-d H:i:s');
      $post = $_GET['post'];

      $insert = $db -> prepare ("INSERT INTO commenti(id_utente,id_post,testo,data) VALUES (?,?,?,?)");
      $insert -> bind_param("iiss",$user,$post,$comment,$date);
      $insert -> execute();
      $insert -> close();
      header("location:post.php?post=".$post);
    }

 ?>
