<?php
include_once("dbconnect.php");

if (isset($_POST['regusername'])) {
	$username = $_POST['regusername'];
	$sql = "INSERT INTO players (playerName,totalScore) VALUES ($username,0)";
	if ($mysqli->query($sql) === TRUE) {
	    echo "New record created successfully";
	    $_SESSION['playerName'] = $username;	
	
		$output = array("msg"=>"Hello $username! You are now registered! and loggedin", "loggedin"=>"true");
	echo json_encode($output);
	} else {
	    echo "Error: " . $sql . "<br>" . $mysqli->error;
	    echo json_encode("error");
	}
	
}
?>