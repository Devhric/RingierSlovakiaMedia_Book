import 'package:books/provider/books_provider.dart';
import 'package:books/screens/search_screen.dart';
import 'package:books/utils/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => BooksProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books store',
      theme: AppTheme.theme,
      home: const SearchScreen(),
    );
  }
}
