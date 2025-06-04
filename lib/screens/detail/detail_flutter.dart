import 'package:flutter/material.dart';


class DetailFlutter extends StatelessWidget {
  final int postId;

  const DetailFlutter({
    super.key,
    required this.postId,
  });

// 여기서 allPosts 리스트를 정의해 둡니다.
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
    // postId에 대응하는 Post 객체를 찾아 옵니다.
    final post = allPosts.firstWhere(
          (p) => p.id == postId,
      orElse: () => throw Exception('해당 ID의 게시물을 찾을 수 없습니다: $postId'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(post.title), // 찾아낸 post.title을 사용
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              '작성자: ${post.author}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            Text(
              '날짜: ${post.date}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Divider(height: 32),
            Text(
              post.summary,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
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

  const Post({
    required this.id,
    required this.categoryId,
    required this.title,
    required this.author,
    required this.date,
    required this.summary,
  });
}
