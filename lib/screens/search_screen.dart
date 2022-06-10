import 'package:books/utils/constants.dart';
import 'package:books/widgets/book_list.dart';
import 'package:books/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books store"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          right: kContentPadding,
          left: kContentPadding,
          top: kContentPadding,
        ),
        child: Column(
          children: const [SearchBar(), BookList()],
        ),
      ),
    );
  }
}
