<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SubjectController extends Controller
{
    public function getSubject()
    {
        $sujet = Auth::user()->userSubject;
        $sub = [];
        foreach ($sujet as $key => $value) {
            array_push($sub, $value->subject);
        }
        return $sub;
    }
}
