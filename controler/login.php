<?php
session_start();
function login($param=null){
    $logged = false;
    if($_POST) {
        $user = filter_input(INPUT_POST,'user',FILTER_SANITIZE_STRING);
        $pass = filter_input(INPUT_POST,'key',FILTER_SANITIZE_STRING);
        if($user==='g1ll'&&$pass==='g1ll@dsw') {
            $_SESSION['user'] = $user;
//        debug($_SESSION);
            $logged = true;
        }
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