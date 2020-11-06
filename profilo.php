<?php include('profilo_script.php');?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>
  <?php
  $profilo = $_REQUEST['profilo'];
  $result = mysqli_query($db,"SELECT * FROM profilo WHERE id_profilo ='$profilo' ");
  if (mysqli_num_rows($result) == 1) {
    $profile = mysqli_fetch_array($result);
  }
  ?>
<div class="container row profilo" id="profilo_<?=$profile['id_utente'];?>">
  <?php $query = current($db -> query("SELECT url_foto FROM profilo WHERE id_profilo = '$profilo'")->fetch_assoc());
  if ($query != NULL):?>
  <div class="col-sm-6 text-center">
    <img src="profilepics/<?=$profile['url_foto']?>" alt="Nessuna immagine" class="rounded img-fluid">
  </div>
<?php endif;?>
  <div class="col-sm-6">
  <div class="row text-center">
    <h3 class="display-4"><?php echo $profile['nome']." ".$profile['cognome'];?></h3>
  </br>
  </div>
  <div class="row">
    <ul>
      <li>Età: <span class="prof"><?php echo $profile['eta'];?></span> </li>
      <li>Da: <span class="prof"><?php echo $profile['citta'];?></span> </li>
    </ul>
  </div>
  <div class="description">
    <p> &raquo; <?php echo $profile['bio'];?></p>
  </div>
  <div class="row">
    <button class="btn btn-info" onclick="window.location.href='styling_prof.php?edit=<?=$profile['id_profilo']?>'"><i class="far fa-edit"></i> Modifica</button>
  </div>
</div>

</div>

<!-- LISTA DEI BLOG -->
<div class="container">
  <h1 class="display-4"> Lista dei blog creati da questo utente: </h1>
  <?php
  $findblogs = mysqli_query($db,"SELECT * FROM blog WHERE id_utente = (SELECT id_utente FROM profilo WHERE id_profilo='$profilo')");
  if (mysqli_num_rows($findblogs) >= 1) {
    while ($blogs = mysqli_fetch_assoc($findblogs)){
      echo ' <div class="list-group" style="margin-top: 20px; margin-bottom:20px;">
                <a href="show_blog.php?blog='.$blogs['id_blog'].'" class="list-group-item list-group-item-action">
                    <img class="img-thumbnail mh-100 float-left" style=" max-width: 100px; margin-right: 100px;" src="blogpics/'.$blogs['url_immagine'].'"</img>
                  <h1 class="font-weight-light">'.$blogs['titolo'].'</h1>
                </a>
              </div>';
    }
  } else {
    echo "<h6>L'utente non ha ancora creato alcun blog. </h6>";
  } ?>
  <h1 class="display-4"> Lista dei blog di cui l'utente è coautore: </h1>
  <?php
  $findblogs = mysqli_query($db,"SELECT * FROM blog WHERE coautore = (SELECT id_utente FROM profilo WHERE id_profilo='$profilo')");
  if (mysqli_num_rows($findblogs) >= 1) {
    while ($blogs = mysqli_fetch_assoc($findblogs)){
      echo ' <div class="list-group" style="margin-top: 20px; margin-bottom:20px;">
                <a href="show_blog.php?blog='.$blogs['id_blog'].'" class="list-group-item list-group-item-action">
                    <img class="img-thumbnail mh-100 float-left" style=" max-width: 100px; margin-right: 100px;" src="blogpics/'.$blogs['url_immagine'].'"</img>
                  <h1 class="font-weight-light">'.$blogs['titolo'].'</h1>
                </a>
              </div>';
    }
  } else{
    echo "<h6>L'utente non ha ancora partecipato alla creazione di alcun blog.</h6>";
  }
  if(isset($_SESSION['id'])&&($_SESSION['id']==$profile['id_utente'])){
       echo ('</br>
       <button class="btn btn-danger eliminaprofilo" id="elimina'.$profile['id_utente'].'" data-id="'.$profile['id_utente'].'">Elimina account </button>
       <div id="dialog_profilo" title="Elimina account?">
          <p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>Il tuo account e tutti i contenuti da te creati saranno eliminati definitivamente e non potranno essere recuperati.</p>
       </div>' );
   } ?>

</div>
<?php include_once 'footer.php';?>
