<?php

namespace Mirjan24\OpTask\Classes;

use Mirjan24\OpTask\Classes\Db;

class Model
{
    public static $tableName;
    public $id;
    public static $fields = [];

    public static function find($id)
    {
        $id = intval($id); 
    
        $result = Db::getInstance()->getConnection()->query("SELECT * FROM " . static::$tableName . " WHERE id = $id");
        
        if ($result) {
            $fields = $result->fetchAll(\PDO::FETCH_ASSOC);
    
            if ($fields) {
                $model = new static;
                $fieldId = $fields[0];
    
                foreach (static::$fields as $field) {
                    if (isset($fieldId[$field])) {
                        $model->$field = $fieldId[$field];
                    }
                }
                $model->id = $id;

                return $model;
            }
        }
    
        return false; 
    }
    
    public static function create($data = [])
    {
        $fields = array_keys($data);
        $values = array_values($data);
    
        $fieldsFormatted = array_map(function($field) {
            return $field;
        }, $fields);
    
        $valuesFormatted = array_map(function($value) {
            return "'" . addslashes($value) . "'";
        }, $values);
    
        $fieldsString = implode(",", $fieldsFormatted);
        $valuesString = implode(",", $valuesFormatted);

        $sql = "INSERT INTO `" . static::$tableName . "` ($fieldsString) VALUES ($valuesString)";
    
        return Db::getInstance()->execute($sql);
    }
    

    public static function all()
    {
        return Db::getInstance()->execute("SELECT * FROM " . static::$tableName);
    }

    public function update() {
        $values = $this->__serialize();
    
        return Db::getInstance()->update(static::$tableName, $this->id, $values);
    }
    public function __serialize()
    {
        $fields = [];

        foreach (static::$fields as $field)
        {
            $fields[$field] = $this->$field;
        }
        return $fields;
    }

    public function delete()
    {
    return Db::getInstance()->delete(static::$tableName, $this->id);
    }
}