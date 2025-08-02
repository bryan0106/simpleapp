<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Posts</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100 p-8">
    <div class="max-w-4xl mx-auto">
        <h1 class="text-4xl font-bold text-gray-800 mb-6">Blog Posts</h1>
        @foreach ($posts as $post)
            <div class="bg-white rounded-lg shadow-md p-6 mb-4">
                <h2 class="text-2xl font-semibold text-gray-700">{{ $post->title }}</h2>
                <p class="text-gray-600 mt-2">{{ $post->content }}</p>
            </div>
        @endforeach
        @if($posts->isEmpty())
            <p class="text-gray-500">No posts found.</p>
        @endif
    </div>
</body>
</html>
