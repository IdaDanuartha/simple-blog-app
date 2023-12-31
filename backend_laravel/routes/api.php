<?php

use App\Http\Controllers\Auth\AdminController;
use App\Http\Controllers\PostController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/posts', [PostController::class, 'index']);
Route::get('/posts/comment/{post_id}', [PostController::class, 'getComments']);
Route::post('/posts/comment/{post_id}', [PostController::class, 'comment']);

Route::group(['prefix' => 'admin', 'middleware' => 'auth:admins'], function() {
    Route::post('/store', [PostController::class, 'store']);
    Route::patch('/update/{post}', [PostController::class, 'update']);
    Route::delete('/delete/{post}', [PostController::class, 'delete']);
});

Route::post('/login', [AdminController::class, 'login']);