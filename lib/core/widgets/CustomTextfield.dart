import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.controller,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.fillcolor,
    this.icon2,
  });
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Color? fillcolor;
  final IconData? icon2;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIconColor: Colors.grey,
          fillColor: fillcolor ?? Colors.white,
          // suffixIcon: Icon(icon),
          filled: true,
          // fillColor: Colors.white,
          prefixIcon: Icon(icon2),
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          border: outineMethod(),
          enabledBorder: outineMethod(),
          focusedBorder: outineMethod()),
    );
  }

  OutlineInputBorder outineMethod() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white));
  }
}
