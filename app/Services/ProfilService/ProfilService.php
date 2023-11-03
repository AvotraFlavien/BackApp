<?php

namespace App\Services\ProfilService;

use App\Models\Profil;
use Storage;

class ProfilService
{



    public function stockagePublicImage($images, $user_id)
    {
        $get_content_image = file_get_contents($images);
        // Mandefa anle image any @ Storage
        $randomNumber = mt_rand(100000, 999999);

        $stockage = Storage::disk('public')->put(
            'profile/' . $randomNumber . '_' . $user_id . '-images.jpg',
            $get_content_image
        );

        return ($stockage == true) ? 'profile/' . $randomNumber . '_' . $user_id . '-images.jpg'  : false ;

    }

}
