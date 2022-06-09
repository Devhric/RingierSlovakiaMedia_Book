import 'package:books/models/book_model.dart';
import 'package:books/utils/constants.dart';
import 'package:books/utils/redirect.dart';
import 'package:books/widgets/button.dart';
import 'package:books/widgets/name_value.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BookDetailScreen extends StatelessWidget {
  const BookDetailScreen({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book detail"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(kContentPadding),
          child: Column(
            children: [
              image,
              buyButton,
              _space,
              title,
              subtitle,
              NameValue(name: "Price:", value: bookModel.price ?? ""),
              NameValue(name: "ISBN:", value: bookModel.isbn13 ?? "")
            ],
          ),
        ),
      ),
    );
  }

  get title => Text(
        bookModel.title ?? "",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
      );

  get subtitle => Text(
        bookModel.subtitle ?? "",
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18.0),
      );

  get image => Column(
        children: [
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: bookModel.imageUrl ?? "",
          ),
        ],
      );

  get buyButton => Button(
        label: "Buy",
        onPressed: () => Redirect.toWeb(url: bookModel.url),
      );

  get _space => const SizedBox(
        height: kContentPadding,
      );
}
