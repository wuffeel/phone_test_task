import 'package:flutter/material.dart';
import 'package:phone_test_task/screens/main_page.dart';

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
        primarySwatch: Colors.deepPurple
      ),
      home: const MainPage(),
    );
  }
}
