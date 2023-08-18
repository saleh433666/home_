import 'package:flutter/material.dart';

class DTextButton extends StatelessWidget {
  const DTextButton({
    super.key,
    required this.function,
    this.text,
  });

  final VoidCallback function;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: function, child: Text(text!.toUpperCase()));
  }
}
