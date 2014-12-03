<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 5px;
    text-align: left;    
}
</style>
</head>
<body>
<form method="post" >
	<select name="selection">
		<option value="option1">Show Password of Entered user (admin only function): </option>
		<option value="option2">Show all food without an allergy: </option>
		<option value="option3">Update User Password</option>
		<option value="option4">Update Medication Information</option>
		<option value="option5">Show personal user medication</option>
		<option value="option6">Quit (press submit) </option>
	</select>
<input type="text" name="textinput"></input>
<input type="text" name="textinput2"></input>
<input type="submit" name="button" value="go"></input>
</form>


<?php
$servername = "localhost";
$username = "root";
$password = "password";
$dbname = "user";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
     die("Connection failed: " . $conn->connect_error);
} 
$input = $_POST["textinput"];
$stuff = $_POST["textinput2"];
$select = $_POST["selection"];


$sql = "SELECT User_password FROM userinformation WHERE Name_first = '" .$input. "' AND Name_Last = '" .$stuff. "'";
$sql2 = "SELECT DISTINCT food_name, store_price, store_location FROM allergy NATURAL JOIN foodallergy NATURAL JOIN userallergy NATURAL JOIN foodproduct NATURAL JOIN foodstore NATURAL JOIN grocerystore WHERE Allergy_name !=' " .$input. " ' AND store_name = ( SELECT store_name FROM grocerystore WHERE store_ID = " .$stuff. " )";
$sql3 = "UPDATE userinformation SET User_password = '" .$stuff. "' WHERE User_password = '".$input."'";
$sql4=  "UPDATE usermedication SET medication_ID=" .$input. ", doseage = '10ml', doseage_instructions = 'Only when needed' WHERE medication_ID = " .$stuff. "";
$sql5 = "SELECT * FROM user.personal_user_view WHERE User_ID =' " .$input. "'"; 
if(isset($_POST['button'])){

	if($select=='option1')
	{
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		// output data of each row
		while($row = $result->fetch_assoc()) {
			$message = "Your password is ". $row["User_password"] . " ";
			echo "<script type='text/javascript'>alert('$message');</script>";
		}
	} 
	else {echo "0 results";}
	}

	else if($select=='option2')
	{
	
	$result = $conn->query($sql2);
	if ($result->num_rows > 0) {
	
	echo "<table>";
  echo"<tr>";
  echo "<th>Food</th>";
  echo  "<th>Price</th>";
  echo "<th>Location</th>";
  echo "</tr>";
 
		// output data of each row
		while($row = $result->fetch_assoc()) {
			echo "<tr>";
			echo "<td>" . $row["food_name"] . "</td>";
			echo "<td>" . $row["store_price"] . "</td>";
			echo "<td>" . $row["store_location"] . "</td>";
			echo "</tr>";
		}
		 echo "</table>";
	} 
	else {echo "0 results";}
}
	else if($select=='option3')
	{
	
	echo "option 3";
	
	if ($conn->query($sql3) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}
}
	else if($select=='option4')
	{
	
	if ($conn->query($sql4) === TRUE) {
    echo "Record updated successfully";
} else {
    echo "Error updating record: " . $conn->error;
}
}

	
	else if($select=='option5')
	{
	
	$result = $conn->query($sql5);
	if ($result->num_rows > 0) {
	
	echo "<table>";
	echo"<tr>";
	echo "<th>User_ID</th>";
	echo "<th>Allergy_ID</th>";
	echo "<th>Risk</th>";
	echo "<th> medication_ID</th>"; 
	echo "<th> doseage </th>" ; 
	echo "<th> doseage_instructions </th>"; 
	echo "</tr>";
 
		// output data of each row
		while($row = $result->fetch_assoc()) {
			echo "<tr>";
			echo "<td>" . $row["User_ID"] . "</td>";
			echo "<td>" . $row["Allergy_ID"] . "</td>";
			echo "<td>" . $row["Risk"] . "</td>";
			echo "<td>" . $row["medication_ID"] . "</td>";
			echo "<td>" . $row["doseage"] . "</td>";
			echo "<td>" . $row["doseage_instructions"] . "</td>";
			echo "</tr>";
		}
		 echo "</table>";
	} 
	else {echo "0 results";}
}

	else if($select=='option6')
	{
	$message = "User click Quit Application will simulate a quit function by refreshing";
	echo "<script type='text/javascript'>alert('$message');</script>";
	sleep(2);
	exit("good bye");
}

}

$conn->close();
?>  

</body>
</html>
