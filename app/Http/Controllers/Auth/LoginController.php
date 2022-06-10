<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


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
            return response()->json([
                'status' => false,
                'message' => 'User not found'
            ]);
        } else if (!$check_user->is_verify) {
            return redirect()->route('login')->with('error', 'Please verified you account');
        }
        // else if (!$check_user->is_admin) {
        //     return response()->json([
        //         'status' => false,
        //         'message' => `Sorry, You don't have access`
        //     ]);
        // }

        $credentials = $request->validate([
            'email' => 'required',
            'password' => 'required'
        ]);
        // return $credentials;
        if (!$credentials) {
            return response()->json([
                'status' => false,
                'message' => 'Sorry, wrong password!',
            ]);
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
