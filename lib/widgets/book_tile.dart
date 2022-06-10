import 'package:books/models/book_model.dart';
import 'package:books/screens/book_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class BookTile extends StatelessWidget {
  const BookTile({Key? key, required this.bookModel}) : super(key: key);
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(bookModel.title ?? ""),
        subtitle:
            Text(bookModel.subtitle ?? "", overflow: TextOverflow.ellipsis),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              bookModel.price ?? "",
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        leading: SizedBox(
          width: 50,
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: bookModel.imageUrl ?? "",
          ),
        ),
        onTap: () => _goToBookDetail(context),
      ),
    );
  }

  _goToBookDetail(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BookDetailScreen(bookModel: bookModel),
        ),
      );
}
