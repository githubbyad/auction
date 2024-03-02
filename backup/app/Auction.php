<?php

namespace app\controllers;

class Auction
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
            $data['menu'] = 'Auction';

            // get all teams
            $data['teams'] = $team->all([], [], 'name', 'ASC', 0);

            // get new player
            $data['player'] = $player->random([
                'active' => 'Yes',                
            ],['status' => 'sold']);

            // get updated timestamp
            $data['updated'] = $updated->first()->timestamp;

            $this->view('front/auction', $data);
        
    }

    public function auctionx()
    {

        $data = [];

        if(isset($_GET['id'])) {}

        // instances
        $player = new \app\models\Player;

        if ($id != '') {
            // manually select player         
            $data['player'] = $player->first(['id' => $id]);

            if (is_array($data['player']) && count($data['player']) == 1) {
            } else {

                response("danger", "No player found");
                redirect_page(ROOT);
            }
        } else {
            // automatic select player

            // get fresh players            
            $data['player'] = $player->random(['status' => '']);

            if (is_array($data['player']) && count($data['player']) == 1) {
            } else {

                response("danger", "No player found");
                redirect_page(ROOT);
            }
            $this->view('front/auction', $data);
        }
    }


    public function unsoldShow()
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
            $data['menu'] = 'Auction';

            // get all teams
            $data['teams'] = $team->all([], [], 'name', 'ASC', 0);

            // get unsold player
            $data['player'] = $player->random([
                'active' => 'Yes',                
            ],['status' => 'not sold']);

            // get updated timestamp
            $data['updated'] = $updated->first()->timestamp;

            if (is_array($data['player']) && count($data['player']) == 1) {
            } else {

                response("danger", "No player found");
                redirect_page(ROOT);
            }

            $this->view('front/auction', $data);
        
    }


}
