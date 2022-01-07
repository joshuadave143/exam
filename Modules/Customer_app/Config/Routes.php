<?php
$routes->setDefaultNamespace('Modules\Customer_app\Controllers');
$routes->setDefaultController('Booking');

$routes->match(['get','post'],'Time', 'Booking::index', ['filter' => 'Auth']);
$routes->match(['get','post'],'Registration', 'Information::index', ['filter' => 'Auth']);


