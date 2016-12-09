<?php
session_start();
include "include/settings.php"; 
include "include/mysql.php";
include "include/templates.php";

$core->check_gis();

// determin the action for what bubble to open
$data['buttons'] = $core->button_action();


// header
switch($_GET['section']) {
	case "download_waiver":
	$show_header = "off";
	break;

	default:
	$show_header = "on";
	break;
}

if ($show_header == "on") {
	$template = "header.tpl";
	$name = "$_SESSION[first] $_SESSION[last]";
	$data['name'] = $name;
	$data['lodge'] = $_SESSION['lodge'];
	$data['start_date'] = $_SESSION['start_date'];
	$data['nights'] = $_SESSION['nights'];
	$data['reservationID'] = $_SESSION['reservationID'];
	$core->load_smarty($data,$template);
}
// end header


if ($_GET['section'] == "gis") {
	$template = "home.tpl";
	$core->load_smarty($null,$template);
} else {
	$core->load_module($_GET['section']);
}


if ($show_header == "on") {
	$template = "footer.tpl";
	$data2['date'] = date("Y");
	$core->load_smarty($data2,$template);
}

//print "Test: GIS page under construction<br><br>";

//print "Section: $_GET[section]<br>ContactID: $_GET[contactID]<br>ReservationID: $_GET[reservationID]<br>
//BedID: $_GET[bedID]<br>GIS Password: $_GET[gisPW]<br>";

?>
