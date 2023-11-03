<?php

namespace App\Models;

use App\Models\UserSubject;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Subject extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'subject_id'
    ];

    public function subject()
    {
        return $this->hasMany(UserSubject::class, 'subject_id');
    }
}
