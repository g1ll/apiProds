<?php
require './model/model.php';

function getTotalRows(){
    return intval(executeQuery("SELECT count(*) as total FROM produtos",[])[0]['total']);
}

function getLastId(){
    return intval(executeQuery("SELECT id_prod as lastid FROM produtos ORDER BY id_prod DESC LIMIT 1",[])[0]['lastid']);
}

function getAllProdutos($id=null,$qtd=null,$desc=false){
    if(!$id&&!$qtd&&!$desc) {
        $query = "SELECT * FROM produtos";
        $par = [];
    }else {
        $query = "SELECT * FROM produtos WHERE id_prod>=:id ORDER BY id_prod";
        if ($id > 0) {
            if ($qtd)
                $query .= " LIMIT :qtd";
            if ($desc)
                $query = "SELECT * FROM ($query) as produtos ORDER BY id_prod DESC";
        } else {
            $id = ($id + 1) * -1;
            $query = "SELECT * FROM (SELECT * FROM produtos ORDER BY id_prod DESC LIMIT :qtd OFFSET :id) as produtos ORDER BY id_prod ASC";
            if ($desc)
                $query = "SELECT * FROM ($query) as produtos ORDER BY id_prod DESC";
        }
        $par = (isset($qtd) && isset($id)) ? [':id' => $id, ':qtd' => $qtd] : (($qtd) ? [':qtd' => $qtd] : [':id' => $id]);
    }
    return selectProdutos($query,$par);
}

function getProduto($id=null){
    if($id){
        $query = "SELECT * FROM produtos WHERE id_prod = :id";
        if((int)$id<0) {
            $id = ($id+1)*-1;
            $query = "SELECT * FROM (SELECT * FROM produtos ORDER BY id_prod DESC LIMIT 1 OFFSET :id) as produtos ORDER BY id_prod ASC";
        }
        return selectProdutos($query, [':id' => $id]);
    }else{
        return false;
    }
}

function searchInProdutos($name=null,$search=null){
    if($name&&($name==='nome'||$name==='descricao'||$name==='all')){
        $fields=($name==='all')?"nome LIKE ? OR descricao":$name;
        $query = "SELECT * FROM produtos WHERE $fields LIKE ? ORDER BY id_prod";
        $param = ($name==='all')?["%$search%","%$search%"]:["%$search%"];
        return selectProdutos($query,$param);
    }else{
        return false;
    }
}

function getDescontosProduto($id=null){
    if($id){
        $query = "SELECT d.descricao as descontos
                    FROM produtos as p INNER JOIN  prod_desc as pd ON p.id_prod = pd.id_prod
                    INNER JOIN descontos as d on pd.id_desc = d.id_desc
                    WHERE p.id_prod=:idprod order by d.id_desc";
        $result= executeQuery($query, [':idprod' => $id],2);
        $listDesc = [];
        foreach ($result as $desc){
            $listDesc[]=utf8_encode($desc[0]);
        }
        return $listDesc;
    }else{
        return false;
    }
}

function getItensExtrasProduto($id=null){
    if($id){
        $query = "SELECT e.descricao as itens_extras
FROM produtos as p INNER JOIN  prod_ext as pe ON p.id_prod = pe.id_prod
                   INNER JOIN extras as e on pe.id_ext = e.id_ext
WHERE p.id_prod= :idprod order by e.id_ext;";
        $result = executeQuery($query, [':idprod' => $id],2);
        $listItens = [];
        foreach ($result as $itens){
            $listItens[]=utf8_encode($itens[0]);
        }
        return $listItens;
    }else{
        return false;
    }
}

function insertProduto($produto,$returnLastId){
    global $drive;
    $command = "INSERT INTO produtos (nome, descricao, qtd_estoque, preco, importado) 
                VALUES (?,?,?,?,?)";

//    $param = array_filter($produto,
//        function($k){return $k!=='descontos'&&$k!=='itens';},
//        ARRAY_FILTER_USE_KEY);

    $param = [  $produto['nome'],
                $produto['descricao'],
                $produto['qtd_estoque'],
                $produto['preco'],
                $produto['importado']];
    if($returnLastId && $drive==='pgsql')$returnLastId = 'produtos_id_prod_seq';
    $result = executeCommand($command,$param,$returnLastId);
    if($result){
        return $result;
    }else{
        return false;
    }
}

function insertProdutosDesc($produto, $returnid = false){
    global $drive;
    $commands = [
        'INSERT INTO produtos (nome,descricao,qtd_estoque,preco,importado) VALUES (?,?,?,?,?)',
        ($drive==='mysql')?'SET @last_prod_id = LAST_INSERT_ID()':
            'SELECT pg_sequence_last_value(\'produtos_id_prod_seq\') as lastidprod LIMIT 1'
    ];
//    $params = [ array_filter($produto,
//        function($k){return $k!=='descontos'&&$k!=='itens';},
//        ARRAY_FILTER_USE_KEY), null ];

    $params = [ [$produto['nome'],
                $produto['descricao'],
                $produto['qtd_estoque'],
                $produto['preco'],
                $produto['importado']],[]];

    foreach ($produto['descontos'] as $desconto) {
        $sql = ($drive==='mysql')?
            'INSERT INTO prod_desc (id_prod,id_desc) VALUES(@last_prod_id,?)':
            'INSERT INTO prod_desc (id_prod,id_desc) SELECT pg_sequence_last_value(\'produtos_id_prod_seq\') as lastidprod , ? FROM produtos LIMIT 1';
            array_push($commands,$sql);
            array_push($params,[$desconto]);
    }
    if($returnid && $drive==='pgsql')
        $returnid='produtos_id_prod_seq';
    $result = executeMultiCommands($commands,$params,$returnid);
    if($result){
        return $result;
    }else{
        return false;
    }
}

function updateProduto($produto) {
//    debug($produto);
    $sql = "UPDATE produtos SET nome=?, descricao=?, qtd_estoque=?,
                    preco=?, importado=? WHERE id_prod=?";

    $params = [ $produto['nome'],
                $produto['descricao'],
                $produto['qtd_estoque'],
                $produto['preco'],
                $produto['importado'],
                $produto['id_prod']];

    if(executeCommand($sql, $params)){
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