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
	 $outp1 .= '{"id":"'  . $rs["id"] . '",';
	 $outp1 .= '"title":"'  . $rs["title"] . '",';
	 $outp1 .= '"fromdate":"'  . $rs["fromdate"] . '",';
	$outp1 .= '"todate":"'. $rs["todate"]     . '"}'; 
}
if($rs["date"]!=null)
{
	if ($outp2 != "") {$outp2 .= ",";}
	 $outp2 .= '{"id":"'  . $rs["id"] . '",';
	 $outp2 .= '"title":"'  . $rs["title"] . '",';
	$outp2 .= '"date":"'. $rs["date"]     . '"}'; 
}
}
$outp1 ='{"Multiday":['.$outp1.']';
$outp2 ='"Singleday":['.$outp2.']}';
$conn->close();

echo($outp1.','.$outp2);
?>
