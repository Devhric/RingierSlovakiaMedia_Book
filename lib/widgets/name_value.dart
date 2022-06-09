import 'package:books/utils/constants.dart';
import 'package:flutter/material.dart';

class NameValue extends StatelessWidget {
  NameValue({Key? key, required this.name, required this.value})
      : super(key: key);
  String name;
  String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kContentPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
