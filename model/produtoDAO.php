<?php
require './model/model.php';

function getAllProdutos($offset=null,$qtd=null){

    $sql = "SELECT * FROM produtos ORDER BY id_prod ASC";
    $sql.=(($qtd&&$offset)?" LIMIT :offset, :qtd ":(($qtd)?" LIMIT :qtd ":''));
    $par = ($qtd&&$offset)?[':offset'=>intval($offset-1),':qtd'=>intval($qtd)]:
        (($qtd)?[':qtd'=>intval($qtd)]:[]);

    $result = executeQuery($sql, ($par)?$par:[]);
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
                   INNER JOIN descontos d on pd.id_desc = d.id_desc
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
                   INNER JOIN extras e on pe.id_ext = e.id_ext
WHERE p.id_prod=1 order by e.id_ext;";
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