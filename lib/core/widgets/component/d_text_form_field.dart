import 'package:flutter/material.dart';

class DTextFormField extends StatelessWidget {
  const DTextFormField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.keyboardType,
    this.onTap,
    this.suffixPressed,
    this.onChanged,
    this.onSubmitted,
    this.validate,
     this.obscureText=false,

  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText ;
  final VoidCallback? onTap;
  final Function()? suffixPressed;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final FormFieldValidator? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: suffixPressed, icon: Icon(suffixIcon))
              : null,
          border: const OutlineInputBorder(),
          prefixIcon: Icon(prefixIcon)),
      obscureText: obscureText,
      keyboardType: keyboardType,
      onTap: onTap,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      validator: validate,
    );
  }
}
