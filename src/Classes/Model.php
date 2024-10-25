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
    
    public function create()
    {
        $values = $this->__serialize();
        
        return Db::getInstance()->create(static::$tableName, $values);
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