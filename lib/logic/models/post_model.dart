import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class PostModel {
  final String title;
  final String imageUrl;
  final String author;
  final String date;
  static final _dio = Dio();

  const PostModel({
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.date,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      title: json['title'],
      imageUrl: json['imageUrl'],
      author: json['author']['nickname'],
      date: DateFormat('M/d/yyyy').format(DateTime.parse(json['publishedAt'])),
    );
  }

  // fetch posts from api, requires page index for pagination
  static Future<List<PostModel>> getPosts(int pageIndex) async {
    List<PostModel> posts;
    final response =
        await _dio.get('https://rivferd.my.id/api/postList?page=$pageIndex');
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
