import 'package:flutter/material.dart';
import 'package:game_of_thrones_app/core/theme/app_theme.dart';
import 'package:game_of_thrones_app/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomePage()
    );
  }
}

