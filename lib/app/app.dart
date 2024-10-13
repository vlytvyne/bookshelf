import 'package:bookshelf/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BookshelfApp extends StatelessWidget {

  const BookshelfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookshelf',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}