<?php

namespace app\controllers;

class Team
{

    use \app\core\Controller;

    public function index($id = '')
    {

        // instances
        $setting = new \app\models\Setting;
        $updated = new \app\models\Updated;
        $team = new \app\models\Team;
        $player = new \app\models\Player;

        // settings data
        $data['setting'] = $setting->first();

        // get current team
        $data['team'] = $team->first(['id' => $id]);

        // get price limit
        $data['price_limit'] = $data['setting']->total_price;

        // website title
        $data['title'] = $data['team']->name . " | " . $data['setting']->title . " | Players Auction";

        // active menu class
        $data['menu'] = 'Teams';     
        
        // get all teams
        $data['teams'] = $team->all([], [], 'name', 'ASC', 0);

        // get total players from selected team
        $data['player_total'] = $player->total(['team_id' => $id]);

        // get balance left
        $data['balance'] = moneyFormatIndia((int)$data['price_limit'] - (int) $player->sumTotal(['team_id' => $id], [], 'price'));

        // get all players from selected team
        $data['players'] = $player->where([
            'team_id' => $id,
            'status' => 'sold',
            'active' => 'Yes'
        ], [], 'price', 'DESC', 0);

        // get updated timestamp
        $data['updated'] = $updated->first()->timestamp;

        $this->view('front/team', $data);
    }

}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          