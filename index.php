<?php

require 'vendor/autoload.php';

use Smarty\Smarty;
use Mirjan24\OpTask\Classes\User;
use Mirjan24\OpTask\Classes\Tools;

$smarty = new Smarty();
$smarty->setTemplateDir('templates');
global $smarty;

$id = Tools::getValue('id');
$metoda = Tools::getValue('method');

$user = User::find($id);

switch ($metoda) {
    case 'loadEditForm':
        if ($user) {
            $smarty->assign(['user' => $user]);
            echo $smarty->display('users/edit.tpl');
        } else {
            echo "Użytkownik nie znaleziony.";
        }
        break;

    case 'delete':
        if ($user) {
            $user->delete();
            echo "Rekord usunięty!";
        } else {
            echo "Użytkownik nie znaleziony.";
        }
        break;

    case 'loadCreateForm':
        echo $smarty->display('users/create.tpl');
        break;
    case 'createUser':
        $firstname = Tools::getValue('firstname');
        $lastname = Tools::getValue('lastname');
        $email = Tools::getValue('email');
        $password = Tools::getValue('password');

        $res = User::create([
            'firstname' => $firstname,
            'lastname' => $lastname,
            'email' => $email,
            'password' => $password
        ]);

        if ($res) {
            echo "Dodano użytkownika";
        }
        break;
    case 'update':
            $userId = Tools::getValue('userID');
            $user = User::find(id: $userId);

            if ($user) {
                $user->firstname = Tools::getValue('firstname');
                $user->lastname = Tools::getValue('lastname');
                $user->email = Tools::getValue('email');
                $user->password = Tools::getValue('password');
                $user->update();
                echo "Użytkownik zaktualizowany!";
            } else {
                echo "Użytkownik nie znaleziony.";
            }
            break;

    default:
        return displayIndex();
}

function displayIndex() {
    global $smarty; 
    $users = User::all();
    $smarty->assign(['users' => $users]);
    echo $smarty->display('users/index.tpl');
}