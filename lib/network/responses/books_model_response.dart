import 'package:books/models/book_model.dart';

class BooksModelResponse {
  int total;
  List<BookModel> books;

  BooksModelResponse({
    required this.total,
    required this.books,
  });
}
