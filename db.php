<?php
// connessione al Database
$db = mysqli_connect('localhost', 'root', '', 'rock_your_blog');
mysqli_set_charset($db, "utf-8");
// Check connection
if (mysqli_connect_errno()){
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

?>
