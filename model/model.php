<?php
require '.config.php';

global $connectionString;

if ($drive === 'mysql') {
    $connectionString = "mysql:host=$host;dbname=$name;**charset=utf8**";
} elseif ($drive === 'pgsql') {
    $connectionString = "pgsql:host=$host;dbname=$name;";
}

function executeQuery($sql, $parameters,$type=1) {
    global $connectionString,$user,$password;
    //echo $connectionString;
    $connection = null;
    try {
        $connection = new PDO($connectionString, $user, $password);
        $connection->beginTransaction();
        $preparedStatment = $connection->prepare($sql);
        if ($parameters != null) {
            foreach ($parameters as $key => $value) {
                if(is_int($value))
                    $preparedStatment->bindValue($key, $value,PDO::PARAM_INT);
                else $preparedStatment->bindValue($key, $value);
            }
        }


        if ($preparedStatment->execute() == FALSE) {
            throw new PDOException($preparedStatment->errorCode());
        }

        $error = $preparedStatment->errorInfo();

        if ($error[2]) {
            debug($preparedStatment->fetchAll());
            debug($preparedStatment->debugDumpParams());
            throw new PDOException($preparedStatment->errorCode());
        } else {
            return $preparedStatment->fetchAll(($type==1)?PDO::FETCH_ASSOC:PDO::FETCH_NUM);
        }
    } catch (PDOException $exc) {
        if ((isset($connection)) && ($connection->inTransaction())) {
            $connection->rollBack();
        }
        debug("\n".$exc->getMessage().' '.$exc->getTraceAsString());
    } finally {
        if (isset($connection)) {
            unset($connection);
        }
    }
}

function executeCommand($sql, $parameters, $returnId = false) {
    global $connectionString,$user,$password;
    $connection = null;
    try {
        $connection = new PDO($connectionString, $user, $password);
        $connection->beginTransaction();
        $preparedStatment = $connection->prepare($sql);
        if ($parameters != null) {
            foreach ($parameters as $key => $value) {
                $preparedStatment->bindValue($key, $value);
            }
        }
        $preparedStatment->execute();
        $error = $preparedStatment->errorInfo();
        if ($error[2]) {
            debug($preparedStatment->fetchAll());
            debug($preparedStatment->debugDumpParams());
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
        debug("\n".$exc->getMessage().' '.$exc->getTraceAsString());
    } finally {
        if (isset($connection)) {
            unset($connection);
        }
    }
}