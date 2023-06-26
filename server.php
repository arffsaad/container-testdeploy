<?php

chdir(__DIR__);
$queryString = $_SERVER['REQUEST_URI'];

if ($queryString == "/adminer") {
  include_once('adminer.php');
}

?>
