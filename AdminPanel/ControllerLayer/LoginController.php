<?php 
	require_once("\..\DataLayer/DB.php");
	
	if($_SERVER["REQUEST_METHOD"] == "POST") {
				$myusername = $_POST["username"];	
				$password = $_POST["password"];
	}

	$db = new DB();
	$result = $db->getDataTable("SELECT * FROM `admins` WHERE username = '$myusername' and password = '$password'");

	if (! $result){
   		throw new My_Db_Exception('Database error: ' . mysql_error());
	}
		
	$username = null;
	if($result)
	{
		while($row = $result->fetch_assoc()) {
			$username = $row["username"];
		}
	}

	if($username != null){
		require_once("\..\PresentationLayer\AdminPage.php");
	}else{
		require_once("\..\index.php");
	}
?>