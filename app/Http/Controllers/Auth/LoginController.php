<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    public function index()
    {
        return view('authentication.login');
    }
    /**
     * note: Login
     */
    public function authenticate(Request $request)
    {
        $check_user = User::where('email', $request->email)->first();
        if (!$check_user) {
            return redirect()->route('login')->with('error', 'Email does not exists, please register')->withInput();
        } else if (!$check_user->is_verify) {
            return redirect()->route('login')->with('error', 'Please verified you account')->withInput();
        }


        if (!Hash::check($request->password, $check_user->password)) {
            return redirect()->route('login')->with('error', 'Sorry, wrong password')->withInput();
        }

        $credentials = $request->validate([
            'email' => 'required',
            'password' => 'required'
        ]);
        // return $credentials;
        if (!$credentials) {
            return redirect()->route('login')->with('error', 'Please check your email or password')->withInput();
            // return response()->json([
            //     'status' => false,
            //     'message' => 'Sorry, wrong password!',
            // ]);
        }
        if (Auth::attempt($credentials)) {
            // return 'success login';
            $request->session()->regenerate();
            return redirect()->intended('/dashboard/welcome');
        }
        return back()->with('loginError', 'Sorry, Login Failed');
    }

    /**
     * note: Logout
     */
    public function logout()
    {
        Auth::logout();
        request()->session()->invalidate();
        request()->session()->regenerateToken();
        return redirect('auth/login');
    }
}
