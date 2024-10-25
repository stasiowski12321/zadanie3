<?php

namespace Mirjan24\OpTask\Classes;

use PDO;
use PDOException;

class Db {

    private $host = "localhost";
    private $databaseName = "users";
    private $username = "root";
    private $password = "";
    private $conn;
    private static $instance = null;

    private function __construct()  
    {
        $dsn = "mysql:host={$this->host};dbname={$this->databaseName}";

        try {
            $this->conn = new PDO($dsn, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $error) {
            echo "Connection failed: " . $error->getMessage();
        }
    }

    public static function getInstance()
    {
        if (self::$instance === null) {
            self::$instance = new self();
        }

        return self::$instance;
    }

    public function getConnection(){
        return $this->conn;
    }

    public function execute($sql) 
    {
        $result = $this->getConnection()->query($sql);

        return $result->fetchAll(PDO::FETCH_ASSOC);
    }

    public function create($table, $attributes = [])
    {

        $columns = [];
        $values = []; 
    
        foreach ($attributes as $key => $value) {
            $columns[] = sprintf("`%s`", $key); 
            $values[] = sprintf("'%s'", $value);
        }
    
        $columnsList = implode(', ', $columns);
        $valuesList = implode(', ', $values);
    
        $query = sprintf("INSERT INTO `%s` (%s) VALUES (%s)", $table, $columnsList, $valuesList);
    
        return $this->getConnection()->query($query);
        
    }
    

    public function update($table, $key, $attributes)
    {
        $assignments = [];
    
        foreach ($attributes as $id => $value) {
            $assignments[] = sprintf("`%s` = '%s'", $id, $value);
        }
    
        $setClause = implode(', ', $assignments);

        $query = sprintf("UPDATE `%s` SET %s WHERE `id` = %d", $table, $setClause, (int) $key);
    
        return $this->getConnection()->query($query);
    }

    public function delete($tablename, $key){
        $sql = sprintf("DELETE FROM `%s` WHERE `id` = %d", $tablename, (int) $key);
       
       return $this->getConnection()->query($sql);
    }
    
}
