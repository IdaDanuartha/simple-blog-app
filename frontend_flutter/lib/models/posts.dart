// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
    int id;
    int adminId;
    String title;
    String body;
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    List<Category> categories;

    PostModel({
        required this.id,
        required this.adminId,
        required this.title,
        required this.body,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.categories,
    });

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        adminId: json["admin_id"],
        title: json["title"],
        body: json["body"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "admin_id": adminId,
        "title": title,
        "body": body,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    int postId;
    String categoryName;
    DateTime createdAt;
    DateTime updatedAt;

    Category({
        required this.id,
        required this.postId,
        required this.categoryName,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        postId: json["post_id"],
        categoryName: json["category_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "post_id": postId,
        "category_name": categoryName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
