import 'package:flutter/material.dart';

class DMaterialButton extends StatelessWidget {
  const DMaterialButton({
    super.key,
    this.function,
    this.width = double.infinity,
    this.height = 50,
    this.radius = 15,
    this.background = Colors.blue,
    this.isUppercase = false,
    this.text = 'login',
  });

  final double width;
  final double height;
  final double radius;
  final Color background;
  final bool isUppercase;
  final String text;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        height: height,
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
          maxLines: 1,
        ),
      ),
    );
  }
}
