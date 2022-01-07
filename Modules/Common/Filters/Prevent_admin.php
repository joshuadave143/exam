<?php

namespace Modules\Common\Filters; 

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class Prevent_admin implements FilterInterface{

    public function before(RequestInterface $request, $arguments = null){
       
        if( !is_null(session()->get('user_type')) && session()->get('user_type') == 'admin' ){
            // return redirect()->to('/admin/'.session()->get('username').'/accounts');
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null){
        
    }
}