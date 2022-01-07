<?php
$routes->setDefaultNamespace('Modules\API\Controllers');

$routes->group('api', function($routes){
    $routes->resource('book',           ['controller' =>'Api_booking']);
    
});