import 'package:books/models/book_model.dart';
import 'package:books/network/book_api.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  List<BookModel> books = [];
  bool loading = false;
  int _page = 1;
  String _query = "";

  set query(String query) {
    _query = query;
  }

  _incrementPage() => _page++;

  resetSearch() {
    _page = 1;
    books = [];
  }

  searchBooks() async {
    loading = true;
    print("Page: $_page");
    final response = await BookApi.getBooks(_query, _page);
    final hasAllRecords = books.length == response?.total;

    if (response != null && !hasAllRecords) {
      books.addAll(response.books);
      _incrementPage();
    }
    loading = false;

    notifyListeners();
  }
}
