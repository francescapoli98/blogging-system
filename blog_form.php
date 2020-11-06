<script>
//SUGGERIMENTO AUTOMATICO DI USERNAMES
$(document).ready(function(){
 $("#coauthor").keyup(function(){
   $("#coauthors").empty();
    var name = $(this).val();
    if (name != ""){
      //ajax
      $.post("check_user.php", //pagina richiamata
        {"name":name}, //data:
        function(data){ //success:
          if (data != "False"){
            $("#coauthors").append(data);
            $(".choose").css("cursor","pointer");
            $(".choose").on('click', function(){
              $("#coauthor").val(this.value);
              $("#coauthors").empty();
            });
          }
        },
    'json');
  }; //chiusura if(string !empty)
   }); //chiusura keyup
 });
</script>

<h4 class="display-4"> Il tuo blog, easy. </h4>
<!-- inizio form -->
<form action="" method="POST" enctype="multipart/form-data">
  <?php include('errors.php');?>
  <!--TITOLO-->
  <div class="form-group row">
    <div class="col-sm-6 text-right">
      <h6>Titolo del blog:</h6>
    </div>
    <div class="col-sm-6">
      <input type="text" class="form-control" name="blog_title" id="blog_title">
      <p><small>Il titolo di ogni blog è unico, un titolo uguale a quello di un blog già esistente non sarà salvato.</small></p>

    </div>
  </div>
<!--IMMAGINE-->
   <div class="form-group row">
     <div class="col-sm-6 text-right">
       <h6>Immagine del blog:</h6>
     </div>
     <div class="col-sm-6">
       <input type="file" class="form-control-file" name="blog_img" />
     </div>
   </div>
<!--CATEGORIA-->
   <div class="form-group row">
     <div class="col-sm-6 text-right">
       <h6>Scegli una categoria:</h6>
     </div>
     <div class="col-sm-6">
       <select id="select_cat" class="form-control" name="category">
         <?php
         $query = $db -> query("SELECT * FROM categorie");
         while($cat = mysqli_fetch_array($query)){
           echo '<option value="'.$cat['id_categoria'].'">'.$cat['descrizione'].'</option>';
                   }
         ?>
         <option id="new_cat" value="new">Aggiungi categoria</option>
       </select>
         <p><small>Nell'aggiunta di una nuova categoria: se non sono presenti solo caratteri alfabetici, o se la categoria è già esistente, non sarà salvata.</small></p>
     </div>
   </div>
<!--DESCRIZIONE-->
   <div class="form-group row">
     <div class="col-sm-6 text-right">
       <h6>Descrivi brevemente il blog:</h6>
     </div>
     <div class="col-sm-6">
       <textarea class="form-control" name="description" rows="3" columns ="20"></textarea>
     </div>
   </div>
<!--SFONDO-->
   <div class="form-group row">
     <div class="col-sm-6 text-right">
       <h6>Scegli un colore per lo sfondo</h6>
     </div>
     <div class="col-sm-6">
       <select id="select_wall" class="form-control" name="sfondo">
         <?php
         $query = $db -> query("SELECT * FROM colori");
         while($color = mysqli_fetch_array($query)){
           echo '<option value="'.$color['id_colore'].'" style="color:'.$color['codice_html'].'"> <div class="colors" style="background-color:'.$color['codice_html'].';"></div>'.$color['nome_colore'].'</option>';
                   }
         ?>
       </select>
     </div>
   </div>
<!--CORNICE-->
   <div class="form-group row">
     <div class="col-sm-6 text-right">
       <h6>Scegli uno stile per la cornice del blog</h6>
     </div>
     <div class="col-sm-6">
       <select id="cornice" class="form-control" name="cornice">
         <?php
         $query = $db -> query("SELECT * FROM stili");
         while($style = mysqli_fetch_array($query)){
           echo '<option value="'.$style['id_stile'].'"> '.$style['nome_stile'].' </option>';
                   }
         ?>
       </select>
     </div>
   </div>

   <!-- COAUTORE (solo per Premium)-->
<?php $query = mysqli_query($db,"SELECT id_utente FROM premium WHERE premium.id_utente = $userid");
if (mysqli_num_rows($query) > 0):?>
<br/><br/>
   <div class="form-group row">
     <div class="col-sm-6 text-right">
      <h6> Vuoi condividere i privilegi sul tuo blog con un altro utente Premium? </h6>
    </div>
    <div class="col-sm-6">
      <input type="text" placeholder="Coautore" name="coauthor" id="coauthor" class="form-control">
      <div id="coauthors"></div>
    </div>
   </div>
<?php endif?>
<!-- BOTTONE PER CREARE IL BLOG-->
   <div class="form-group row">
     <div class="col-sm-6 text-right">
       <input type="submit" class="btn btn-info ss" name="crea" value="Crea"/>
     </div>
   </div>

   <!--dialog per inserire una nuova categoria nel db-->
   <div id="dialog_form_cat" title="Nuova categoria">
     <!--form di aggiunta-->
     <form>
       <label>Aggiungi:</label>
       <input id="desc_new_cat" type="text" name="descrizione"/>
       <button id ="add_cat" name="add">Ok</button>
     </form>
     <!--fine form di aggiunta-->
   </div>
 </form>
