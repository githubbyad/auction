<?php

namespace app\controllers;

class Admin
{
    use \app\core\Controller;
    
    public function index() {



        // instances
        $setting = new \app\models\Setting;
        $updated = new \app\models\Updated;
        $team = new \app\models\Team;
        $player = new \app\models\Player;



        $this->view('admin/index', $data);
    }
}
