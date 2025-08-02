<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Post;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        Post::create([
            'title' => 'First Post on Render!',
            'content' => 'This is the first post created using a seeder, and we will deploy this app to Render.',
        ]);

        Post::create([
            'title' => 'The Power of SQLite',
            'content' => 'SQLite is a lightweight, file-based database that is perfect for simple deployments like this.',
        ]);
    }
}
