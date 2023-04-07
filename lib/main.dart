import 'package:flutter/material.dart';
import 'package:phone_test_task/screens/main_screen.dart';
import 'package:phone_test_task/styles/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test task',
      theme: ThemeData(
        primarySwatch: AppColors.primarySwatchColor,
      ),
      home: const MainScreen(),
    );
  }
}
