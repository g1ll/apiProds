<?php
require '.config.php';

global $connectionString,$drive;

if ($drive === 'mysql') {
    $connectionString = "mysql:host=$host;dbname=$name;**charset=utf8**";
} elseif ($drive === 'pgsql') {
    $connectionString = "pgsql:host=$host;port=5433;dbname=$name;";
}

function executeQuery($query, $parameters,$type=1) {
    global $connectionString,$user,$password;

    $connection = null;
    try {
        $preparedStatment = null;
        $connection = new PDO($connectionString, $user, $password);
        $connection->beginTransaction();
        $preparedStatment = $connection->prepare($query);

        bindValuesParameters($preparedStatment,$parameters);

        if ($preparedStatment->execute() == FALSE) {
            throw new PDOException($preparedStatment->errorCode());
        }

        $error = $preparedStatment->errorInfo();

        if ($error[2]) {
            $preparedStatment->debugDumpParams();
            throw new PDOException($preparedStatment->errorCode());
        } else {
            return $preparedStatment->fetchAll(($type==1)?PDO::FETCH_ASSOC:PDO::FETCH_NUM);
        }
    } catch (PDOException $exc) {
        if ((isset($connection)) && ($connection->inTransaction())) {
            $connection->rollBack();
        }
        if($preparedStatment)
            debugStatment($preparedStatment,$exc);
        else
            debug($exc);
    } finally {
        if (isset($connection)) {
            unset($connection);
        }
    }
}

function executeCommand($command, $parameters, $returnId = false) {
    global $connectionString,$user,$password;
    $connection = null;
    try {
        $connection = new PDO($connectionString, $user, $password);
        $connection->beginTransaction();
        $preparedStatment = $connection->prepare($command);
        bindValuesParameters($preparedStatment,$parameters);
        $preparedStatment->execute();
        $error = $preparedStatment->errorInfo();
        if ($error[2]) {
            throw new PDOException($preparedStatment->errorCode());
        }

        if ($returnId) {
            $ID = $connection->lastInsertId();
            $connection->commit();
            return $ID;
        } else {
            $connection->commit();
        }
        return $preparedStatment->rowCount();
    } catch (PDOException $exc) {
        if ((isset($connection)) && ($connection->inTransaction())) {
            $connection->rollBack();
        }
        debugStatment($preparedStatment,$exc);
    } finally {
        if (isset($connection)) {
            unset($connection);
        }
    }
}

function executeMultiCommands(array $commands, array $multi_parameters, $returnId = false) {
    global $connectionString,$user,$password;
    $connection = null;
    if(count($commands)!==count($multi_parameters)) {
        throw new Exception("Queries and Parameters does'nt match!");
    }elseif (isAssoc($commands)||isAssoc($multi_parameters)){
        throw new Exception("Queries and Parameters must be numeric arrays!");
    }
    try {
        $connection = new PDO($connectionString, $user, $password);
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
        if ($returnId) {
            $ID = $connection->lastInsertId();
            $connection->commit();
            return $ID;
        } else {
            $connection->commit();
        }
        return $preparedStatment->rowCount();
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
    debug("\n".$error->getMessage().' '.$error->getTraceAsString());
}