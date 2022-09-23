<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->post('/users', [ 'as' => '/users', 'uses' => 'UserController@createUsers']);
$router->post('/login', [ 'as' => '/login', 'uses' => 'UserController@login']);

$router->group(['middleware' => 'auth'], function () use ($router) {

    $router->get('/articulos', [ 'as' => 'articulos', 'uses' => 'ArticulosController@TodosArticulos']);
    $router->get('/consulta/articulos', [ 'as' => 'consulta/articulos', 'uses' => 'ArticulosController@consultarArticulos']);
    $router->post('/guardar/articulos', [ 'as' => 'guardar/articulos', 'uses' => 'ArticulosController@saveArticulos']); 

    $router->post('/logout', [ 'as' => '/logout', 'uses' => 'UserController@logout']);

    $router->put('/actualizarDatos', ['as' => '/actualizarDatos', 'uses' => 'ArticulosController@actualizarDatos']);
    $router->delete('/eliminarArticulo', ['as' => '/eliminarArticulo', 'uses' => 'ArticulosController@eliminarArticulo']);

    $router->get('/user', function () use ($router){
        return auth()->user();
    });
    
});