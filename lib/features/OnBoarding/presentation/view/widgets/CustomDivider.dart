import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey,
        height: 1,
        width: size.width * .3,
        // width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
