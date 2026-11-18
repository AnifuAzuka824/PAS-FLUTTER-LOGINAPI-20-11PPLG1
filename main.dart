import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dapur Nusantara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE85D3D)),
        scaffoldBackgroundColor: const Color(0xFFF7F3EC),
        useMaterial3: true,
      ),
      initialRoute: Routes.login,
      getPages: Routes.pages,
    );
  }
}
