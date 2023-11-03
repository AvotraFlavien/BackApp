<?php

namespace App\Http\Controllers;

use App\Helper\Helper;
use App\Models\User;
use App\Notifications\ValidationCodeNotification;
use App\Services\CoockiesServices\CoockisesServices;
use Illuminate\Http\Request;
use App\Validator\UserValidator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Services\UserService\UserServices;
use Exception;
use Illuminate\Contracts\Mail\Mailable;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    protected $__userService;
    protected $__request;
    protected $__validator;

    public function __construct(
        UserServices $userService,
        Request $request,
        CoockisesServices $cook,
        UserValidator $validator,
        protected Helper $__helper
    ) {
        $this->__userService = $userService;
        $this->__request = $request;
        $this->__validator = $validator;
    }

   

    public function createUser()
    {
        $valide =  $this->__validator->validateForm($this->__request);
        if ($valide) {
            $user_create = $this->__userService->inserUser();

            if ($user_create && $user_create["user"] != null) {
                return response()->json(
                    ["message" => "user crée avec succès"],
                    201
                );
            }
            return response()->json(["Non inserer"], 400);
        }


        return response()->json(["erreur"], 400);
    }


    // Vérification mot de passe et connexion
    public function connexion()
    {
        $user = $this->__userService->mailVerification();
        return $this->__userService->passwordVerification($user);
    }

    // Modification mot de passe
    public function updatePassword(User $user_id, UserValidator $validator)
    {
        if (
            Auth::id() == $user_id->id &&
            $validator->validatorPassword($this->__request)
            && Hash::check($this->__request->old_password, $user_id->password) == true
        ) {
            $modification = $user_id->update(["password" => Hash::make($this->__request->password)]);
            $retVal = ($modification) ?
                // deconnection
                $this->__helper->delteteTokenLogout()
                : ["message" => "Erreur survenu lors de la modification"];
            return response()->json($retVal, 200);
        }
        return response()->json(["erreur" => "mot de passe invalide"], 400);
    }

    // Fafana fotsiny ny token rehefa i deconnect
    public function deconnectionUser()
    {
        try {
            $deconnexion = ($this->__helper->delteteTokenLogout() == true) ?
                response()->json(["message" => "Déconnexion réussie"], 201) :
                response()->json(["erreur" => "Un erreur est apparu"], 400);
            return $deconnexion;
        } catch (Exception $e) {
            return $e;
        }
    }

    public function afficheProfiles()
    {
        $user = [
            "user" => [
                "id" => Auth::user()->id,
                "name" => Auth::user()->name,
                "email" => Auth::user()->email,
                "created_at_user" => Auth::user()->created_at
            ]
        ];

        return response()->json([$user], 200);
    }

    // Make ny user rehetra par ordre DECROISSANT
    public function getUserDecroissant()
    {
        dump(User::with('conversationCreatedUser'));
    }

    public function listeUserAll()
    {
        return response()->json(["user" => User::all()], 200);
    }
}
