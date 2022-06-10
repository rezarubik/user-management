<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    /**
     * NOTE: Store new registration
     */
    public function store(Request $request)
    {
        try {
            DB::beginTransaction();
            $data = [
                'firstname' => $request->firstname,
                'lastname' => $request->lastname,
                'email' => $request->email,
                'password' => Hash::make($request->password),
            ];
            // return $data;
            User::create($data);
            DB::commit();
            return redirect()->route('login')->with('status', 'Registraction success, please check your email for verification');
        } catch (\Throwable $th) {
            DB::rollback();
            return response()->json([
                'status' => false,
                'message' => $th->getMessage()
            ]);
        }
    }
}
