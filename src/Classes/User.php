<?php

namespace Mirjan24\OpTask\Classes;

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

    public static function create($data = [])
    {
        if (static::getEmail($data['email'])) return false;

        $db = Db::getInstance();
        $res = $db->getConnection()->prepare("INSERT INTO " . static::$tableName . " (firstname, lastname, email, password) VALUES (:firstname, :lastname, :email, :password)");


        $res->bindParam(':firstname', $data['firstname']);
        $res->bindParam(':lastname', $data['lastname']);
        $res->bindParam(':email', $data['email']);
        $res->bindParam(':password', $data['password']);
        
        return $res->execute();
    }

    public static function getAllUsers()
    {
        $db = Db::getInstance();
        $res = $db->getConnection()->prepare("SELECT * FROM " . static::$tableName);
        $res->execute();
        return $res->fetchAll();
    }

    public static function getEmail($email)
    {
        $db = Db::getInstance();
        $res = $db->getConnection()->prepare("SELECT COUNT(*) FROM " . static::$tableName . " WHERE email = :email");
        $res->bindParam(':email', $email);
        $res->execute();
        
        return (bool) $res->fetchColumn();
    }
}

