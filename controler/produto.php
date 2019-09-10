<?php
require './model/produtoDAO.php';

function upd_produto($data=null){
    return ["confirm"=>true,"msg"=>"PROD ID: $data->id_prod EDITADO"];
}

function del_produto($data=null){
    $id = $data->id_prod;
    if(filter_var($id, FILTER_VALIDATE_INT)) {
        $id = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
        return ["confirm"=>true,"msg"=>"DELETE PROD ID: $id"];
    }else{
        return ["confirm"=>false,"msg"=>"ERRO AO DELETAR ID: $id"];
    }
}

function get_produto($id = null,$qtd=null){
    if(!$id||($id&&$qtd)){
        $offset = $id;
        $data  = getAllProdutos($offset,$qtd);
    }else {
        $data = getProduto($id);
    }
    return $data;
}

function add_produto(){
    return ["confirm"=>false,"msg"=>'falha ao conectar no banco!',"data"=>$_POST];
}