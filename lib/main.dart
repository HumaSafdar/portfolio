import 'package:flutter/material.dart';
import 'package:portfolio_company/dashboard.dart';
import 'package:portfolio_company/home_page.dart';
import 'package:portfolio_company/spalsh_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
