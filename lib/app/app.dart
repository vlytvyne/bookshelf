import 'package:bookshelf/ui/screens/library_screen.dart';
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
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
              width: 2,
            ),
          ),
        ),
      ),
      home: const LibraryScreen(),
    );
  }
}