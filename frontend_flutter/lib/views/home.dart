import 'package:flutter/material.dart';
import 'package:frontend_flutter/controllers/post_controller.dart';
import 'package:frontend_flutter/views/details.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
// Widgets
import 'widgets/blog_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final PostController _postController = Get.put(PostController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Icon(Icons.menu, color: Colors.black,),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Blogs', 
                style: GoogleFonts.workSans(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                )),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Blog',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                      // hintStyle: GoogleFonts.workSans(
                      //   fontSize: 28
                      // ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RefreshIndicator(
                onRefresh: () async {
                  await _postController.getAllPosts();
                },
                child: Container(
                  width: double.infinity,
                  child: Obx(() {
                    return _postController.isLoading.value ?
                    const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: _postController.posts.value.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => PostDetail(
                                posts: _postController.posts.value[index],
                              ));
                            },
                            child: BlogWidget(
                              posts: _postController.posts.value[index],
                            ),
                          );
                        }
                      );
                  }
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}