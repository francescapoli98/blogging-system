<?php session_start();
include("db.php");
include_once 'incipit.php';
include_once 'header.php'; ?>

  <!--DASHBOARD-->
  <div class="container-fluid bg-dashboard1 text-left">
   <div class="container">
    <h1 class="display-3">With us, you rock.</h1>
    <p class="lead"> RockYourBlog è una piattaforma moderna e semplice da usare, che ti permetterà di avere uno spazio in cui esprimere le tue idee: un blog personale. </p>
    <p class="lead"> <a class="visible" href="signup.php">Registrandoti</a> come utente avrai a disposizione la personalizzazione di due blog. I blog si organizzano in categorie, così da risultare più semplice la loro ricerca.</p>
    <p class="lead"> Se invece volessi creare più di due blog, allora avrai bisogno di fare un upgrade alla nostra offerta <a class="visible" href="carte_form.php">Premium!</a></p>
   </div>
  </div>
  <div class="container-fluid bg-dashboard2 text-right">
   <div class="container">
    <h2 class="display-3"> Vuoi dare un'occhiata in giro?</h2>
    <h2 class="display-4">Scopri i contenuti migliori per te!</h2>
    <a href="search_category.php"> <h4 class="text-uppercase vailink">inizia una ricerca per categoria</h4> </a>
   </div>
  </div>
  <div class="container-fluid">
    <div class="container">
    <h1 class="display-3"> I post più recenti di RockYourBlog: </h1>
    <h5> Per leggerli, clicca sul nome del post. Per vedere il blog su cui è stato pubblicato, clicca sul nome del blog. </h5>
  </div>
    <?php
    $query = mysqli_query($db, "SELECT * FROM post ORDER BY data LIMIT 5");
    while ($post = mysqli_fetch_array($query)){
      $idblog = $post['id_blog'];
      $blog = current($db->query("SELECT titolo FROM blog WHERE id_blog = '$idblog'")->fetch_assoc());
      echo    '<div class="container postcontainer" name="'.$post['id_post'].'">
                 <div class="row">
                  <a href="post.php?post='.$post['id_post'].'"><h1 class="lead postlink check">'.$post['titolo'].'</h1><a>
                 </div>
                 <div class="row">
                  '.$post['data'].'
                 </div>
                 <div>
                  da <a href="show_blog.php?blog='.$idblog.'" class="lead vailink"> '.$blog.'</a>
                 </div>
                </div>';
                $idpost = $post['id_post'];
                if( $post['url_immagine'] != NULL){
                  echo '<div class="container text-center" style="height:400px;">
                    <img src="postpics/'.$post['url_immagine'].'" class="img-fluid mh-100 " alt="Nessuna immagine" />
                  </div>';
                }
                //likes e commenti
              if($likes = current($db->query("SELECT valutazione FROM post WHERE id_post = $idpost ")-> fetch_assoc())){
                echo '<a class="counter" href="post.php?post='.$idpost.'">Likes: '.$likes.'</a>';
              } else{
                echo '<a class="counter" href="post.php?post='.$idpost.'">Likes: 0</a>';
              }
              if($comments = current($db->query("SELECT COUNT(id_commenti) FROM commenti WHERE id_post = $idpost")-> fetch_assoc())){
                echo '<a class="counter" href="post.php?post='.$idpost.'">Commenti: '.$comments.'</a>';
              } else {
                  echo '<a class="counter" href="post.php?post='.$idpost.'">Commenti: 0</a>';
              }
            }
    ?>
  </div>



<?php include_once 'footer.php';?>
