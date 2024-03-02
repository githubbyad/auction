<?php

namespace app\controllers;

class Home
{

    use \app\core\Controller;

    public function index()
    {

        // instances
        $setting = new \app\models\Setting;
        $updated = new \app\models\Updated;
        $team = new \app\models\Team;
        $player = new \app\models\Player;

        // settings data
        $data['setting'] = $setting->first();

        // website title
        $data['title'] = $data['setting']->title . " | Players Auction";

        // active menu class
        $data['menu'] = 'Home';

        // get all teams
        $data['teams'] = $team->all([], [], 'name', 'ASC', 0);

        // get fresh players
        $data['fresh_player'] = $player->total(['active' => 'Yes'], ['status' => 'sold']);

        // get unsold players
        $data['notsold_player'] = $player->total(['status' => 'not sold']);

        // get batsman, bowler, all-rounder, keeper
        $data['batsman'] = $player->where(['role' => 'Batsman', 'active' => 'Yes'], [], 'status,name', 'ASC', 0);
        $data['bowler'] = $player->where(['role' => 'Bowler', 'active' => 'Yes'], [], 'status,name', 'ASC', 0);
        $data['all_rounder'] = $player->where(['role' => 'All Rounder', 'active' => 'Yes'], [], 'status,name', 'ASC', 0);
        $data['keeper'] = $player->where(['role' => 'Wicket Keeper', 'active' => 'Yes'], [], 'status,name', 'ASC', 0);

        // get updated timestamp
        $data['updated'] = $updated->first()->timestamp;

        $this->view('front/home', $data);
    }

    public function auction($id = '')
    {

        $data = [];

        if ($id != '') {
            // manually select player
        } else {
            // automatic select player
            // get fresh players
            $player = new \app\models\Player;
            $data['player'] = $player->random(['status' => '']);

            if (is_array($data['player']) && count($data['player']) == 1) {
            } else {

                response("danger", "No player found");
                redirect_page(ROOT);
            }
            $this->view('front/auction', $data);
        }
    }
}
