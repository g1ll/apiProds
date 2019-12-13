<?php
header('Content-Type: charset=UTF-8');
header('Access-Control-Allow-Headers: *');
header('Access-Control-Allow-Methods: *');
header('Access-Control-Allow-Origin: *');

$query = filter_input(INPUT_GET,'query');

//var_dump($query);
//die;

require './controller/controller.php';

route($query);