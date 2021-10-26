<?php
	// connect to the database
include("db.php");

	if (isset($_POST['liked'])) {
		$commid = $_POST['idcomm'];
		$result = mysqli_query($db, "SELECT * FROM commenti WHERE id_commenti=$commid");
		$row = mysqli_fetch_array($result);
		$n = $row['valutazione'];

		mysqli_query($db, "UPDATE commenti SET valutazione=$n+1 WHERE id_commenti=$commid");

		echo json_encode($n+1);
	}


  if (isset($_POST['like'])) {
		$postid = $_POST['idpost'];
		$result = mysqli_query($db, "SELECT * FROM post WHERE id_post=$postid");
		$row = mysqli_fetch_array($result);
		$n = $row['valutazione'];

		mysqli_query($db, "UPDATE post SET valutazione=$n+1 WHERE id_post=$postid");

		echo json_encode($n+1);
	}

?>
