<?php include('commenti.php'); ?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>

<?php
    $post = $_REQUEST['post'];
		$result = mysqli_query($db,"SELECT * FROM post WHERE id_post ='$post' ");
    if (mysqli_num_rows($result) == 1) {
      //prendo tutti i dati del blog
			$infopost = mysqli_fetch_assoc($result);
      //risalgo al nome utente dell'autore
      $userid  = $infopost['id_utente'];
      $user = current($db->query("SELECT username FROM utenti WHERE id_utente='$userid'")->fetch_assoc());
      $prof = current($db->query("SELECT id_profilo FROM profilo WHERE id_utente='$userid'")->fetch_assoc());
      $blogid = $infopost['id_blog'];
      $blog = current($db->query("SELECT titolo FROM blog WHERE id_blog='$blogid'")->fetch_assoc());
      $coautore = current($db->query("SELECT coautore FROM blog WHERE id_blog='$blogid'")->fetch_assoc());
		}

    ?>
    <script>
    $(document).ready(function(){
      //LIKE COMMENTO
      $(".fas").one("click",function(){
        var idcomm = $(this).attr('id');   //prendo l'id del commento dal div dei likes
        $.ajax({
          url: "likes.php",
          method: 'POST',
          data: {idcomm:idcomm , liked:1},
          success: function(data){
            var thisid = "#likes" + idcomm;
          $(thisid).text(data); //stampo il numero di likes
        }
        });
      });

      //LIKE POST
      $(".far").one("click",function(){
        var idpost = $(this).attr('id');   //prendo l'id del post dal div dei likes
        $.ajax({
          url: "likes.php",
          method: 'POST',
          data: {idpost:idpost , like:1},
          success: function(data){
            var thisid = "#like_" + idpost;
          $(thisid).text(data); //stampo il numero di likes
        }
        });
      });
  });
</script>
  <div class="container" id="post_<?=$infopost['id_post']?>">
    <?php if ($infopost['url_immagine'] != NULL):?>
    <div id="postimg" class="container-fluid adapt text-center ">
      <img src="postpics/<?php echo $infopost['url_immagine']?>" alt="Nessuna immagine"class="img-fluid rounded" >
    </div>
  <?php endif?>
	<div class="container postdiv">
      <h3 class="display-4"> <?php echo $infopost['titolo'];?> </h3>
      <h6> Postato da <a class="name" href="profilo.php?profilo=<?=$prof?>"> <?php echo $user;?></a> su
        <a class="name turnback" data-id="<?=$infopost['id_blog']?>" href="show_blog.php?blog=<?=$infopost['id_blog']?>"> <?= $blog; ?></a></h6>
      <small><?php echo $infopost['data'];?></small>
</br>
      <h6 class="lead"> <?php echo  nl2br($infopost['testo']);?> </h6>
      <div class="like">
         <i class="far fa-heart" id="<?=$infopost['id_post']?>"></i>
         <p id="like_<?=$infopost['id_post']?>"><?= $infopost['valutazione']?></p>
      </div>
    </div>

  <?php if(isset($_SESSION['id'])&&($_SESSION['id']==$infopost['id_utente'])  || $_SESSION['id'] == $coautore):?>
   <div class="row">
       <div class="col">
       <button class="btn btn-danger eliminapost" id="elimina<?=$infopost['id_post']?>" data-id="<?=$infopost['id_post']?>">Cancella il post </button>
       <div id="dialog_post" title="Eliminare il post?">
          <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>Il post sarà eliminato definitivamente e non potrà essere recuperato.</p>
       </div>
       </div>

       <div class="col">
         <button class="btn btn-info" onclick="window.location.href='styling_post.php?edit=<?=$infopost['id_post']?>'"><i class="far fa-edit"></i> Modifica</button>
       </div>
    </div>
  <?php endif;?>
</div>
</br>

<!--Aggiungi un commento-->
<?php if(isset($_SESSION['id'])):?>
<div class="container" id="newcomment">
  <form action="" method="POST">
    <div class="row">
      <div class="col-sm-10">
        <input type="text" class="form-control" name="comment" placeholder="Lascia un commento"/>
      </div>
      <div class="col-sm-2">
        <input type="submit" class="btn btn-info" name="ok" value="OK"/>
      </div>
    </div>
  </form>
</div>
<?php endif;?>
</br>
<!-- Stampa i commenti già inseriti-->
<div class="container" id="allcomments">
    <?php
    if($commento = $db->query("SELECT * FROM commenti WHERE id_post='$post' ORDER BY data DESC")){
      while($comm = mysqli_fetch_array($commento)){
        $id = $comm['id_utente'];
        $username = current($db->query("SELECT username FROM utenti WHERE id_utente='$id'")->fetch_assoc());
        echo '<div id="comm_'.$comm['id_commenti'].'" class="container commentdiv2">
        <h6><small>Postato il </small>'.$comm['data'].' <small>da</small> '.$username.'</h6>
        <p>'. $comm['testo'].'</p>
        <div class="like">
           <i class="fas fa-thumbs-up" id="'.$comm['id_commenti'].'"></i>
           <p id="likes'.$comm['id_commenti'].'">'.$comm['valutazione'].'</p>
        </div>
        </div>';
        if(isset($_SESSION['id']) && ($_SESSION['id'] == $infopost['id_utente']  || $_SESSION['id'] == $coautore || $_SESSION['id'] == $comm['id_utente'])){
            echo ('<button class="btn btn-outline-danger eliminacomm" id="elimina'.$comm['id_commenti'].'" data-id="'.$comm['id_commenti'].'"> Elimina </button>');
       }
      }
    }

 ?>

  </div>
  <?include_once 'footer.php';?>
