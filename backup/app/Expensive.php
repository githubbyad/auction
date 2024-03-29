<?php

namespace app\controllers;

class Expensive
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

        // get price limit
        $data['price_limit'] = $data['setting']->total_price;

        // website title
        $data['title'] = "Most Expensive Players | " . $data['setting']->title . " | Players Auction";

        // active menu class
        $data['menu'] = 'Expensive';     

        // get fresh players
        $data['fresh_player'] = $player->total(['active' => 'Yes'], ['status' => 'sold']);

        // get unsold players
        $data['notsold_player'] = $player->total(['status' => 'not sold']);
        
        // get all teams
        $data['teams'] = $team->all([], [], 'name', 'ASC', 0);

        // get all sold players
        $data['players'] = $player->where([
            'status' => 'sold',
            'active' => 'Yes'
        ], [], 'price', 'DESC', 10);

        // get updated timestamp
        $data['updated'] = $updated->first()->timestamp;

        $this->view('front/expensive', $data);
    }

}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         