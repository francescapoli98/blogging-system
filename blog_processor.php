<?php session_start();
include("db.php");

$errors = array();

//BLOG
if (isset($_POST['crea'])){
  //ricevo valori dal form
  $blog_title = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['blog_title'] );
  $blog_title = mysqli_real_escape_string($db, $blog_title);
  $blog_title = stripslashes($blog_title);

  $description = str_replace( array( "\r", "\r\n", "\n" ), '</br>', $_POST['description'] );
  $description = mysqli_real_escape_string($db, $description);
  $description = stripslashes($description);

  if(!empty($_POST['coauthor'])){  //solo per premium, a scelta
    $coauthor = mysqli_real_escape_string($db,$_POST['coauthor']);
    error_reporting(0);
    $coaut = current($db -> query("SELECT id_utente FROM utenti WHERE username = '$coauthor' AND utenti.id_utente IN (SELECT id_utente FROM premium)") -> fetch_assoc());
    if($coaut == NULL){
      array_push($errors, "L'utente scelto non possiede un account Premium.");
    } else{
      $coauthor = $coaut;
    }
  } else {
    $coauthor = NULL;
  }

  if(isset($_POST['category'])){
    $category = $_POST['category'];
   } else{
    array_push($errors, "Scegli una categoria."); //errore se la select non viene utilizzata
   }

   if(isset($_POST['sfondo'])){
     $sfondo = $_POST['sfondo'];
    } else{
     $sfondo =  NULL;
    }

    if(isset($_POST['cornice'])){
      $cornice = $_POST['cornice'];
     } else{
      $cornice =  NULL;
     }
  //errori: campi vuoti
  if (empty($blog_title)) { array_push($errors, "Inserisci un titolo."); }
  if (empty($description)) { array_push($errors, "Inserisci una descrizione."); }

  //controllo sul nome del blog (unico)
  $blog_check_query = "SELECT * FROM blog WHERE titolo='$blog_title' ";
  $result = mysqli_query($db,$blog_check_query);
  if (mysqli_num_rows($result) == 1){
    array_push($errors, "Titolo già in uso, scegline uno diverso.");
  }

  //salvo immagine del blog
    if (isset($_FILES['blog_img']) && !empty($_FILES['blog_img']['name'])){
      //facoltativa
      if ($_FILES['blog_img']['error'] > 0 || $_FILES ['blog_img']['size'] > 2097152){  //problema della dimensione
        array_push($errors, "L'immagine scelta è troppo grande.");
      } else{
        $imgname = $_FILES['blog_img']['name'];
        $tmp_name = $_FILES['blog_img']['tmp_name'];
        $imgname = rand(999,1000).date('YmdHis').$imgname;
        move_uploaded_file($tmp_name, 'blogpics/'.$imgname);
      }
    }  else {
      $imgname = NULL;
    }


    //se non ci sono errori, prendo gli ultimi metadati
   if (count($errors) == 0) {
     $author =  $_SESSION['id'];
     $date = date('Y-m-d H:i:s');
  //query
    $insert = $db -> prepare ("INSERT INTO blog(id_utente, coautore, id_cat_blog, titolo,descrizione,url_immagine,id_sfondo,id_cornice,data_creazione) VALUES (?,?,?,?,?,?,?,?,?)");
    $insert -> bind_param("iiisssiis",$author, $coauthor, $category, $blog_title, $description, $imgname, $sfondo, $cornice, $date);
    $insert -> execute();
    $insert -> close();

    header("location: show_blog.php?blog=".$db->insert_id);
   }
  }

//POST
if(isset($_POST['submit'])){
  $post_title = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['post_title'] );
  $post_title = mysqli_real_escape_string($db, $post_title);
  $post_title = stripslashes($post_title);

  $post_text = str_replace( array( "\r", "\r\n", "\n" ), '</br>', $_POST['post_text'] );
  $post_text = mysqli_real_escape_string($db, $post_text);
  $post_text = stripslashes($post_text);

//ricevo valori dal form
  if (empty($post_title)) { array_push($errors, "Inserisci un titolo."); }
  if (empty($post_text)) { array_push($errors, "Inserisci il testo."); }


    //salvo immagine del post
  if (isset($_FILES['post_img']) && !empty($_FILES['post_img']['name'])){
      //facoltativa
      if ($_FILES['post_img']['error'] > 0 || $_FILES ['post_img']['size'] > 2097152){//problema della dimensione
          array_push($errors, "L'immagine scelta è troppo grande.");
        } else{
          $imgname = $_FILES['post_img']['name'];
          $tmp_name = $_FILES['post_img']['tmp_name'];
          $imgname = rand(999,1000).date('YmdHis').$imgname;
          move_uploaded_file($tmp_name, 'postpics/'.$imgname);
        }
      }  else {
        $imgname = NULL;
      }

