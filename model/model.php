<?php
require '.config.php';
global $user,$password,$drive,$host,$name;

function connect(){
    global $user,$password,$drive,$host,$name;
    try{
        if ($drive === 'mysql') {
            $connectionString = "mysql:host=$host;dbname=$name;**charset=utf8**";
        } elseif ($drive === 'pgsql') {
            $connectionString = "pgsql:host=$host;port=5433;dbname=$name;";
        }
        return new PDO($connectionString, $user, $password);
    }catch (PDOException $exc) {
            debug($exc);
            return false;
    }
}

function executeQuery($query, $parameters,$type=1) {
    $preparedStatment = null;
    try {
        $preparedStatment = connect()->prepare($query);
        bindValuesParameters($preparedStatment,$parameters);

        if ($preparedStatment->execute() === FALSE) {
            throw new PDOException($preparedStatment->errorCode());
        }

        $error = $preparedStatment->errorInfo();

        if ($error[2])
            throw new PDOException($preparedStatment->errorCode());
        else
            return $preparedStatment->fetchAll(($type==1)?PDO::FETCH_ASSOC:PDO::FETCH_NUM);

    } catch (PDOException $exc) {
        if($preparedStatment)
            debugStatment($preparedStatment,$exc);
        else debug($exc);
    } finally {
        if (isset($connection)) {
            unset($connection);
        }
    }
}

function executeCommand($command, $parameters, $sequence = null) {
    global $drive;
    try {
        $preparedStatment = null;
        $connection  = connect();
        $preparedStatment = $connection->prepare($command);
        bindValuesParameters($preparedStatment,$parameters);
        $preparedStatment->execute();
        if (isset($sequence)) {
            $ID = $connection->lastInsertId(($drive==='pgsql')?$sequence:null);
            if(!$ID&&$drive==='pgsql')
               return -1;
            else return $ID;
        }else{
            return $preparedStatment->rowCount();
        }
    } catch (PDOException $exc) {
        debugStatment($preparedStatment,$exc);
        return false;
    } finally {
        if (isset($connection)) {
            unset($connection);
        }
    }
}

function executeMultiCommands(array $commands, array $multi_parameters, $sequence = null) {
    global $drive;
    $connection = null;
    //debug([$commands,$multi_parameters]);
    if(count($commands)!==count($multi_parameters)) {
        throw new Exception("Queries and Parameters does'nt match!");
    }elseif (isAssoc($commands)||isAssoc($multi_parameters)){
        throw new Exception("Queries and Parameters must be numeric arrays!");
    }
    try {
        $connection  = connect();
        $connection->beginTransaction();
        foreach ($commands as $index=>$sql) {
            if($multi_parameters[$index]) {
                $preparedStatment = $connection->prepare($sql, $multi_parameters);
                bindValuesParameters($preparedStatment, $multi_parameters[$index]);
            }else{
                $preparedStatment = $connection->prepare($sql);
            }
            $preparedStatment->execute();
            $error = $preparedStatment->errorInfo();
            if ($error[2]||$error[0]!=='00000') {
                throw new PDOException($preparedStatment->errorCode());
            }
        }
        if (isset($sequence)) {
            $ID = $connection->lastInsertId(($drive==='pgsql')?$sequence:null);
            if($ID){
                $connection->commit();
                return $ID;
            }else{
                $connection->commit();
                return -1;
            }
        } else {
            $connection->commit();
            return $preparedStatment->rowCount();
        }
    } catch (PDOException $exc) {
        if ((isset($connection)) && ($connection->inTransaction())) {
            $connection->rollBack();
        }
        debugStatment($preparedStatment,$exc);
        return false;
    } finally {
        if (isset($connection)) {
            unset($connection);
        }
    }
}

function bindValuesParameters(&$stm,$par){
    if($par){
        if(array_diff_key($par,array_keys(array_keys($par)))){
            foreach ($par as $key => $value) {
                $type = (is_int($value))?PDO::PARAM_INT:PDO::PARAM_STR;
                $stm->bindValue($key, $value,$type);
            }
        }
        else{
            foreach ($par as $key => $value) {
                $type = (is_int($value))?PDO::PARAM_INT:PDO::PARAM_STR;
                $stm->bindValue($key+1, $value,$type);
            }
        }
    }
}

function debugStatment(PDOStatement $stm,PDOException $error){
    var_dump($stm->errorInfo());
    var_dump($stm);
    var_dump($stm->fetchAll());
    $stm->debugDumpParams();
    debug("\n".$error->getMessage()."\n".$error->getTraceAsString());
}