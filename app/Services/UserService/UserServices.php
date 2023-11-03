<?php

namespace App\Services\UserService;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Validator\UserValidator;
use Illuminate\Support\Facades\DB;
use App\Services\CRUD\CrudServices;
use Illuminate\Support\Facades\Hash;
use App\Services\ProfilService\ProfilService;
use App\Notifications\ValidationCodeNotification;
use App\Services\CoockiesServices\CoockisesServices;

/**
 * Class utiliser pour traiter le model USER
 */
class UserServices
{

    protected $__validator;
    private $__profilService;
    protected $__request;
    protected $__crud;
    protected $__model;
    protected $__cookie;

    public function __construct(
        User $model_user,
        ProfilService $profilService,
        UserValidator $validator,
        CrudServices $crudServices,
        Request $request,
        CoockisesServices $cook
    ) {
        $this->__validator = $validator;
        $this->__request = $request;
        $this->__crud = $crudServices;
        $this->__model = $model_user;
        $this->__profilService = $profilService;
        $this->__cookie = $cook;
    }

    // Insertion utilisateur
    public function inserUser()
    {
        DB::beginTransaction();
        try {
            $validationForm = $this->__validator->validateForm($this->__request);

            if ($validationForm) {
                $validationForm["password"] = Hash::make($validationForm["password"]);
                $user = $this->__crud->crudGeneralise($this->__model, $validationForm);
                DB::commit();
                return ["user" => $user];
            }
        } catch (\Throwable $th) {
            DB::rollBack();
        }
    }

    /**
     * Vérification mail lors de l'essai de connexion
     *
     * @return envoiMail
     */
    public function mailVerification()
    {
        $validationForm = $this->__validator->validatorConnexion($this->__request);

        $user = User::where('email', '=', $validationForm["email"])->get()->first();
        if ($validationForm && $user) {
            return $user;
        } else {
            return response()->json(["message" => "Mail non trové", "success" => false], 400);
        }
    }


    /**
     * Verification password et création token de connexion
     *
     * @return token
     */
    public function passwordVerification($user)
    {
        $validationForm = $this->__validator->validatorPassword($this->__request);
        if ($validationForm) {
            if (
                $user && Hash::check($validationForm["password"], $user->password) == true
            ) {
                $token = $user->createToken($user->name . ' ' . $user->email);
                return response()->json(
                    [
                        "user" => ["name" => $user->name, "email" => $user->email],
                        "success" => "true",
                        "token" => $token->plainTextToken
                    ],
                    200
                );
            } else {
                return response()->json([
                    "message" => "user non trouvé"
                ], 401);
            }
        }
    }
}
