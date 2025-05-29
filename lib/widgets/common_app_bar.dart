import 'package:flutter/material.dart';

/// 상단 앱바
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            Row(
              children: const [
                Text('F', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                SizedBox(width: 4),
                CircleAvatar(radius: 5, backgroundColor: Colors.blueAccent),
              ],
            ),

            const SizedBox(width: 12),

            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('검색 페이지로 이동 or 검색기능 나중에 구현');
                },
                child: Container(
                  height: 36,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.search, size: 18, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('검색어를 입력해주세요', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                print('알림 페이지로 이동');
              }
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}