// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_community/screens/category/category_flutter.dart';
import 'package:flutter_community/screens/category/category_java.dart';
import 'package:flutter_community/screens/category/category_javaScript.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Category> categories = const [
    Category(id: 1, name: 'Flutter'),
    Category(id: 2, name: 'Java'),
    Category(id: 3, name: 'JavaScript'),
    Category(id: 4, name: 'React'),
    Category(id: 5, name: 'Git'),
    Category(id: 6, name: 'Docker'),
    Category(id: 7, name: 'Kotlin'),
    Category(id: 8, name: 'Swift'),
  ];

  static const List<Color> backgroundColors = [
    Color(0xFF1976D2), // Flutter
    Color(0xFF388E3C), // Java (Spring)
    Color(0xFFF7DF1E), // JavaScript
    Color(0xFF40C4FF), // React
    Color(0xFF303030), // Git
    Color(0xFF0db7ed), // Docker
    Color(0xFF7f52ff), // Kotlin
    Color(0xFFffac45), // Swift
  ];

  @override
  Widget build(BuildContext context) {
    final chunked = _chunk(categories, 4);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '모두의 개발',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: chunked.length,
        separatorBuilder: (_, __) => Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(0.5),
            ),
          ),
        ),
        itemBuilder: (context, sectionIndex) {
          final group = chunked[sectionIndex];

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: group.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final cat = group[index];
              final bgColor = backgroundColors[categories.indexOf(cat) % backgroundColors.length];

              return GestureDetector(
                onTap: () {
                  switch (cat.id) {
                    case 1:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryFlutter()));
                      break;
                    case 2:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryJava()));
                      break;
                    case 3:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const CategoryJavaScript()));
                      break;
                    default:
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${cat.name} 화면이 준비되지 않았습니다.')),
                      );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [bgColor.withOpacity(0.85), bgColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: bgColor.withOpacity(0.4),
                        blurRadius: 6,
                        offset: const Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      cat.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// 4개씩 묶는 헬퍼
  List<List<Category>> _chunk(List<Category> list, int size) {
    List<List<Category>> chunks = [];
    for (var i = 0; i < list.length; i += size) {
      chunks.add(list.sublist(i, i + size > list.length ? list.length : i + size));
    }
    return chunks;
  }
}

class Category {
  final int id;
  final String name;
  const Category({required this.id, required this.name});
}