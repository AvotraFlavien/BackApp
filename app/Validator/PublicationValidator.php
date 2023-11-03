<?php
namespace App\Validator;

use Illuminate\Http\Request;


class PublicationValidator {
    public function validatePublication(Request $request)
    {
        return $request->validate(
            [
                'texte' => 'required|string',
                // 'images' => 'image|max:3000'
            ]
        );
    }
}
