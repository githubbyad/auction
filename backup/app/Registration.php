<?php

namespace app\controllers;

class Registration
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
        $data['title'] = "Player Registration | " . $data['setting']->title . " | Players Auction";

        // active menu class
        $data['menu'] = 'Registration';

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

        $this->view('registration/new', $data);
    }

    public function add()
    {

        // instances
        $setting = new \app\models\Setting;
        $updated = new \app\models\Updated;
        $player = new \app\models\Player;

        // settings data
        $data['setting'] = $setting->first();

        // website title
        $data['title'] = "Player Registration | " . $data['setting']->title . " | Players Auction";

        // active menu class
        $data['menu'] = 'Registration';

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

        // check auto-active player
        $_POST['active'] = $data['setting']->auto_active == 'Yes' ? 'Yes' : '';

        // form submitted
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {

            // save form data
            $data['form_data'] = $_POST;

            // check duplicate phone number
            if ($player->first(['phone' => $_POST['phone']])) {
                response("dark", "Player with Phone Number '" . $_POST['phone'] . "' already exists.");
            } else {

                // check file upload
                if (!isset($_FILES['image'])) {
                    response("danger", "Please upload photo.");
                } else {

                    // upload photo check
                    $upload_status = upload_photo($_FILES["image"], trim($_POST['name']), 'players', $setting->first()->photo_width);
                    show($upload_status);
                    if (!isset($upload_status['uploaded_path'])) {                        
                        response("danger", $upload_status['error']);
                    } else {

                        // photo uploaded
                        $_POST['image'] = $upload_status['uploaded_path'];
                        $data['form_data'] = $_POST;
                        //show($_POST['image']);
                        // insert data 
                        
                        if ($player->insert($_POST)) {

                            // change 'v' value
                            $updated->update('1', ['timestamp' => time()]);

                            redirect_page(ROOT . '/registration/success');                            
                        }
                    }
                }
            }
            $this->view('registration/new', $data);
        } else {
            // if form not submitted
            redirect_page(ROOT . '/registration');
        }
    }

    public function success() {

        if(admin()) {
            redirect_page(ROOT . '/players/list');
        } else {
            echo 'normal user';
        }
    }
}
