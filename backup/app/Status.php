<?php

namespace app\controllers;

class Status
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
        $data['title'] = "Auction Player Status | " . $data['setting']->title . " | Players Auction";

        // active menu class
        $data['menu'] = 'Home';

        // get all teams
        $data['teams'] = $team->all([], [], 'name', 'ASC', 0);

        // get fresh players
        $data['fresh_player'] = $player->total(['active' => 'Yes'], ['status' => 'sold']);


        // get total players
        $data['total_players'] = $player->total(['active' => 'Yes']);

        // get sold players
        $data['notsold_player'] = $player->total(['status' => 'not sold']);

        // get unsold players
        $data['sold_player'] = $player->total(['status' => 'sold']);

        // get left players
        $data['left_player'] = $player->total(['status' => '']);

        // get updated timestamp
        $data['updated'] = $updated->first()->timestamp;

        $this->view('front/status', $data);
    }
}
