<?php

namespace App\Http\Controllers;

use App\Http\Requests\PostRequest;
use App\Models\Category;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index()
    {
        $posts = Post::with('categories')->latest()->get();

        return response([
            'message' => 'success',
            'posts' => $posts
        ]);
    }

    public function store(PostRequest $request)
    {
        $request->validated();

        $image = $request->file('image');
        $imageName = uniqid().$image->getClientOriginalName();
        $image->move(public_path('postImages'), $imageName);

        $res = auth()->guard('admins')->user()->posts()->create([
            'title' => $request->title,
            'body' => $request->body,
            'image' => $request->image,
        ]);

        if($res) {
            foreach($request->category as $cat) {
                Category::create([
                    'post_id' => $res->id,
                    'category_name' => $cat
                ]);
            }
        } else {
            return response([
                'message' => "Error when store post!"
            ], 500);
        }

        if($cat) {
            return response([
                'message' => 'success'
            ], 500);
        } else {
            return response([
                'message' => 'success'
            ], 500);
        }

    }

    public function update() {}
    public function delete() {}
}
