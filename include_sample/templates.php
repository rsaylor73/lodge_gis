<?php
/* -----------------------------------------
// This file controls the actions of the template class
// Version 1.00
// Author: Robert Saylor
// robert@customphpdesign.com
*/


// This is PHP Smarty
require_once($GLOBAL['path'] .'/libs/Smarty.class.php');
$smarty=new Smarty();

$smarty->setTemplateDir($GLOBAL['path'] . '/templates/');
$smarty->setCompileDir($GLOBAL['path'] . '/templates_c/');
$smarty->setConfigDir($GLOBAL['path'] . '/configs/');
$smarty->setCacheDir($GLOBAL['path'] . '/cache/');

// init the core class (custom code)
include $GLOBAL['path']."/class/core.class.php";


$core = new Core($linkID);

?>
