<?php
require './model/model.php';

function getTotalRows(){
    return intval(executeQuery("SELECT count(*) as total FROM produtos",[])[0]['total']);
}

function getAllProdutos($id=null,$qtd=null,$desc=false){
    $totalRows = getTotalRows()+1;
    $sql = "SELECT * FROM produtos";
    if($id!=0)
        $sql.=($id>0)?" WHERE id_prod".(($desc)?" >= :id && id_prod < (:id+:qtd) ":" >= :id")
            :" WHERE id_prod".(($desc)?" >= $totalRows +:id &&
             id_prod < ($totalRows +:id+:qtd) ":" >= $totalRows + :id");
    $sql.=" ORDER BY id_prod ".(($desc)?"DESC ":"");
    $sql.=($qtd)?" LIMIT :qtd ":'';
    $par = ($qtd&&$id)?[':id'=>$id,':qtd'=>$qtd]: (($qtd)?[':qtd'=>$qtd]:[]);
    $result = executeQuery($sql, $par);
    $listProd = [];
    foreach ($result as $prod) {
        $prod['descontos'] = getDescontosProduto($prod['id_prod']);
        $prod['itens_extras'] = getItensExtrasProduto($prod['id_prod']);
        $listProd[]=$prod;
    }
    return $listProd;
}

function getProduto($id=null){
    if($id){
        $sql = "SELECT * FROM produtos WHERE id_prod = :idprod";
        if((int)$id<0)
            $sql = "SELECT * FROM produtos WHERE id_prod = ".(getTotalRows()+1)."+:idprod";
//        debug($sql);
        $prod = executeQuery($sql, [':idprod' => $id]);
        if($prod){
            //debug($prod);
            $prod[0]['descontos'] = getDescontosProduto($prod[0]['id_prod']);
            $prod[0]['itens_extra'] = getItensExtrasProduto($prod[0]['id_prod']);
            return $prod;
        }
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
    $sql = "INSERT INTO `produtos` (`nome`, `descricao`, `qtd_estoque`, `preco`, `importado`) 
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
    $sql = "UPDATE `produtos` SET nome=:nome,descricao=:descricao,
                      qtd_estoque=:qtd_estoque,preco=:preco,importado=:importado";
    $sql .= " WHERE id_prod =:id_prod";
    $param = [':nome'=>$produto['nome']];
    if($this->ExecuteCommand($sql, $param)){
        return true;
    }else{
        return false;
    }
}