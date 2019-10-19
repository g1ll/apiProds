<?php
global $host,$name,$user,$password,$drive,$view,$base_url;

$base_url = getBaseURL();

$host="localhost";
$name="apiprod";
$user="root";
$password="r00t";
$drive="mysql";
//$drive="pgsql";

//$view='view';
//$view='view_vanilla';
$view='view_react/build';

function getBaseURL(){
    $dir = explode('/',__DIR__);
    $uri = explode('/',$_SERVER['REQUEST_URI']);
    array_shift($uri);
    $dir_name = array_pop($dir);
    $base_url = '';
    foreach ($uri as $path) {
        if ($path !== $dir_name) {
            $base_url .= '/' . $path;
        } else {
            $base_url .= '/' . $dir_name;
            break;
        }
    }
    return $base_url;
}

/**
 * TESTANDO A API COM CURL
 *  GET
 *     curl -X GET http://localhost/2019/tsi/dsw/apiProds/produto/55; echo "\n"
 *
 *  POST
 *    curl -X POST http://localhost/2019/tsi/dsw/apiProds/produto/clear -d id_prod=10; echo "\n"
 *
 *  PUT
 *    curl -H 'Accept: application/json' -X PUT  -d '{"id_prod":10}' http://localhost/2019/tsi/dsw/apiProds/produto/clear; echo "\n"
 *
 *  DELETE
 *   curl -H 'Accept: application/json' -X DELETE -d '{"id_prod":10}' http://localhost/2019/tsi/dsw/apiProds/produto/clear; echo "\n"
 *
 *
 */