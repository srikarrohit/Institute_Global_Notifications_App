<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$conn = new mysqli("localhost", "root", "ragasree", "notification_development");

$result = $conn->query("SELECT * FROM posts");
$outp1 = "";
$outp2 = "";
while($rs = $result->fetch_array(MYSQLI_ASSOC)) { 
if($rs["fromdate"]!=null && $rs["todate"]!=null)
{
	if ($outp1 != "") {$outp1 .= ",";}
	 $outp1 .= '{"title":"'  . $rs["title"] . '",';
	 $outp1 .= '"id":"'  . $rs["id"] . '",';
	 $outp1 .= '"start":"'  . $rs["fromdate"] . '",';
	$outp1 .= '"end":"'. $rs["todate"]     . '"}'; 
}

}
$outp1 =$outp1;
$outp2 =$outp2;
$conn->close();

echo('jsonCallback({"events":['.$outp1.']});');
?>
