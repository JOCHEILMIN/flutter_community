import 'package:flutter/material.dart';
import 'package:flutter_community/widgets/common_app_bar.dart';
import 'package:flutter_community/widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      {
        'title': 'Flutter에서 ListView vs Column 차이점',
        'author': 'Henry',
        'date': '2025-05-29',
        'summary': '스크롤이 필요하면 ListView를 쓰자. Column은 오버플로우 발생 가능.'
      },
      {
        'title': 'Riverpod vs Provider 완전 정리',
        'author': '철민',
        'date': '2025-05-28',
        'summary': '두 상태관리 라이브러리의 차이와 실제 사용법을 비교해보았습니다.'
      },
    ];

    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(
            title: post['title']!,
            summary: post['summary']!,
            author: post['author']!,
            date: post['date']!,
            onTap: () {
              print('상세 페이지로 이동 (나중에 구현)');
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('글 작성 페이지로 이동 (나중에 구현)');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
