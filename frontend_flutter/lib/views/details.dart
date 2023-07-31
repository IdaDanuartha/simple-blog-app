import 'package:flutter/material.dart';
import 'package:frontend_flutter/constants/constants.dart';
import 'package:frontend_flutter/models/posts.dart';
import 'package:intl/intl.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key, required this.posts});

  @override
  State<PostDetail> createState() => _PostDetailState();

  final PostModel posts;
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.posts.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('$postImageUrl${widget.posts.image}'),
            const SizedBox(height: 20,),
            Text('Posted at ${DateFormat.yMMMEd().format(widget.posts.createdAt)}', style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),),
            const SizedBox(height: 20,),
            Text(widget.posts.title, style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 20,),
            Text(widget.posts.body, style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400
            ),),
            SizedBox(height: 20),            
            Text('Comment')
          ],
        ),
      ),
    );
  }
}