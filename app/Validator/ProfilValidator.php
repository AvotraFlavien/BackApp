<?php
namespace App\Validator;

use Illuminate\Http\Request;

class ProfilValidator {

    public function validateProfils(Request $request)
    {
        return $request->validate(
            [
                'image' => 'required|image|max:3000'
            ]
        );
    }

}
