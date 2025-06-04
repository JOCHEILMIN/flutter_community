import 'package:flutter/material.dart';
import 'package:flutter_community/screens/detail/detail_flutter.dart';
import 'package:flutter_community/widgets/post_card.dart';


class CategoryFlutter extends StatelessWidget {
  const CategoryFlutter({super.key});

  static final List<Post> allPosts = [
    Post(
      id: 1,
      categoryId: 1,
      title: 'Flutter 기초',
      author: '홍길동',
      date: '2025-05-29',
      summary: '플러터 핵심 개념 정리하기',
    ),
    Post(
      id: 2,
      categoryId: 1,
      title: 'Flutter 상태관리',
      author: '김철수',
      date: '2025-05-28',
      summary: 'Provider, Riverpod 사용법 비교',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 게시물 목록'),
      ),
      body: ListView.builder(
        itemCount: allPosts.length,
        itemBuilder: (context, index) {
          final post = allPosts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: PostCard(
              title: post.title,
              summary: post.summary,
              author: post.author,
              date: post.date,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailFlutter(
                        postId: post.id
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
class Post {
  final int id;
  final int categoryId;
  final String title;
  final String author;
  final String date;
  final String summary;
  Post({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.author,
    required this.date,
    required this.summary,
  });
}