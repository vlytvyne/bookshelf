import 'dart:ffi';

import 'package:bookshelf/ui/screens/add_book_screen.dart';
import 'package:bookshelf/ui/screens/book_details_screen.dart';
import 'package:bookshelf/ui/screens/library_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const library = '/';
  static const bookDetails = '/details/:id';
  static const addBook = '/add_book';
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.library,
      builder: (BuildContext context, GoRouterState state) {
        return const LibraryScreen();
      },
    ),
    GoRoute(
      path: Routes.bookDetails,
      builder: (BuildContext context, GoRouterState state) {
        final id = int.parse(state.pathParameters['id']!);
        return BookDetailsScreen(id);
      },
    ),
    GoRoute(
      path: Routes.addBook,
      builder: (BuildContext context, GoRouterState state) {
        return const AddBookScreen();
      },
    ),
  ],
);