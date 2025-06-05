// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_community/screens/category/category_flutter.dart';
import 'package:flutter_community/screens/category/category_java.dart';
import 'package:flutter_community/screens/category/category_javaScript.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Category> categories = const [
    Category(
      id: 1,
      name: 'Flutter',
      color: Color(0xFF1976D2),
      gradient: LinearGradient(
        colors: [Color(0xFF1976D2), Colors.white],
        stops: [0.5, 2.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      id: 2,
      name: 'Java',
      color: Color(0xFF388E3C),
      gradient: LinearGradient(
        colors: [Color(0xFF388E3C), Colors.white],
        stops: [0.5, 2.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      id: 3,
      name: 'JavaScript',
      color: Color(0xFF4A148C),
      gradient: LinearGradient(
        colors: [Color(0xFF4A148C), Colors.white],
        stops: [0.5, 2.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      id: 4,
      name: 'React',
      color: Color(0xFF40C4FF),
      gradient: LinearGradient(
        colors: [Color(0xFF40C4FF), Colors.white],
        stops: [0.5, 2.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      id: 5,
      name: 'Git',
      color: Color(0xFF303030),
      gradient: LinearGradient(
        colors: [Color(0xFF303030), Colors.white],
        stops: [0.5, 2.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      id: 6,
      name: 'Docker',
      color: Color(0xFF0db7ed),
      gradient: LinearGradient(
        colors: [Color(0xFF0db7ed), Colors.white],
        stops: [0.5, 2.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      id: 7,
      name: 'Kotlin',
      color: Color(0xFF7f52ff),
      gradient: LinearGradient(
        colors: [Color(0xFF7f52ff), Colors.white],
        stops: [0.5, 2.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    Category(
      id: 8,
      name: 'Swift',
      color: Color(0xFFffac45),
      gradient: LinearGradient(
        colors: [Color(0xFFffac45), Colors.white],
        stops: [0.5, 2.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
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
                    gradient: cat.gradient,
                    color: cat.color,
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
  final Color color;
  final Gradient gradient;

  const Category({
    required this.id,
    required this.name,
    required this.color,
    required this.gradient,
  });
}
