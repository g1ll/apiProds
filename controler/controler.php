<?php
require 'config.php';

function router($query=null){

    $method = strtolower($_SERVER['REQUEST_METHOD']);
    $params = explode('/',$query);
    //debug($params);
    $controler = $params[0];
    $file_controler= './controler/'.$controler.'.php';

    if(file_exists($file_controler) && $controler!=='controler'
        &&$controler!=='view'&&$controler!=='model') {

        require_once $file_controler;

        switch ($method) {
            case 'put':
                $action = "upd_$controler";
                break;
            case 'delete':
                $action = "del_$controler";
                break;
            case 'get':
                $action = "get_$controler";
                break;
            case 'post':
                $action = "add_$controler";
                break;
            default:
                $action=null;
        }

        if($action && $method==='get')
            if (sizeof($params) == 2) $action($params[1]);
            elseif (sizeof($params) == 3) $action($params[1], $params[2]);
            elseif (sizeof($params) == 4) $action($params[1], $params[2], $params[3]);
            else $action();
        elseif($action)
            if($method==='put'||$method==='delete'){
                $action(json_decode(file_get_contents("php://input")));
            } else{$action();}
        else debug("ERROR ACTION REQUEST");

    }else{
        header('Content-Type: text/html');
        if (file_exists("view/$params[0].html")){
            header("Location:view/$params[0].html");
            //include 'view/'.$params[0].'.php';
            //die;
        }else{
            pageNotFound();
        }
    }
}

function pageNotFound(){
    global $base_url;
    header("Location:http://$_SERVER[HTTP_HOST]$base_url/view/404.html");
    die;
}

function debugJSON($var){
    sendjson($var);
    throw  new Exception("Testado!!!!");
}

function debug($var){
    echo '<pre>';
    error_reporting( E_ALL );
    throw  new Exception("Debugando:\n########\nVAR:\n".
        debug_vardump_backtrace($var).'\n');
    echo '</pre>';
    die;
}

function debug_vardump_backtrace($var) {
    ob_start();
    var_dump($var);
    debug_print_backtrace();
    $trace = ob_get_contents();
    ob_end_clean();
    return $trace;
}

function sendjson($var){
    header('Content-Type: application/json');
    echo json_encode($var);
}