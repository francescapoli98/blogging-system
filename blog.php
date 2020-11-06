<?php include('blog_processor.php'); ?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>
 <div class="container">
   <?php
    if(isset($_SESSION['id'])){  //pagina visibile solo a chi è già registrato
      $userid = $_SESSION['id'];
      $result = mysqli_query($db, "SELECT * FROM blog WHERE id_utente = '$userid'");
      $premium = mysqli_query($db, "SELECT * FROM premium WHERE id_utente = '$userid'");
      if(mysqli_num_rows($premium) == 0 && mysqli_num_rows($result)<2){ //se l'utente non è premium e ha creato meno di due blog
        include('blog_form.php');
      }elseif(mysqli_num_rows($premium) == 1){ //se l'utente è premium
        include('blog_form.php');
      } elseif(mysqli_num_rows($premium) == 0 && mysqli_num_rows($result)>=2) { //se l'utente non è premium e ha raggiunto il limite di blog creati
        echo '<div class="alert alert-danger">Hai raggiunto il limite di blog per un utente registrato. Per creare altri blog, <a href="carte_form.php">passa a Premium</a>.</div>';
    }
  } else { //se l'utente è visitatore non registrato
      echo '<div class="alert alert-danger"> Non puoi creare un blog senza essere un utente registrato.</div>';
    }
    ?>
  </div>
<?php include_once 'footer.php'?>
