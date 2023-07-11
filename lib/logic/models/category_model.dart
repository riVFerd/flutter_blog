import 'package:dio/dio.dart';

class CategoryModel {
  CategoryModel({
    required this.categoryId,
    required this.categoryName,
  });

  final String categoryId;
  final String categoryName;
  static final _dio = Dio();

  static Future<List<CategoryModel>> getCategories() async {
    var rawResponse = await _dio.get('https://rivferd.my.id/api/categories');

    return rawResponse.data.map<CategoryModel>((category) {
      return CategoryModel(
        categoryId: category['_id'],
        categoryName: category['name'],
      );
    }).toList();
  }
}
