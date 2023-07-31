import 'package:frontend_flutter/constants/constants.dart';
import 'package:frontend_flutter/models/posts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostController extends GetxController {
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  final isLoading = false.obs;

  @override
  void onInit() {
    getAllPosts();
    super.onInit();
  }

  Future getAllPosts() async {
    try {
      posts.value.clear();
      var response = await http.get(Uri.parse('${url}posts'), headers: {
        'Accept': 'application/json',
      });
      if(response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body)['posts'];
        for(var item in content) {
          posts.value.add(PostModel.fromJson(item));
        }
      }
    } catch(e) {
      print(e.toString());
    }
  }

  Future getComments(id) async {
    try {
      
    } catch (e) {
      
    }
  }
}