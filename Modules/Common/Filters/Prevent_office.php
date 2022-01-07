<?php

namespace Modules\Common\Filters; 

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

class Prevent_office implements FilterInterface{

    public function before(RequestInterface $request, $arguments = null){
       
        if( !is_null(session()->get('user_type')) && session()->get('user_type') == 'office' ){
            return redirect()->to('/office/'.session()->get('username').'/stock_inventory');
        }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null){
        
    }
}