import 'package:books/provider/books_provider.dart';
import 'package:books/utils/constants.dart';
import 'package:books/widgets/book_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // load more items when user is on the bottom of the list
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<BooksProvider>().searchBooks();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (context.watch<BooksProvider>().books.isEmpty == true)
          ? const Center(
              child: Text("List is empty"),
            )
          : ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: context.watch<BooksProvider>().books.length + 1,
              itemBuilder: (context, index) {
                return (context.watch<BooksProvider>().books.length == index)
                    ? const Center(
                        child: Padding(
                        padding: EdgeInsets.all(kContentPadding),
                        child: CircularProgressIndicator.adaptive(),
                      ))
                    : BookTile(
                        bookModel: context.watch<BooksProvider>().books[index],
                      );
              },
            ),
    );
  }
}
