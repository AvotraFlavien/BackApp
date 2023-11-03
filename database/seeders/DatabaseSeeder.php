<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;

use App\Models\Subject;
use App\Models\User;
use App\Models\UserSubject;
use Illuminate\Database\Seeder;
use Database\Factories\UserFactory;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);


        User::factory(10)->create();
        User::factory()->unverified()->create();
        Subject::factory(50)->create();
        UserSubject::factory(100)->create();
    }
}
