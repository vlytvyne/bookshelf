import 'package:bookshelf/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BookshelfApp extends StatelessWidget {

  const BookshelfApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookshelf',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.purple, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple, width: 2),
          ),
          // errorStyle: ts.size12.red.bold,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}