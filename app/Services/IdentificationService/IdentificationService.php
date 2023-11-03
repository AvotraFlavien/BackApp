<?php

namespace App\Services\IdentificationService;

use Illuminate\Http\Request;
use App\Models\Identification;
use App\Services\CRUD\CrudServices;

class IdentificationService
{
    public function __construct(
        protected Request $request,
        protected CrudServices $crud,
        protected Identification $identification
    ) {
    }
    public function insertIdentification($id_publication)
    {
        $users_identifier = $this->request->users_identifier;
        if ($users_identifier != null) {
            foreach ($users_identifier as $key => $value) {
                $form = [
                    "publication_id" => $id_publication,
                    "user_id" => $value["user_id"]
                ];
                $this->crud->crudGeneralise($this->identification, $form);
            }
            return true;
        }else{
            return false;
        }
    }
}
