<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function index ()
    {
        return response()->json([
            'Message' => 'Berhasil mengambil data contact',
            'data' => User::get()
        ]);
    }
}
