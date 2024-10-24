<?php

namespace Mirjan24\OpTask\Classes;

class Tools
{

    public static function getValue($key)
    {
        return $_POST[$key] ?? $_GET[$key] ?? false;
    }
}