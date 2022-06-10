<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::prefix('auth')->group(function () {
    Route::get('login', 'Auth\LoginController@index')->name('login')->middleware('guest');
    Route::post('login', 'Auth\LoginController@authenticate')->name('login.auth.custom');
    Route::post('logout', 'Auth\LoginController@logout')->name('logout.auth.custom');

    Route::get('register', 'PagesController@register')->name('register_form');
    Route::post('register/store', 'Auth\RegisterController@store')->name('register.store');
});

Route::prefix('dashboard')->middleware('auth')->group(function () {
    // note: Dashboard welcome user operational login
    Route::get('welcome', 'DashboardController@index_welcome')->name('dashboard.index_welcome');

    Route::prefix('users')->group(function () {
        Route::get('', 'UserController@index')->name('dashboard.user.index');
        Route::get('create', 'UserController@create')->name('dashboard.user.create');
        Route::post('store', 'UserController@store')->name('dashboard.user.store');
    });
});
