<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store ()
    {
        Comment::create(request()->all());

        return response()->json([
            'message' => 'Berhasil menambahkan komentar',
        ], 201);
    }
}
