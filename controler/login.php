<?php
session_start();
function login($param=null){

    $logged = false;
    if($_POST) {
        $_SESSION['user'] = 'g1ll';
        $logged = true;
    }else{
        if($_SERVER['REQUEST_METHOD']==='delete'||$param==='logout')
            logout();
        else{
            $logged = isset($_SESSION['user']);
        }
    }
    return ["login" => $logged];
}

function logout(){
    session_destroy();
    return ["logout" => true];
}