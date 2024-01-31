import 'package:chat_app/core/widgets/CustomText.dart';

import 'package:flutter/material.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          const CustomText(
            text: 'Home',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
