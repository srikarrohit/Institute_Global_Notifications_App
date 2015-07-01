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
	$outp1 .= '"allDay":false,';
	 $outp1 .= '"start":"'  . $rs["fromdate"] . 'T00:00:00.0+0100",';
	$outp1 .= '"end":"'. $rs["todate"]     . 'T23:59:59.0+0100"}'; 
}
if($rs["date"]!=null)
{
	if ($outp2 != "") {$outp2 .= ",";}
	 $outp2 .= '{"title":"'  . $rs["title"] . '",';
	 $outp2 .= '"id":"'  . $rs["id"] . '",';
//	$outp2 .= '"allDay":true,';
	$outp2 .= '"start":"'. $rs["date"]     . '"}'; 
}
}
$outp1 =$outp1;
$outp2 =$outp2;
$conn->close();

echo('jsonCallback({"events":['.$outp1.','.$outp2.']});');
?>
