import 'package:flutter/material.dart';

class CutomIconsSite extends StatelessWidget {
  const CutomIconsSite({
    super.key,
    required this.image,
    this.color,
    this.color2,
  });
  final String image;
  final Color? color;
  final Color? color2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 31,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: color,
            backgroundImage: AssetImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
