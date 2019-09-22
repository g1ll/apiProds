<?php
require './model/model.php';

function getTotalRows(){
    return intval(executeQuery("SELECT count(*) as total FROM produtos",[])[0]['total']);
}

function getLastId(){
    return intval(executeQuery("SELECT id_prod as lastid FROM produtos ORDER BY id_prod DESC LIMIT 1",[])[0]['lastid']);
}

function getAllProdutos($id=null,$qtd=null,$desc=false){
    $lastid = getLastId()+1;
    if($id>0) {
        if ($qtd)
            $sql = "SELECT * FROM produtos WHERE id_prod>=:id ORDER BY id_prod ASC LIMIT :qtd";
        else
            $sql = "SELECT * FROM produtos WHERE id_prod>=:id ORDER BY id_prod";

        if ($desc)
            $sql = "SELECT * FROM ($sql) as produtos ORDER BY id_prod DESC";
    }else{
        $id = ($id+1)*-1;
        $sql = "SELECT * FROM (SELECT * FROM produtos ORDER BY id_prod DESC LIMIT :qtd OFFSET :id) as produtos ORDER BY id_prod ASC";
        if($desc)
            $sql = "SELECT * FROM ($sql) as produtos ORDER BY id_prod DESC";
    }
    $par = (isset($qtd)&&isset($id))?[':id'=>$id,':qtd'=>$qtd]: (($qtd)?[':qtd'=>$qtd]:[':id'=>$id]);
    return selectProdutos($sql,$par);
}

function getProduto($id=null){
    if($id){
        $sql = "SELECT * FROM produtos WHERE id_prod = :idprod";
        if((int)$id<0)
            $sql = "SELECT * FROM produtos WHERE id_prod = ".(getLastId()+1)."+:idprod";
//        debug($sql)
        return selectProdutos($sql, [':idprod' => $id]);
    }else{
        return [];
    }
}

function searchInProdutos($name=null,$search=null){
    //debug($search);
        if($name&&($name==='nome'||$name==='descricao'||$name==='all')){
            $fields=($name==='all')?"nome LIKE ? OR descricao":$name;
            $sql = "SELECT * FROM produtos WHERE $fields LIKE ? ORDER BY id_prod DESC Limit 10";
            $par = ($name==='all')?["%$search%","%$search%"]:["%$search%"];
            return selectProdutos($sql,$par);
        }else{
            return [];
        }
}

function getDescontosProduto($id=null){
    if($id){
        $sql = "SELECT d.descricao as descontos
FROM produtos as p INNER JOIN  prod_desc as pd ON p.id_prod = pd.id_prod
                   INNER JOIN descontos as d on pd.id_desc = d.id_desc
                   WHERE p.id_prod=:idprod order by d.id_desc";
        $result= executeQuery($sql, [':idprod' => $id],2);
        $listDesc = [];
        foreach ($result as $desc){
            $listDesc[]=utf8_encode($desc[0]);
        }
        return $listDesc;
    }else{
        return [];
    }
}

function getItensExtrasProduto($id=null){
    if($id){
        $sql = "SELECT e.descricao as itens_extras
FROM produtos as p INNER JOIN  prod_ext as pe ON p.id_prod = pe.id_prod
                   INNER JOIN extras as e on pe.id_ext = e.id_ext
WHERE p.id_prod= :idprod order by e.id_ext;";
        $result = executeQuery($sql, [':idprod' => $id],2);
        $listItens = [];
        foreach ($result as $itens){
            $listItens[]=utf8_encode($itens[0]);
        }
        return $listItens;
    }else{
        return [];
    }
}

function insertProduto($produto,$returnLastId){
    $sql = "INSERT INTO produtos (nome, descricao, qtd_estoque, preco, importado) 
            VALUES (:nome, :descricao,:qtd_estoque,:preco,:importado)";
    $params = [':nome'=>$produto['nome'],
                ':descricao'=>$produto['descricao'],
                ':qtd_estoque'=>$produto['qtd_estoque'],
                ':preco'=>$produto['preco'],
                ':importado'=>$produto['importado']];
    $result = executeCommand($sql,$params,$returnLastId);
    if($result){
        return $result;
    }else{
        return false;
    }
}

function updateProduto($produto) {
//    debug($produto);
    $sql = "UPDATE produtos SET nome=:nome,descricao=:descricao,
                      qtd_estoque=:qtd_estoque,preco=:preco,importado=:importado";
    $sql .= " WHERE id_prod =:id_prod";
    $param = [':nome'=>$produto->nome,
        ':descricao'=>$produto->descricao,
        ':qtd_estoque'=>$produto->qtd_estoque,
        ':preco'=>$produto->preco,
        ':id_prod'=>$produto->id_prod,
        ':importado'=>$produto->importado];
    if(executeCommand($sql, $param)){
        return $produto;
    }else{
        return false;
    }
}

function deleteProduto($id){
    $sql = "DELETE FROM produtos WHERE id_prod = ?";
    if(executeCommand($sql,[$id])){
        return true;
    }else{
        return false;
    }
}

function selectProdutos($sql,$par){
    $result = executeQuery($sql, $par);
    $listProd = [];
    foreach ($result as $prod) {
        $prod['descontos'] = getDescontosProduto($prod['id_prod']);
        $prod['itens_extras'] = getItensExtrasProduto($prod['id_prod']);
        $listProd[]=$prod;
    }
    return $listProd;
}