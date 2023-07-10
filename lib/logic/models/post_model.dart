class PostModel {
  const PostModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.author,
    required this.date,
  });
  
  final int id;
  final String title;
  final String imageUrl;
  final String author;
  final String date;
}