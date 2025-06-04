import 'package:flutter/material.dart';
import 'package:flutter_community/screens/detail/detail_javaScript.dart';
import 'package:flutter_community/widgets/post_card.dart';

class CategoryJavaScript extends StatelessWidget {
  const CategoryJavaScript({super.key});

  static final List<Post> allPosts = [
    Post(
      id: 1,
      categoryId: 3,
      title: 'Java Stream API',
      author: '박민수',
      date: '2025-05-26',
      summary: '스트림을 활용한 데이터 처리 예제',
    ),
    Post(
      id: 2,
      categoryId: 3,
      title: 'JavaScript 기초',
      author: '최은지',
      date: '2025-05-25',
      summary: 'JS 변수, 함수, 배열 기초 문법',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Java Script 게시물 목록'),
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
                    builder: (context) => DetailJavaScript(postId: post.id),
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