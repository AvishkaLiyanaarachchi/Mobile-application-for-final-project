<?php
 
// Importing DatabaseConfig.php file.
include 'dbconnect.php';
 
// Creating MySQL Connection.
 //$con = mysqli_connect($HostName, $HostUser, $HostPass, $DatabaseName);
 $con = mysqli_connect(HOST,USER,PASSWORD,DATABASE);
 
 // Getting the received ID in JSON Format into $json variable.
 $json = file_get_contents('php://input');
 
 // Decoding the received JSON.
 $obj = json_decode($json,true);
 
 // Populate ID from JSON $obj array and store into $ID variable.
 $ID = $obj['timeTableId'];
 
 //Fetching the selected record as per ID.
 $CheckSQL = "SELECT * FROM railwaydb.tbl_timetable WHERE timeTableId='$ID'";
 
 $result = $con->query($CheckSQL);
 
if ($result->num_rows >0) {
 
 while($row[] = $result->fetch_assoc()) {
 
 $Item = $row;
 
 $json = json_encode($Item);
 
 }
 
}else {
	
 echo "No Results Found.";
 
}
 
echo $json;
 
$con->close();
?>