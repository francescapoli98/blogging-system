<?php include('options.php');?>
<?php include_once 'incipit.php'; ?>
<?php include_once 'header.php'; ?>

<div class="container-fluid">
<div class="container">
  <h5 class="display-4">Scopri il mondo di RockYourBlog.</h5>
  <h6 class="lead">Scegli una o più categorie che ti interessano:</h6>
  <br/>
  <form action="" method="POST" class="form-check">
      <?php
      echo $options;
      ?>
      <br/>
  <input type="submit" name="Invia" value="Invia" class="btn btn-outline-info"></input>
</form>
</div>
<?php include("errors.php");?>
<?php
if(isset($_POST['Invia'])){
  $chosen = array();
  if(!empty($_POST['categoria'])){
    foreach ($_POST['categoria'] as $element) {
      array_push($chosen,$element);
    }
    foreach ($chosen as $category){
      //ritrovo la stringa col nome della categoria
      $category_name = current($db->query("SELECT descrizione FROM categorie WHERE id_categoria='$category'")->fetch_assoc());
      $search = mysqli_query($db,"SELECT id_blog,titolo,url_immagine FROM blog WHERE id_cat_blog = '$category'");
      if(mysqli_num_rows($search)>=1) {
        //creo un array con tutti i blog trovati
        while ($blogelements = mysqli_fetch_array($search)){
            echo    '<div class="container" style="margin-top: 50px; margin-bottom: 50px;">
                       <div class="list-group">
                         <a href="show_blog.php?blog='.$blogelements['id_blog'].'" class="list-group-item list-group-item-action">
                          <img class="img-thumbnail mh-100 float-left" style=" max-width: 100px; margin-right: 100px;" src="blogpics/'.$blogelements['url_immagine'].'"</img>'.$blogelements['titolo'].'
                          <p>Categoria: '.$category_name.'</p>
                         </a>
                        </div>
                      </div>';
                    }
              } else {
                  echo '</br>
                        <div class="container">
                         <h6>Pare non esistano ancora blog appartenerti alla categoria '.$category_name.', <a href="blog.php">vuoi crearne uno tu?</a></h6>
                        </div>';
              }
      }
  } else {
    array_push($errors,"Scegli almeno una categoria!");
  }
}
 ?>
</div>
<?php include_once 'footer.php';?>
