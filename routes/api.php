<?php

use App\Http\Controllers\{AuthController, ContactController, CommentController, PostController};
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function(){

    // Post
    Route::get('posts', [PostController::class, 'index']);
    Route::post('posts', [PostController::class, 'store']);
    Route::delete('posts/{postId}', [PostController::class, 'destroy']);

    // Comment
    Route::post('comments', [CommentController::class, 'store']);
    
    //Contact
    Route::get('contacts', [ContactController::class, 'index']);
});