//ultimi metadati
if (count($errors) == 0) {
    $autore = $_SESSION['id'];
    $blog = $_REQUEST['blog'];
    $data = date('Y-m-d H:i:s');

    //query
      $insert = $db -> prepare ("INSERT INTO post(id_utente,id_blog,titolo,testo,url_immagine,data) VALUES (?,?,?,?,?,?)");
      $insert -> bind_param("iissss",$autore, $blog, $post_title, $post_text, $imgname, $data);
      $insert -> execute();
      $insert -> close();
      header("location: show_blog.php?blog=".$blog);
    }

}


//MODIFICHE AL BLOG
if (isset($_POST['modifica'])){
  $blog = $_REQUEST['edit'];
  $oldblog = mysqli_query($db,"SELECT * FROM blog WHERE id_blog = '$blog'");
  $before = mysqli_fetch_array($oldblog);
//ricevo valori dal form
  if(isset($_POST['edit_title'])){
    $edit_title = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['edit_title'] );
    $edit_title = mysqli_real_escape_string($db, $edit_title);
    $edit_title = stripslashes($edit_title);
    //controllo sul nome del blog (unico)
    $blog_check = "SELECT * FROM blog WHERE titolo='$edit_title' ";
    $result = mysqli_query($db,$blog_check);
    if (mysqli_num_rows($result) == 1){
      array_push($errors, "Titolo già in uso, scegline uno diverso.");
    }
  } else {
    $edit_title = $before['titolo'];
  }

  if(isset($_POST['edit_description'])){
    $edit_desc = str_replace( array( "\r", "\r\n", "\n" ), '</br>', $_POST['edit_description'] );
    $edit_desc = mysqli_real_escape_string($db, $edit_desc);
    $edit_desc = stripslashes($edit_desc);
  } else {
    $edit_desc = $before['descrizione'];
  }

 if(isset($_POST['edit_sfondo'])){
   $edit_sfondo = $_POST['edit_sfondo'];
  } else{
   $edit_sfondo =  $before['id_sfondo'];
  }

  if(isset($_POST['edit_cornice'])){
    $edit_cornice = $_POST['edit_cornice'];
   } else{
    $edit_cornice =  $before['id_cornice'];
   }

//immagine del blog
  if (isset($_FILES['edit_img']) && !empty($_FILES['edit_img']['name'])){
    //facoltativa
    if ($_FILES['edit_img']['error'] > 0 || $_FILES ['edit_img']['size'] > 2097152){  //problema della dimensione
      array_push($errors, "L'immagine scelta è troppo grande.");
    } else{
      $imgname = $_FILES['edit_img']['name'];
      $tmp_name = $_FILES['edit_img']['tmp_name'];
      $imgname = rand(999,1000).date('YmdHis').$imgname;
      move_uploaded_file($tmp_name, 'blogpics/'.$imgname);
    }
  }  else {
    $imgname = $before['url_immagine'];
  }
//query
$edit = $db->prepare("UPDATE blog SET titolo=?, descrizione=?, url_immagine=?,id_sfondo=?,id_cornice=? WHERE id_blog = ?");
$edit->bind_param('sssiii',$edit_title, $edit_desc, $imgname,$edit_sfondo,$edit_cornice,$blog);
$edit->execute();
$edit->close();
header("location: show_blog.php?blog=".$blog);
}


//MODIFICHE AL POST
if (isset($_POST['editthis'])){
  $post = $_REQUEST['edit'];
  $oldpost = mysqli_query($db,"SELECT * FROM post WHERE id_post = '$post'");
  $before = mysqli_fetch_array($oldpost);
//ricevo valori dal form
  if(isset($_POST['edit_titlep'])){
    $edit_titlep = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['edit_titlep'] );
    $edit_titlep = mysqli_real_escape_string($db, $edit_titlep);
    $edit_titlep = stripslashes($edit_titlep);
  } else{
    $edit_titlep = $before['titolo'];
  }

  if(isset($_POST['edit_textp'])){
    $edit_text = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['edit_textp'] );
    $edit_text = mysqli_real_escape_string($db, $edit_text);
    $edit_text = stripslashes($edit_text);
  } else {
    $edit_text = $before['testo'];
  }

//immagine del post
  if (isset($_FILES['edit_imgp']) && !empty($_FILES['edit_imgp']['name'])){
    //facoltativa
    if ($_FILES['edit_imgp']['error'] > 0 || $_FILES ['edit_imgp']['size'] > 2097152){  //problema della dimensione
      array_push($errors, "L'immagine scelta è troppo grande.");
    } else{
      $imgname = $_FILES['edit_imgp']['name'];
      $tmp_name = $_FILES['edit_imgp']['tmp_name'];
      $imgname = rand(999,1000).date('YmdHis').$imgname;
      move_uploaded_file($tmp_name, 'postpics/'.$imgname);
    }
  }  else {
    $imgname = $before['url_immagine'];
  }
//query
  $edit = $db->prepare("UPDATE post SET titolo=?, testo=?, url_immagine=? WHERE id_post = ?");
  $edit->bind_param('sssi',$edit_titlep, $edit_text, $imgname,$post);
  $edit->execute();
  $edit->close();
  header("location: post.php?post=".$post);
}

//end
?>
