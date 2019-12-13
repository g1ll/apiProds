<?php
global $host,$name,$user,$password,$drive,$view,$base_url;

$base_url = getBaseURL();
//var_dump($base_url);
//die;
$host="localhost";
$name="apiprod";
$user="root";
$password="";
//$password="r00t";
$drive="mysql";
//$drive="pgsql";

//echo $base_url;
//die;

//$view='view';
$view='view_vanilla';
//$view='view_react/build';

function getBaseURL(){
    $slash = '/';
    if(strpos($_SERVER['SERVER_SOFTWARE'],'Win'))
        $slash = '\\';
    $dir = explode($slash,__DIR__);
    $uri = explode('/',$_SERVER['REQUEST_URI']);
    array_shift($uri);
    $dir_name = array_pop($dir);
    $base_url='';
    foreach ($uri as $path) {
        if ($path !== $dir_name) {
            $base_url.= $slash . $path;
        } else {
            $base_url .= $slash . $dir_name;
            break;
        }
    }
    //var_dump($base_url);die;
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