<?php

// start new session
session_start();


define("ROOTPATH", "Test");

// load all initial files
require "app/init.php";

// load 'App' class that will do everything for us such as loading controller & model classes
$app = new \app\core\App;