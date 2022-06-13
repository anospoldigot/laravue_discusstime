<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Post;
use Exception;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index()
    {

        return response()->json([
            'message' => 'Berhasil mengambil data',
            'data' => Post::with(['comments' => function($q){
                $q->with('user');
            }, 'files', 'user'])->latest()->get()
        ]);
    }


    public function store()
    {
        try {
            Post::create(request()->all());

            return response()->json([
                'Message' => 'Post Berhasil dibuat'
            ], 201);
        } catch (Exception $e) {
            return response()->json([
                'message' => $e
            ], 500);
        }
    }

    public function destroy($id)
    {
        try {
            Post::where('id', $id)->delete();
            Comment::where('post_id', $id)->delete();
            
            return response()->json([
                'Message' => 'Post Berhasil dihapus'
            ], 200);
        } catch (Exception $e) {
            return response()->json([
                'Message' => 'Error'
            ], 500);
        }
    }
}
