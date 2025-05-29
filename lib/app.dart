import 'package:flutter/material.dart';
import 'package:flutter_community/routes/app_router.dart';

class FlutterCommunityApp extends StatelessWidget {
  const FlutterCommunityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter 커뮤니티',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}