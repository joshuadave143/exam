<?php

namespace Modules\Common\Filters; 

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;

use Modules\Common\Libraries\Oauth;
use \OAuth2\Request;
use \OAuth2\Response;

class OAuthFilter implements FilterInterface{

    public function before(RequestInterface $request, $arguments = null){
       

        // $oauth      = new Oauth();
        // $request    = Request::createFromGlobals();
        // $response   = new Response(); 
        // if( !$oauth->server->verifyResourceRequest($request) ){
        //     $oauth->server->getResponse()->send(); 
        //     // die("You must login first yo use this service.");
        //     die();
        // }
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null){
        
    }
}