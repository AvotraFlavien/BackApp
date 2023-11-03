<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserSubject extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'subject_id'
    ];

    public function user()
    {
        // Une conversation appartient à un utilisateur
        return $this->belongsTo(User::class, 'id');
    }

    public function subject()
    {
        return $this->belongsTo(Subject::class, 'subject_id');
    }
}
