<?php
header('Content-Type: charset=UTF-8');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Origin: *');

$query = filter_input(INPUT_GET,'query');
//if(!$query) {
//    $query = $_SERVER['REQUEST_URI'];
//    $cut = "/";
//    $query = substr($query,strpos($query, $cut)+strlen($cut),strlen($query)-strlen($cut));
//}


require './controler/controler.php';

route($query);