import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton(
      {super.key, required this.text, this.color, this.color2, this.onPressed});
  final String text;
  final Color? color;
  final Color? color2;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(
          size.width - 48,
          size.height * .06,
        ),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontWeight: FontWeight.bold,
        color: color2,
        fontSize: 20,
      ),
    );
  }
}
