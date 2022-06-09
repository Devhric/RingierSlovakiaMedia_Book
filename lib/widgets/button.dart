import 'package:books/utils/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({Key? key, required this.label, required this.onPressed})
      : super(key: key);

  String label;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius),
        ),
        minimumSize: const Size.fromHeight(40),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
