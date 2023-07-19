import 'package:flutter/material.dart';
import 'package:flutter_blog/logic/models/post_model.dart';
import 'package:flutter_portabletext/flutter_portabletext.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({super.key, required this.post});

  final PostModel post;
  static const String routeName = '/post_detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              post.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            _showImage(),
            // TODO: Customize the PortableTextRichText widget so it can also render image
            SizedBox(
              width: double.infinity,
              child: PortableTextRichText(
                portableText: post.content,
                onTapLink: (value) => _launchURL(value!),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _showImage() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: Hero(
        tag: post.hashCode,
        child: Image.network(
          post.imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
