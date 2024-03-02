<?php

namespace app\controllers;

class Balance
{
    use \app\core\Controller;
    
    public function index() {



        // instances
        $setting = new \app\models\Setting;
        $updated = new \app\models\Updated;
        $team = new \app\models\Team;
        $player = new \app\models\Player;

        // settings data
        $data['setting'] = $setting->first();

        // website title
        $data['title'] = "Teams Balance & Status | " . $data['setting']->title . " | Players Auction";

        // active menu class
        $data['menu'] = 'Home';

        // get all teams
        $data['teams'] = $team->all([], [], 'name', 'ASC', 0);

        // get fresh players
        $data['fresh_player'] = $player->total(['active' => 'Yes'], ['status' => 'sold']);

        // get unsold players
        $data['notsold_player'] = $player->total(['status' => 'not sold']);

        // get updated timestamp
        $data['updated'] = $updated->first()->timestamp;

        $this->view('front/balance', $data);
    }
}
