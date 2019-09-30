<?php
require './model/produtoDAO.php';

function upd_produto($newprod=null){
    if($newprod){
        $produto = updateProduto((array)$newprod);
        if($produto)
            return ["confirm"=>true,"msg"=>'Produto atualizado!',"produto"=>$produto];
        else
            return ["confirm"=>false,"msg"=>'Falha ao executar tarefa no banco',"produto"=>$produto];
    }else{
        return ["confirm"=>false,"msg"=>'Erro ao receber parametros',"produto"=>$_POST];
    }
}

function del_produto($data=null){
    $id = ($data)?$data->id_prod:$data;
    if(filter_var($id, FILTER_VALIDATE_INT)) {
        $id = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
        if(deleteProduto(intval($id))){
            return ["confirm"=>true,"msg"=>"DELETE PROD ID: $id"];
        }else {
            return ["confirm"=>false,"msg"=>"ERRO AO DELETAR PRODUTO ID: $id"];
        }
    }else{
        return ["confirm"=>false,"msg"=>"ERRO AO DELETAR PARAMETRO INVALIDO: $id"];
    }
}

function get_produto($id = null,$qtd=null,$desc=false){
    $data = [];
    if($id&&$qtd||(int)$id==0){
        if(intval($id)&&intval($qtd)) {
            $data = getAllProdutos(intval($id), intval($qtd), $desc);
        }else{
            $name=$id;
            $search = $qtd;
            $data=searchInProdutos($name,$search);
        }
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
            'qtd_estoque'=>intval(filter_input(INPUT_POST,'qtd_estoque',FILTER_SANITIZE_NUMBER_INT)),
            'preco'=>floatval(filter_input(INPUT_POST,'preco',FILTER_SANITIZE_NUMBER_FLOAT,FILTER_FLAG_ALLOW_FRACTION)),
            'importado'=>filter_input(INPUT_POST,'importado',FILTER_SANITIZE_NUMBER_INT),
            'descontos'=>filter_input(INPUT_POST,'desco',FILTER_SANITIZE_NUMBER_INT,FILTER_FORCE_ARRAY),
            'itens'=>filter_input(INPUT_POST,'itens',FILTER_SANITIZE_STRING,FILTER_FORCE_ARRAY)
        ];
//        debug($produto);
        $valida = true;
//        foreach ($produto as $item)
//            if(!$item)$valida = false;
//
//        $produto['descontos'] = [2,4];
//        debug($produto);
        if($valida) {
            if (is_array($produto['descontos'])){
                $produto['id_prod'] = insertProdutosDesc($produto);
            }else{
                $produto['id_prod'] = insertProduto($produto, true);
            }
            if ($produto['id_prod'])
                return ["confirm" => true, "msg" => 'Produto adicionado', "produto" => $produto];
            else
                return ["confirm" => false, "msg" => 'Falha ao executar tarefa no banco', "produto" => $produto];
        }else{
            return ["confirm" => false, "msg" => 'Erro: Parametros insuficientes!', "produto" => $produto];
        }
    }else{
        return ["confirm"=>false,"msg"=>'Erro ao receber parametros',"produto"=>$_POST];
    }
}