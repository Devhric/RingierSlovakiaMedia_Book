import 'package:books/utils/constants.dart';
import 'package:books/widgets/book_list.dart';
import 'package:books/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
      }
    });
  }

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
