<?php

use App\Http\Controllers\ConversationController;
use App\Http\Controllers\PublicationController;
use App\Http\Controllers\SubjectController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

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


Route::post('user/create', [UserController::class, 'createUser']);
Route::post('user/connect/verified-mail', [UserController::class, 'verificationMail']);
Route::get('/user/verification/code/{id_user}', [UserController::class, 'verificationUser']);

Route::post('user/connect', [UserController::class, 'connexion']);


Route::middleware("auth")->group(function () {
    Route::get("user/profile", [UserController::class, 'afficheProfiles']);
    Route::post("user/logout", [UserController::class, 'deconnectionUser']);
    Route::get('user/getSubject', [SubjectController::class, 'getSubject']);
});
