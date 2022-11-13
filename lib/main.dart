
import 'package:animationtasks/task_3/social_app_demo.dart';
import 'package:animationtasks/task_4/pages/home_page.dart';
import 'package:animationtasks/task_4/pages/login_page.dart';
import 'package:animationtasks/task_5/Pages/HomePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CardTask(),
    );
  }
}

