import 'package:books/provider/books_provider.dart';
import 'package:books/utils/constants.dart';
import 'package:books/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [_textField, _space, _searchButton, _space],
      ),
    );
  }

  get _textField => Card(
        child: TextFormField(
          textInputAction: TextInputAction.search,
          onFieldSubmitted: (value) => _search(),
          controller: _searchController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "The field cannot be empty!";
            }
            return null;
          },
          decoration: const InputDecoration(
            hintText: "Enter keyword",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      );

  get _searchButton => Button(
        onPressed: () {
          // dismiss keyboard
          FocusManager.instance.primaryFocus?.unfocus();
          _search();
        },
        label: "Search",
      );

  get _space => const SizedBox(
        height: kContentPaddingHalf,
      );

  _search() {
    if (_formKey.currentState!.validate()) {
      context.read<BooksProvider>().resetSearch();
      context.read<BooksProvider>().query = _searchController.text;
      context.read<BooksProvider>().searchBooks();
    }
  }
}
