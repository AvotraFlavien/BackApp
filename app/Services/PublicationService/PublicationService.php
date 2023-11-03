<?php

namespace App\Services\PublicationService;

use Exception;
use App\Helper\Helper;
use App\Models\Publication;
use Illuminate\Http\Request;
use App\Services\CRUD\CrudServices;
use Illuminate\Support\Facades\Auth;
use App\Validator\PublicationValidator;
use Illuminate\Support\Facades\Storage;

class PublicationService
{
    public function __construct(
        protected PublicationValidator $__pubValidator,
        protected Helper $__helper,
        protected CrudServices $__crud,
        protected Publication $publication,
        protected Request $request
    ) {
    }

    public function addPublication()
    {
        try {
            $validator = $this->__pubValidator->validatePublication($this->request);

            if ($validator) {
                $images = $this->__helper->helperStockagePublicImage($this->request->images, 'Publication', Auth::id());

                if ($images != false) {
                    $form = [
                        "texte" => $this->request->texte,
                        "images" =>  $images, "user_id" => Auth::id()
                    ];

                    $pub = $this->__crud->crudGeneralise($this->publication, $form);

                    return $pub;
                }
                return false;
            }
            return false;
        } catch (Exception $e) {
            return $e;
        }
    }

    // Manao modification publication sy suppression images auparavant dans public
    public function update($images_deplacer, $publication)
    {
        if ($images_deplacer != false) {
            $images_publier = explode(";", $publication->images);
            foreach ($images_publier as $key => $value) {
                Storage::disk("public")->delete($value);
            }
            $publication->update(["texte" => $this->request->texte, "images" => $images_deplacer]);
            return true;
        }
        return false;
    }

    public function modificationPubService($publication)
    {
        try {
            $images_deplacer = $this->__helper->helperStockagePublicImage(
                $this->request->images,
                'Publication',
                Auth::id()
            );
            return $this->update($images_deplacer, $publication);
        } catch (Exception $e) {
            return $e;
        }
    }
}
