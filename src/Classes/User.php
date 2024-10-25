<?php

namespace Mirjan24\OpTask\Classes;

use function PHPSTORM_META\elementType;

class User extends Model
{
    public static $tableName = "users";

    public $id;
    public $firstname;
    public $lastname;
    public $email;
    public $password;
    public static $fields = [
        'firstname',
        'lastname',
        'email',
        'password'
    ];
    public function getEmail($email)
    {
        $db = Db::getInstance();
        $res = $db->getConnection()->prepare("SELECT COUNT(*) FROM " . static::$tableName . " WHERE email = :email");
        $res->bindParam(':email', $email);
        $res->execute();
        
        return (bool) $res->fetchColumn();
    }
    public function create()
    {
        if ($this->email && $this->getEmail($this->email)){
            return false;
        }else{
            return parent::create();
        }
    }

    public function update()
    {
        if ($this->email && $this->getEmail($this->email)){
            return false;
        }else{
            return parent::update();
        }
    }

}

