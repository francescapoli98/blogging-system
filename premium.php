<?php include('carte_script.php');?>
<?php include_once 'incipit.php';?>
<?php include_once 'header.php';?>

<div class="container">
  <h1 class="display-4">Benvenuto in Premium!</h1>
</br>
<h4 class="lead">I tuoi dati: </h4>
<?php $user = $_SESSION['id'];
$result = mysqli_query($db, "SELECT * FROM carte, premium WHERE (premium.id_utente=$user AND carte.id_carta = premium.id_carta)" );
$card = mysqli_fetch_array($result);
?>
<ul>
  <li>Nominativo: <span class="prof"><?=$card['nominativo'];?></span></li>
  <li>Numero carta: <span class="prof"><?=$card['numero'];?></span></li>
  <li>Tipologia di carta: <span class="prof"><?=$card['tipo'];?></span></li>
  <li> Data di scadenza della carta: <span class="prof"><?=$card['scadenza'];?></span></li>
  <li>CVV: <span class="prof"><?=$card['cvv'];?></span></li>
  <li>Data inizio abbonamento: <span class="prof"><?=$card['data_inizio'];?></span></li>
  <li>Data fine abbonamento: <span class="prof"><?=$card['data_fine'];?></span></li>
</ul>
</div>
<?php include_once 'footer.php';?>
