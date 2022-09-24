<?php 
include_once("dbconnect.php");

if (isset($_POST["playerName"]))
{
	$playerName = $_POST["playerName"];
	// Perform query
	if ($result = $mysqli -> query("SELECT * FROM players WHERE playerName='$playerName'"))
	{
	  $rowCount =  $result -> num_rows;
	  // Free result set
	  
	}
	if ($rowCount == 0) { // evaluate the count
		 $_SESSION['playerName'] = false;
		 $output = array('msg'=>'Registering new player', 'loggedin'=>'false');
	}

	if ($rowCount > 0) {
	    while($row = $result -> fetch_row()){ 
             $player = $row["playerName"];
			 
        }
    $_SESSION['playerName'] = $player;
		$output = array("msg"=>"Hello $player! ", "loggedin"=>"true");
    } 
	echo json_encode($output);

	$result -> free_result();
}
 ?>

