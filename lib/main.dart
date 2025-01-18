import 'package:flutter/material.dart';
import 'package:portfolio_company/index_provide.dart';
import 'package:portfolio_company/projects.dart';
import 'package:portfolio_company/routing_provider.dart';
import 'package:portfolio_company/spalsh_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RoutingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectedIndexProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
