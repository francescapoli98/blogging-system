<?php include('blog_processor.php'); ?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>
<?php
    $blog = $_GET['blog'];
		$result = mysqli_query($db,"SELECT * FROM blog WHERE id_blog ='$blog' ");
    if (mysqli_num_rows($result) == 1) {
      //prendo tutti i dati del blog
			$infoblog = mysqli_fetch_assoc($result);
      //risalgo al nome utente dell'autore
      $userid  = $infoblog['id_utente'];
      $catid = $infoblog['id_cat_blog'];
      $coautore = $infoblog['coautore'];
      $sfondo = $infoblog['id_sfondo'];
      $cornice = $infoblog['id_cornice'];
      $user = current($db->query("SELECT username FROM utenti WHERE id_utente='$userid'")->fetch_assoc());
      $prof = current($db->query("SELECT id_profilo FROM profilo WHERE id_utente='$userid'")->fetch_assoc());
      $cat = current($db->query("SELECT descrizione FROM categorie WHERE id_categoria='$catid'")->fetch_assoc());
      if($coautore != NULL){
        $coaut = current($db->query("SELECT username FROM utenti WHERE id_utente='$coautore'")->fetch_assoc());
        $profcoaut = current($db->query("SELECT id_profilo FROM profilo WHERE id_utente='$coautore'")->fetch_assoc());
      }
      if($sfondo!=NULL){
        $wall = current($db->query("SELECT codice_html FROM colori WHERE id_colore='$sfondo'")->fetch_assoc());
      }
      if($cornice!=NULL){
        $border = current($db->query("SELECT codice_css FROM stili WHERE id_stile='$cornice'")->fetch_assoc());
      }
		}

    ?>

<!--BLOG-->
<div class="container blogdiv" id="blog_<?=$infoblog['id_blog']?>" style="background-color:<?=$wall?>;   border-style: <?=$border?>;">
    <!-- immagine (opzionale)-->
    <?php if ($infoblog['url_immagine'] != NULL):?>
    <div id="blogimg" class="container-fluid adapt text-center "> 
      <img src="blogpics/<?php echo $infoblog['url_immagine']?>" alt="Nessuna immagine" class="img-fluid rounded">
    </div>
    <?php endif?>
    <!-- informazioni sul blog-->
	<div class="container">
      <h1 class="display-2 check"> <?php echo $infoblog['titolo'];?> </h1>
      <h5> Creato da <a class="name" href="profilo.php?profilo=<?php echo $prof;?>"> <?php echo  $user;?></a> il <?php echo  $infoblog['data_creazione'];?> </h5>
      <h5>Categoria: <?php echo $cat; ?> </h5>
      <?php if($infoblog['coautore'] != NULL):?>
      <h5> Coautore: <a class="name" href="profilo.php?profilo=<?php echo $profcoaut;?>" ><?php echo $coaut;?></a></h5>
      <?php endif ?>
    <div class="desc">
      <h4 class="lead check"> <?php echo  nl2br($infoblog['descrizione']);?> </h4>
    </div>
  </div>
    <!-- bottone per eliminazione-->
    <?php if(isset($_SESSION['id']) && ($_SESSION['id'] == $infoblog['id_utente'] || $_SESSION['id'] == $infoblog['coautore'])) : ?>
      <div class="row">

        <div class="col">
          <button class="btn btn-danger eliminablog" id="elimina<?= $infoblog['id_blog']?>" data-id="<?= $infoblog['id_blog']?>">Elimina blog </button>
          <div id="dialog_blog" title="Eliminare il blog?" class="container">
             <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>Il blog e tutti i suoi contenuti saranno eliminati definitivamente e non potranno essere recuperati.</p>
          </div>
        </div>

        <div class="col">
          <button class="btn btn-info" onclick="window.location.href='styling_blog.php?edit=<?=$infoblog['id_blog']?>'"><i class="far fa-edit"></i> Modifica</button>
        </div>
      </div>
    <?php endif;?>
</div>
</br>

      <!--INIZIO FORM PER NUOVO POST-->
    <?php if(isset($_SESSION['id']) && ($_SESSION['id'] == $infoblog['id_utente']  || $_SESSION['id'] == $infoblog['coautore'])) : ?>
      <div class="container postform">
         <h6 class="lead">Crea un nuovo post:</h6>
        <form action="" method="POST" enctype="multipart/form-data">
           <?php include('errors.php');?>
          <div class="form-group">
            <input type="text" class="form-control" name="post_title" placeholder="Titolo"/>
          </div>
          <div class="form-group">
            <textarea class="form-control" rows="5" name="post_text" placeholder="Testo"></textarea>
          </div>
          <div class="form-group">
            <h6>Scegli un'immagine:</h6>
            <input type="file" class="form-control-file" name="post_img"/>
          </div>
          <input type="submit" class="btn btn-info" name="submit" id="submit" value="Posta"/>
        </form>
      </div>
    <?php endif ?>
<!--FINE FORM-->

<!--POSTS-->
<div class="container" id="allposts">
  <?php
  if($select = $db->query("SELECT * FROM post WHERE id_blog='$blog' ORDER BY data DESC")){
    while($post = mysqli_fetch_array($select)){
      echo    '<div class="container postcontainer" name="'.$post['id_post'].'">
                 <div class="row">
                  <a href="post.php?post='.$post['id_post'].'"><h1 class="lead postlink check">'.$post['titolo'].'</h1><a>
                 </div>
                 <div class="row">
                  '.$post['data'].'
                 </div>
                 <div class="row">
                   <p class="check">'. nl2br($post['testo']).'</p>
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
          }
   ?>
</div>

<?php include_once 'footer.php';?>
