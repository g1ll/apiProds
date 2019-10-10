<?php
session_start();
function login($param=null){
    $logged = false;
    if($_POST) {
        $user = filter_input(INPUT_POST,'user',FILTER_SANITIZE_STRING);
        $pass = filter_input(INPUT_POST,'key',FILTER_SANITIZE_STRING);
        if($user==='g1ll'&&$pass==='g1ll@dsw') { //TODO: tabela usuario
            $_SESSION['user'] = $user;
            $logged = true;
        }
    }else{
        if($_SERVER['REQUEST_METHOD']==='delete'||$param==='logout') {
            if (logout())
                $logged = false;
        }else{
            $logged = isset($_SESSION['user']);
        }
    }
    $logged = true;
    return ["login" => $logged];
}

function logout(){
    session_destroy();
    return ["logout" => true];
}

function isLogged(){
    return true;
    if(isset($_SESSION['user']))
        return true;
    else
        return false;
}