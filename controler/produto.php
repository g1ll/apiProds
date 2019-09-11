<?php
require './model/produtoDAO.php';

function upd_produto($data=null){
    return ["confirm"=>true,"msg"=>"PROD ID: $data->id_prod EDITADO","produto"=>$data];
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

function get_produto($id = null,$qtd=null,$desc=false){

    if($id&&$qtd||(int)$id==0){
        $data  = getAllProdutos(intval($id),intval($qtd),$desc);
    }else {
        $data = getProduto($id);
    }
    return $data;
}

function add_produto(){
    if($_POST){
        $produto=[
            'nome'=>filter_input(INPUT_POST,'nome',FILTER_SANITIZE_STRING),
            'descricao'=>filter_input(INPUT_POST,'descricao',FILTER_SANITIZE_STRING),
            'qtd_estoque'=>filter_input(INPUT_POST,'qtd_estoque',FILTER_SANITIZE_NUMBER_INT),
            'preco'=>filter_input(INPUT_POST,'preco',FILTER_SANITIZE_NUMBER_FLOAT,FILTER_FLAG_ALLOW_FRACTION),
            'importado'=>filter_input(INPUT_POST,'importado',FILTER_SANITIZE_NUMBER_INT),
            'descontos'=>filter_input(INPUT_POST,'desco'),
            'itens'=>filter_input(INPUT_POST,'itens')
        ];

        $produto['id_prod'] = insertProduto($produto,true);
        if($produto['id_prod'])
            return ["confirm"=>true,"msg"=>'Produto adicionado',"produto"=>$produto];
        else
            return ["confirm"=>true,"msg"=>'falha ao executar tarefa no banco',"produto"=>$produto];
    }else{
        return ["confirm"=>false,"msg"=>'Erro ao receber parametros',"produto"=>$_POST];
    }

}