<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login ()
    {

        $user = User::where('email', request('email'))->first();

        if($user){
            if(Hash::check(request('password'), $user->password)){
                return response()->json([
                    'access_token' => $user->createToken('auth-token')->plainTextToken,
                    'user' => $user
                ], 200);
            }

            return response()->json([
                'message' => 'Password salah'
            ], 401);
        }


        return response()->json([
            'message' => 'Email tidak di temukan'
        ], 401);
    }

}
