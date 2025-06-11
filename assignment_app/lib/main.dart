import 'package:assignment_app/home_screen.dart';
import 'package:assignment_app/providers/bottom_nav_provider.dart';
import 'package:assignment_app/providers/tab_provider.dart';
import 'package:flutter/material.dart';
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
        ChangeNotifierProvider(create: (context) => TabProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
      ],
      child: MaterialApp(
        title: 'Assignment App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
