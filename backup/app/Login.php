<?php

namespace app\controllers;

use app\core\App;

class Login
{

    use \app\core\Controller;

    public function index($id = '')
    {

        // check for login
        if(admin()) {
            redirect_page(ROOT);
        }

        // instances
        $setting = new \app\models\Setting;
        $updated = new \app\models\Updated;

        // settings data
        $data['setting'] = $setting->first();

        // website title
        $page_name = "Login";
        $data['title'] = $page_name . " | " . $data['setting']->title . " | Players Auction";

        // active menu class
        $data['menu'] = 'Login';

        // get updated timestamp
        $data['updated'] = $updated->first()->timestamp;

        $this->view('front/login', $data);
    }

    public function verify($id = '')
    {

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            
            $user = new \app\models\User;
            $row = $user->first(['username' => $_POST['username']]);

            // check if username found
            if($row) {
                
                // check for password
                if(md5(htmlspecialchars($_POST['password'])) === $row->password) {

                    // store in session
                    $_SESSION[APP]['username'] = $row->username;                    
                    $_SESSION[APP]['role'] = $row->role;   
                    
                    redirect_page(ROOT . '/home');
                } else {

                    response('danger', 'Incorrect Username / Password');                    
                }
            }
            response('danger', 'Incorrect Username / Password');
        } else {

            response('danger', 'Error Processing Request');            
        }
        //redirect_page(ROOT . '/login');
    }
}
