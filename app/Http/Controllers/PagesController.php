<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class PagesController extends Controller
{
    /**
     * NOTE: Form Login
     */
    public function login()
    {
        return view('authentication.login');
    }
}
