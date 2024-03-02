<?php

namespace app\controllers;

class Player
{

    use \app\core\Controller;

    public function index($id = '')
    {

        if ($id == '') {

            redirect_page(ROOT);
        } else {

            // instances
            $setting = new \app\models\Setting;
            $updated = new \app\models\Updated;
            $team = new \app\models\Team;
            $player = new \app\models\Player;

            // settings data
            $data['setting'] = $setting->first();

            // get player
            $data['player'] = $player->first(['id' => $id]);

            // website title
            $page_name = ucwords($data['player']->name);
            $data['title'] = $page_name . " | " . $data['setting']->title . " | Players Auction";            

            // active menu class
            $data['menu'] = 'Home';

            // get all teams
            $data['teams'] = $team->all([], [], 'name', 'ASC', 0);

            // get batsman, bowler, all-rounder, keeper
            $data['batsman'] = $player->where(['role' => 'Batsman', 'active' => 'Yes'], [], 'name, status', 'DESC', 0);
            $data['bowler'] = $player->where(['role' => 'Bowler', 'active' => 'Yes'], [], 'name, status', 'DESC', 0);
            $data['all_rounder'] = $player->where(['role' => 'All Rounder', 'active' => 'Yes'], [], 'name, status', 'DESC', 0);
            $data['keeper'] = $player->where(['role' => 'Wicket Keeper', 'active' => 'Yes'], [], 'name, status', 'DESC', 0);

            // get updated timestamp
            $data['updated'] = $updated->first()->timestamp;

            $this->view('front/player', $data);
        }
    }

}
