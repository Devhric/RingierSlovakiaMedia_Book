import 'dart:convert';
import 'dart:io';

import 'package:books/models/book_model.dart';
import 'package:books/network/responses/books_model_response.dart';
import 'package:books/utils/tuple.dart';
import 'package:http/http.dart' as http;

class BookApi {
  static const String _version = "1.0";
  static const String _endPoint = "https://api.itbook.store";
  static const String _successCode = "0";

  static Future<BooksModelResponse?> getBooks(String query, int page) async {

    try {
      final response = await http.get(
        Uri.parse("$_endPoint/$_version/search/$query/$page"),
        headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        },
      );
      if (response.statusCode == 200) {
        final item = jsonDecode(response.body);
        if (item["error"] == _successCode) {

          final books = (item["books"] as List<dynamic>)
              .map((value) => BookModel.fromJson(value))
          .toList();

          final total = int.parse(item["total"].toString());

          return BooksModelResponse(total: total, books: books);
        }
      } else {
        print("Error getBooks() -> statusCode: ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
