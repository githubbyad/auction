<?php

require 'core/config.php';
require 'core/functions.php';
require 'core/icons.php';
require 'core/paths.php';
require 'core/Database.php';
require 'core/Model.php';
require 'core/Controller.php';
require 'core/App.php';

spl_autoload_register(function ($classname) {

    $filename = "app/models/" . end(explode('\\', $classname)) . ".php";
    if (file_exists($filename)) {
        require $filename;
    }
});
