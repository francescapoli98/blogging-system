<?php
session_start();
// Creo la connessione al DataBase
include("db.php");
  // inizializzo le variabili
  $scadenza="";
  $numero="";
  $tipo="";
  $nominativo="";
  $errors = array();

  //controllo numero di carta
  if(!empty($_POST['carta'])) { //se è stato inserito un nuovo carattere nell'input del numero di carta
    $response = array();
    $carta = $_POST['carta'];
    if( strlen($carta) < 16 || strlen($carta) > 16 ) { //controllo numero di cifre
          $response['status'] = false;
          $response['msg'] = 'Il numero deve essere composto da 16 cifre.';
      }  elseif(strlen($carta) == 16){
        $response['status'] = true;
        $response['msg'] = 'Numero carta accettato.';
      }
      echo json_encode($response);
   }




   //controllo numero CVV
   if(!empty($_POST['cvv'])) { //se è stato inserito un nuovo carattere nell'input del numero di carta
     $response = array();
     $cvv = $_POST['cvv'];
     if( strlen($cvv) < 3 || strlen($cvv) > 3 ) { //controllo numero di cifre
           $response['status'] = false;
           $response['msg'] = 'Il numero deve essere composto da 3 cifre.';
       }  elseif(strlen($cvv) == 3){
         $response['status'] = true;
         $response['msg'] = 'CVV accettato.';
       }
       echo json_encode($response);
    }





    if (isset($_POST['invia'])) {
        $scadenza = mysqli_real_escape_string($db, $_POST['scadenza']);

        $numero = $_POST["num_carta"];

        $tipo = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['tipo'] );
        $tipo = mysqli_real_escape_string($db, $tipo);
        $tipo = stripslashes($tipo);

        $nominativo = str_replace( array( "\r", "\r\n", "\n" ), ' ', $_POST['nominativo'] );
        $nominativo = mysqli_real_escape_string($db, $nominativo);
        $nominativo = stripslashes($nominativo);

        $cvv = $_POST["cvv"];

        settype($cvv,"integer");
        settype($numero,"integer");

//controllo sul numero di cifre prima di inserire nel db
        $numerolen = mb_strlen($numero);
        if($numerolen != 16){ array_push($errors, "Inserisci numero di 16 cifre per la carta.");  }
        $cvvlen = mb_strlen($cvv);
        if($cvvlen != 3){array_push($errors, "Inserisci numero di 3 cifre per il CVV.");}

        // validazione form: input vuoti
        if (empty($numero)) { array_push($errors, "Inserisci numero di 16 cifre della carta."); }
        if (empty($tipo)) { array_push($errors, "Inserisci il tipo (es. Visa)."); }
        if (empty($scadenza)) { array_push($errors, "Inserisci una data dal calendario."); }
        if (empty($nominativo)) { array_push($errors, "Inserisci il numero sul retro della carta."); }
           else { if(!preg_match("/^[a-zA-Z\s]+$/",$nominativo)){ array_push($errors, "Il nominativo può contenere solo caratteri numerici.");  }  }
        if (empty($cvv)) { array_push($errors, "Inserisci il CVV."); }

        // Se non ci sono errori nel form prendo gli ultimi metadati
        if (count($errors) == 0) {
          $utente = $_SESSION['id'];
          $startdate = date('Y-m-d H:i:s');
          $enddate = strtotime("+1 year", $startdate);

          //query
          $query_carta = $db ->prepare ("INSERT INTO carte(id_utente,scadenza,numero,tipo,nominativo,cvv ) VALUES (?,?,?,?,?,?)");
          $query_carta ->bind_param("issssi",$utente,$scadenza, $numero, $tipo, $nominativo, $cvv);
        	$query_carta -> execute();
          $query_carta -> close();

          $startdate = date('Y-m-d');
          $enddate = date('Y-m-d', strtotime(date("Y-m-d", strtotime($startdate)) . " + 1 year"));
          $carta = current($db->query("SELECT id_carta FROM carte WHERE id_utente='$utente'")->fetch_assoc());

          $query_premium = $db ->prepare ("INSERT INTO premium(id_utente,id_carta,data_inizio,data_fine) VALUES (?,?,?,?)");
          $query_premium ->bind_param("iiss", $utente, $carta, $startdate, $enddate);
          $query_premium-> execute();
          $query_premium -> close();

          header('location: premium.php?premium='.$db->insert_id);
    }
  }


?>
