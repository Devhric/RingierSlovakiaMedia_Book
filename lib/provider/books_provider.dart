import 'package:books/models/book_model.dart';
import 'package:books/network/book_api.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  List<BookModel> books = [];
  bool loading = false;
  bool canBeLoadMore = true;
  int _page = 1;
  String _query = "";
  String? errorMessage = "List is empty"; //default error message before first search

  set query(String query) {
    _query = query;
  }

  _incrementPage() => _page++;

  resetSearch() {
    _page = 1;
    books = [];
  }

  searchBooks() async {
    errorMessage = null;
    _setLoading(true);
    await loadMoreBooks();
    _setLoading(false);
  }

  loadMoreBooks() async {
    final response = await BookApi.getBooks(_query, _page);

    canBeLoadMore = response?.total != 0 ;
    errorMessage =
        response?.total == 0 && books.isEmpty ? "No books found!" : null;

    if (response != null && canBeLoadMore) {
      books.addAll(response.books);
      _incrementPage();
    }

    notifyListeners();
  }

  _setLoading(bool isLoading) {
    loading = isLoading;
    notifyListeners();
  }
}
