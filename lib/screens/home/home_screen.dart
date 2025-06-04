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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('카테고리 선택')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(cat.name, style: const TextStyle(fontSize: 18)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
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
                  // 그 외의 카테고리가 생길 경우, 디폴트 동작
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
