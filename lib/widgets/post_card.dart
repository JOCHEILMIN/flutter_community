import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String summary;
  final String author;
  final String date;
  final VoidCallback? onTap;

  const PostCard({
    super.key,
    required this.title,
    required this.summary,
    required this.author,
    required this.date,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 제목
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),

            /// 요약
            Text(
              summary,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),

            /// 작성자 / 날짜
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  author,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 12),

            /// 구분선
            const Divider(height: 1, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}