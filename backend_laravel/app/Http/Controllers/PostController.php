<?php

namespace App\Http\Controllers;

use App\Http\Requests\PostRequest;
use App\Http\Resources\CommentResource;
use App\Models\Category;
use App\Models\Comment;
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
            'image' => $imageName,
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
            ], 201);
        } else {
            return response([
                'message' => 'success'
            ], 500);
        }

    }

    public function update() {}
    public function delete() {}
    
    public function getComments($post_id)
    {
        $comments = Comment::with('post')->wherePostId($post_id)->latest()->get();

        return response([
            'comment' => CommentResource::collection($comments)
        ], 200);
    }

    public function comment(Request $request, $post_id)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email:dns',
            'comment' => 'required',
        ]);

        $comment = Comment::create([
            'post_id' => $post_id,
            'name' => $request->name,
            'email' => $request->email,
            'comment' => $request->comment,
        ]);

        if($comment) {
            return response([
                'message' => 'success'
            ], 201);
        } else {
            return response([
                'message' => 'error'
            ], 400);
        }
    }
}
