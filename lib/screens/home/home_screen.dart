// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_community/screens/category/category_flutter.dart';
import 'package:flutter_community/screens/category/category_java.dart';
import 'package:flutter_community/screens/category/category_javaScript.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // 예시 카테고리 데이터
  final List<Category> categories = const [
    Category(id: 1, name: 'Flutter'),
    Category(id: 2, name: 'Java'),
    Category(id: 3, name: 'JavaScript'),
    Category(id: 4, name: 'React'),
    // … 필요하다면 더 추가
  ];

  static const List<Color> backgroundColors = [
    Color(0xFF1976D2), // 진한 보라 (Flutter)
    Color(0xFF7B1FA2), // 보라 (Java)
    Color(0xFF4A148C), // 파랑 (JavaScript)
    Color(0xFF388E3C), // 초록 (React)
    // 더 많은 카테고리가 있다면 여기 색을 추가하세요
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('카테고리 선택')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          // index에 따라 배경색을 순환해서 가져옵니다.
          // (만약 카테고리가 backgroundColors보다 많으면 나머지 연산 %를 써서 재사용할 수도 있습니다)
          final bgColor = backgroundColors[index % backgroundColors.length];

          return Container(
            // 높이를 고정하거나 padding을 주면 버튼처럼 보이게 할 수 있습니다.
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: BoxDecoration(
              color: bgColor,
              gradient: LinearGradient(
                colors: [bgColor.withOpacity(0.8), bgColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: ListTile(
              title: Text(
                cat.name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // 오른쪽 화살표 아이콘도 흰색으로 통일
              trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.white),
              onTap: () {
                // 카테고리 id에 따라 각 화면으로 분기
                switch (cat.id) {
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CategoryFlutter(),
                      ),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CategoryJava(),
                      ),
                    );
                    break;
                  case 3:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CategoryJavaScript(),
                      ),
                    );
                    break;
                  default:
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${cat.name} 화면이 준비되지 않았습니다.')),
                    );
                    break;
                }
              },
            ),
          );
        },
      ),
    );
  }
}

class Category {
  final int id;
  final String name;
  const Category({required this.id, required this.name});
}
