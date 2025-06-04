// lib/screens/post_detail_screen.dart
import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String date;
  final String summary;

  const PostDetailScreen({
    Key? key,
    required this.title,
    required this.author,
    required this.date,
    required this.summary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('작성자: $author', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 4),
            Text('날짜: $date', style: Theme.of(context).textTheme.bodyMedium),
            const Divider(height: 32),
            Text(summary, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
