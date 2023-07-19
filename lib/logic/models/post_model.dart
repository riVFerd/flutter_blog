import 'package:dio/dio.dart';
import 'package:flutter_portabletext/portable_text.dart';
import 'package:intl/intl.dart';

class PostModel {
  final String title;
  final String imageUrl;
  final String author;
  final String date;
  final List<PortableText> content;
  static final _dio = Dio();

  const PostModel({
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.date,
    required this.content,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    final List<PortableText> listPortableText = [];
    for (var dynamicPort in (json['content'] as List<dynamic>)) {
      if (dynamicPort['children'] == null) continue;
      final portableText = PortableText.fromJson(dynamicPort);
      listPortableText.add(portableText);
    }
    return PostModel(
      title: json['title'],
      imageUrl: json['imageUrl'],
      author: json['author']['nickname'],
      date: DateFormat('M/d/yyyy').format(DateTime.parse(json['publishedAt'])),
      content: listPortableText,
    );
  }

  // fetch posts from api, requires page index for pagination
  static Future<List<PostModel>> getPosts(int pageIndex,
      {String? categorySlug}) async {
    List<PostModel> posts;
    final response = await _dio.get(
        'https://rivferd.my.id/api/postList?page=$pageIndex${categorySlug != null ? '&category=$categorySlug' : ''}');
    if (response.statusCode == 200) {
      posts = (response.data as List<dynamic>)
          .map((postJson) => PostModel.fromJson(postJson))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }

    return posts;
  }
}
