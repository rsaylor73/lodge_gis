<?php

$GLOBAL['path'] = "/home/path/to/folder";
$GLOBAL['domain'] = "https://www.yourname.com/";
define ('PATH',$GLOBAL['path']);

// email headers - This is fine tuned, please do not modify
$sitename = "Site Name";
$site_email = "info@yourname.com";

$header = "MIME-Version: 1.0\r\n";
$header .= "Content-type: text/html; charset=iso-8859-1\r\n";
$header .= "From: $sitename <$site_email>\r\n";
$header .= "Reply-To: $sitename <$site_email>\r\n";
$header .= "X-Priority: 3\r\n";
$header .= "X-Mailer: PHP/" . phpversion()."\r\n";
define('header_email',$header);

// Total number of steps:
define('MAXSTEPS','9');
?>
